unit uClassPedidos;

interface
uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls,
  FireDAC.DApt,Firedac.Stan.Param, FireDAC.Comp.Client, Data.DB,UDMPedidos;
type
  TPedidos = class
  private
    FCodigo: Integer;
    FDt_Emissao: TDate;
    FId_Cliente: Integer;
    FVlr_Total: double;
    FItens:TFDMemTable;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Dt_Emissao: TDate read FDt_Emissao write FDt_Emissao;
    property Id_Cliente: integer read FId_Cliente write FId_Cliente;
    property Vlr_Total: double read FVlr_Total write FVlr_Total;
    property Itens: TFDMemTable read FItens write FItens;
    function LocalizaPedido(const nCodigo:Integer):Boolean;
    function GravarPedido:Boolean;
    function CancelarPedido:Boolean;
  end;
implementation
function TPedidos.LocalizaPedido(const nCodigo: Integer): Boolean;
var vAchou:Boolean;
  QryPedido: TFDQuery;
  QryItens: TFDQuery;
begin
  vAchou := false;
  try
    FCodigo := 0;
    QryPedido := TFDQuery.Create( nil );
    QryPedido.Connection := DMConexao.FDConexao;
    QryPedido.SQL.Add('select id_pedido,dt_emissao,id_cliente,vlr_total from pedidos where id_pedido=:id_codigo');
    QryPedido.ParamByName('id_codigo').AsInteger := nCodigo;
    QryPedido.Open();
    if(QryPedido.RecordCount>0) then
    begin
      FCodigo     := nCodigo;
      FDt_Emissao := QryPedido.FieldByName('dt_emissao').AsDateTime;
      FId_Cliente := QryPedido.FieldByName('id_cliente').AsInteger;
      FVlr_Total  := QryPedido.FieldByName('vlr_total').AsFloat;
      vAchou     := true;
    end;
    QryPedido.Close;
    QryPedido.Destroy;
    QryItens := TFDQuery.Create(nil);
    QryItens.Connection := DMConexao.FDConexao;
    QryItens.SQL.Add('select id_produto,quantidade,vlr_unitario,p.descricao from pedidos_produtos');
    QryItens.SQL.Add('left join produtos p on p.codigo=id_produto');
    QryItens.SQL.Add('where num_pedido=:id_pedido');
    QryItens.ParamByName('id_pedido').AsInteger := nCodigo;
    QryItens.Open();
    While(not QryItens.eof) do
    Begin
       FItens.Insert;
       FItens.FieldByName('codproduto').AsInteger    := QryItens.FieldByName('id_produto').AsInteger;
       FItens.FieldByName('descricao').AsString      := QryItens.FieldByName('descricao').AsString;
       FItens.FieldByName('quantidade').AsInteger    := QryItens.FieldByName('quantidade').AsInteger;
       FItens.FieldByName('valorunitario').AsInteger := QryItens.FieldByName('vlr_unitario').AsInteger;
       FItens.Post;
       QryItens.Next
    End;
    except
      on E : Exception do
        raise Exception.Create(E.Message);
  end;
  Result:=vAchou;
end;
function TPedidos.GravarPedido: Boolean;
var vGravou:Boolean;
  QryExecuta: TFDQuery;
  QryItens: TFDQuery;
begin
  vGravou := false;
  try
    FCodigo := 0;
    QryExecuta := TFDQuery.Create( nil );
    QryExecuta.Connection := DMConexao.FDConexao;
    DMConexao.FDConexao.StartTransaction;
    // Gravando tabela de pedidos
    QryExecuta.SQL.Add('insert into pedidos(dt_emissao,id_cliente,vlr_total) ');
    QryExecuta.SQL.Add('values(:dt_emissao,:id_cliente,:vlr_total)');
    QryExecuta.ParamByName('dt_emissao').AsDate    := FDt_Emissao;
    QryExecuta.ParamByName('id_cliente').AsInteger := FId_Cliente;
    QryExecuta.ParamByName('vlr_total').AsFloat     := FVlr_Total;
    // Buscando o codigo do pedido
    QryExecuta.ExecSQL;
    QryExecuta.SQL.Text := 'SELECT LAST_INSERT_ID()';
    QryExecuta.Open;
    FCodigo := QryExecuta.Fields[0].AsInteger;
    QryExecuta.Close;
    // Inserir o itens
    FItens.First;
    while(not FItens.Eof) do
    begin
       QryExecuta.SQL.Clear;
       QryExecuta.SQL.Add('insert into pedidos_produtos(num_pedido,id_produto,quantidade,vlr_unitario,vlr_total) ');
       QryExecuta.SQL.Add('values(:num_pedido,:id_produto,:quantidade,:vlr_unitario,:vlr_total)');
       QryExecuta.ParamByName('num_pedido').AsInteger := FCodigo;
       QryExecuta.ParamByName('id_produto').AsInteger := FItens.FieldByName('codproduto').AsInteger;
       QryExecuta.ParamByName('quantidade').AsInteger := FItens.FieldByName('quantidade').AsInteger;
       QryExecuta.ParamByName('vlr_unitario').AsFloat := FItens.FieldByName('valorunitario').AsFloat;
       QryExecuta.ParamByName('vlr_total').AsFloat    := FItens.FieldByName('valorunitario').AsFloat*FItens.FieldByName('quantidade').AsInteger;
       QryExecuta.ExecSQL;
       FItens.Next;
    end;
    DMConexao.FDConexao.Commit;
    QryExecuta.Destroy;
    vGravou := true;
    except
      on E : Exception do
      begin
        DMConexao.FDConexao.Rollback;
        raise Exception.Create(E.Message);
      end;
  end;
  Result:=vGravou;
end;
function TPedidos.CancelarPedido: Boolean;
var vCancelou:Boolean;
    QryExecuta: TFDQuery;
begin
  try
    vCancelou := false;
    QryExecuta := TFDQuery.Create( nil );
    QryExecuta.Connection := DMConexao.FDConexao;
    DMConexao.FDConexao.StartTransaction;
    // Excluindo pedidos. OBS: Itens do pedido sera excluido pela FK
    QryExecuta.SQL.Add('delete from pedidos where id_pedido=:id_pedido');
    QryExecuta.ParamByName('id_pedido').AsInteger := Codigo;
    QryExecuta.ExecSQL;
    DMConexao.FDConexao.Commit;
    QryExecuta.Destroy;
    vCancelou := true;
    except
      on E : Exception do
      begin
        DMConexao.FDConexao.Rollback;
        raise Exception.Create(E.Message);
      end;
  end;
  Result:=vCancelou;

end;
end.

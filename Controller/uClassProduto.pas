unit uClassProduto;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls,
  FireDAC.DApt,Firedac.Stan.Param, FireDAC.Comp.Client, Data.DB,UDMPedidos;

type
  TProduto = class
  private
    FCodigo: Integer;
    FDescricao: string;
    FPreco: double;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property Preco: double read FPreco write FPreco;
    function LocalizaProduto(const nCodigo:Integer):Boolean;
  end;

implementation

function TProduto.LocalizaProduto(const nCodigo: Integer): Boolean;
var vAchou:Boolean;
  QryProduto: TFDQuery;
begin
  vAchou := false;
  try
    FCodigo := 0;
    FDescricao   := '';
    FPreco := 0;
    QryProduto := TFDQuery.Create( nil );
    QryProduto.Connection := DMConexao.FDConexao;
    QryProduto.SQL.Add('select codigo,descricao,preco from produtos where codigo=:id_codigo');
    QryProduto.ParamByName('id_codigo').AsInteger := nCodigo;
    QryProduto.Open();
    if(QryProduto.RecordCount>0) then
    begin
      FCodigo    := nCodigo;
      FDescricao := QryProduto.FieldByName('descricao').AsString;
      FPreco     := QryProduto.FieldByName('preco').AsCurrency;
      vAchou     := true;
    end;
    QryProduto.Close;
    QryProduto.Destroy;
    except
      on E : Exception do
        raise Exception.Create(E.Message);
  end;
  Result:=vAchou;
end;

end.

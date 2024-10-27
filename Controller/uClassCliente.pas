unit uClassCliente;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls,
  FireDAC.DApt,Firedac.Stan.Param, FireDAC.Comp.Client, Data.DB,UDMPedidos;

type
  TCliente = class
  private
    FCodigo: Integer;
    FNome: string;
    FCidade: string;
    FUF: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Cidade: string read FCidade write FCidade;
    property UF: string read FUF write FUF;
    function LocalizaCliente(const nCodigo:Integer):Boolean;
  end;

implementation

function TCliente.LocalizaCliente(const nCodigo: Integer): Boolean;
var vAchou:Boolean;
  QryCliente: TFDQuery;
begin
  vAchou := false;
  try
    FCodigo := 0;
    FNome   := '';
    FCidade := '';
    FUf     := '';
    QryCliente := TFDQuery.Create( nil );
    QryCliente.Connection := DMConexao.FDConexao;
    QryCliente.SQL.Add('select codigo,nome,cidade,uf from clientes where codigo=:id_codigo');
    QryCliente.ParamByName('id_codigo').AsInteger := nCodigo;
    QryCliente.Open();
    if(QryCliente.RecordCount>0) then
    begin
      FCodigo := nCodigo;
      FNome   := QryCliente.FieldByName('nome').AsString;
      FCidade := QryCliente.FieldByName('cidade').AsString;
      FUf     := QryCliente.FieldByName('uf').AsString;
      vAchou := true;
    end;
    QryCliente.Close;
    QryCliente.Destroy;
    except
      on E : Exception do
        raise Exception.Create(E.Message);
  end;
  Result:=vAchou;
end;

end.

unit UDMPedidos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Forms,System.IniFiles,Vcl.Dialogs;

type
  TDMConexao = class(TDataModule)
    FDConexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uConfigINI;

{$R *.dfm}

procedure TDMConexao.DataModuleCreate(Sender: TObject);
var
  iArq: TIniFile;
  nTentativas: word;
  vFileIni:String;
begin

  try
    iArq := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Banco.ini');
    FDConexao.Params.Clear;
    FDPhysMySQLDriverLink1.VendorLib:= iArq.ReadString('BD','VENDORLIB',ExtractFilePath(Application.ExeName) + 'libmysql.dll');
    FDConexao.Params.Values['Server'] := iArq.ReadString('BD','SERVIDOR','LOCALHOST');
    FDConexao.Params.Values['DRIVERID'] := 'MySQL';
    FDConexao.Params.Values['Database'] := iArq.ReadString('BD', 'DATABASE', 'wkdelphi112');
    FDConexao.Params.Values['Port'] := iArq.ReadString('BD', 'PORT', '3306');
    FDConexao.Params.Values['User_name'] := iArq.ReadString('BD', 'USER_NAME', 'root');
    FDConexao.Params.Values['Password'] := iArq.ReadString('BD', 'PASSWORD', 'root');

    try
      FDConexao.Connected := true;
    Except on e:exception do
      begin
       //Abrir Configuracao
       frmConfigurar.ShowModal;
      end;
    end;

  Finally
    iArq.Free;
  end;

end;

end.

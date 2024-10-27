unit uConfigINI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,System.IniFiles,UDMPedidos;

type
  TfrmConfigurar = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel8: TPanel;
    edtServidor: TEdit;
    edtPorta: TEdit;
    edtNomeBanco: TEdit;
    edtUserName: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    EdtDll: TEdit;
    Button1: TButton;
    btnGravar: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigurar: TfrmConfigurar;

implementation

{$R *.dfm}

procedure TfrmConfigurar.btnGravarClick(Sender: TObject);
var
  iArq: TIniFile;
begin

    iArq     := TIniFile.Create( ExtractFilePath(Application.ExeName) + 'Banco.ini' );
    DMConexao.FDConexao.Params.Clear;
    iArq.WriteString('BD','SERVIDOR',edtServidor.Text);
    iArq.WriteString('BD', 'DATABASE', edtNomeBanco.Text);
    iArq.WriteString('BD', 'PORT', edtPorta.Text);
    iArq.WriteString('BD', 'USER_NAME', edtUserName.Text);
    iArq.WriteString('BD', 'PASSWORD', edtSenha.Text);
    iArq.WriteString('BD','VENDORLIB',EdtDll.Text);
    DMConexao.FDPhysMySQLDriverLink1.VendorLib     := iArq.ReadString('BD','VENDORLIB',ExtractFilePath(Application.ExeName) + 'libmysql.dll');
    DMConexao.FDConexao.Params.Values['DRIVERID']  := 'MySQL';
    DMConexao.FDConexao.Params.Values['Server']    := iArq.ReadString('BD','SERVIDOR','LOCALHOST');
    DMConexao.FDConexao.Params.Values['Database']  := iArq.ReadString('BD', 'DATABASE', 'wkdelphi112');
    DMConexao.FDConexao.Params.Values['Port']      := iArq.ReadString('BD', 'PORT', '3306');
    DMConexao.FDConexao.Params.Values['User_name'] := iArq.ReadString('BD', 'USER_NAME', 'root');
    DMConexao.FDConexao.Params.Values['Password']  := iArq.ReadString('BD', 'PASSWORD', 'root');

    try
      frmConfigurar.Tag := 0;
      DMConexao.FDConexao.Connected := true;
      frmConfigurar.Tag := 1;
      ShowMessage('Conectado com sucesso.');
      close;

    Except on e:exception do
      begin
        ShowMessage('Não foi possivel conectar. Entrar em contato com o suporte');
      end;
    end;

end;

procedure TfrmConfigurar.Button1Click(Sender: TObject);
begin
  OpenDialog1.FileName := EdtDll.Text;
  if(OpenDialog1.Execute) then
     EdtDll.Text := OpenDialog1.FileName;
end;

procedure TfrmConfigurar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if frmConfigurar.Tag=0 then
     Application.Terminate;
end;

procedure TfrmConfigurar.FormCreate(Sender: TObject);
var
  iArq: TIniFile;
  vFileIni:String;
begin

  try
    vFileIni := ExtractFilePath(Application.ExeName) + 'Banco.ini';
    iArq     := TIniFile.Create( vFileIni );
    if(not FileExists(vFileIni)) then
    begin
      iArq.WriteString('BD','SERVIDOR','LOCALHOST');
      iArq.WriteString('BD', 'DATABASE', 'wkdelphi112');
      iArq.WriteString('BD', 'PORT', '3306');
      iArq.WriteString('BD', 'USER_NAME', 'root');
      iArq.WriteString('BD', 'PASSWORD', 'root');
      iArq.WriteString('BD','VENDORLIB',ExtractFilePath(Application.ExeName) + 'libmysql.dll');
    end;
    edtServidor.Text  := iArq.ReadString('BD','SERVIDOR','LOCALHOST');
    edtNomeBanco.Text := iArq.ReadString('BD', 'DATABASE', 'wkdelphi112');
    edtPorta.Text     := iArq.ReadString('BD', 'PORT', '3306');
    edtUserName.Text  := iArq.ReadString('BD', 'USER_NAME', 'root');
    edtSenha.Text     := iArq.ReadString('BD', 'PASSWORD', 'root');
    EdtDll.Text       := iArq.ReadString('BD','VENDORLIB',ExtractFilePath(Application.ExeName) + 'libmysql.dll');
  Finally
    iArq.Free;
  end;

end;

end.

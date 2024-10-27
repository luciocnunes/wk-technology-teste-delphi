program WKLucioNunes;

uses
  Vcl.Forms,
  UPedidos in 'View\UPedidos.pas' {frmPedidos},
  UDMPedidos in 'View\UDMPedidos.pas' {DMConexao: TDataModule},
  uClassCliente in 'Controller\uClassCliente.pas',
  uClassProduto in 'Controller\uClassProduto.pas',
  uClassPedidos in 'Model\uClassPedidos.pas',
  uConfigINI in 'View\uConfigINI.pas' {frmConfigurar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.CreateForm(TfrmConfigurar, frmConfigurar);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.Run;
end.

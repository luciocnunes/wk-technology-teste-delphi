unit UPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,uClassCliente,uClassProduto, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls,
  FireDAC.Stan.StorageBin, Vcl.ComCtrls;

type
  TfrmPedidos = class(TForm)
    pnDados: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lbCliente: TLabel;
    lbLocalizacao: TLabel;
    EdtCodCliente: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    lbdescricao: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbValorTotal: TLabel;
    edtCodProduto: TEdit;
    edtQuantidade: TEdit;
    btInserirProduto: TBitBtn;
    edtValorUni: TEdit;
    DBGrid1: TDBGrid;
    DBETotal: TDBEdit;
    BtGravar: TBitBtn;
    dtEmissao: TDateTimePicker;
    FDMTItens: TFDMemTable;
    FDMTItenscodproduto: TIntegerField;
    FDMTItensdescricao: TStringField;
    FDMTItensquantidade: TIntegerField;
    FDMTItensvalorunitario: TFloatField;
    FDMTItensvalortotal: TFloatField;
    FDMTItenstotalpedido: TAggregateField;
    DSItens: TDataSource;
    Label5: TLabel;
    EdtPedido: TEdit;
    btConsultar: TBitBtn;
    btCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure EdtCodClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodClienteExit(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure edtValorUniKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure FDMTItensCalcFields(DataSet: TDataSet);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FDMTItensBeforeDelete(DataSet: TDataSet);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtCodClienteChange(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure EdtPedidoExit(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure edtValorUniExit(Sender: TObject);
    procedure EdtPedidoChange(Sender: TObject);
    procedure btInserirProdutoClick(Sender: TObject);
    procedure EdtPedidoKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    procedure calculartotalproduto;
    procedure EnterToNextControl(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure limpaprodutos;
    procedure limpacliente;
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;
  Cliente:TCliente;
  Produto:TProduto;

implementation

uses uClassPedidos;

{$R *.dfm}

procedure TfrmPedidos.calculartotalproduto;
begin
   if(edtQuantidade.Text='') then
     edtQuantidade.Text:='0';
   if(edtValorUni.Text='') then
     edtValorUni.Text:='0';
   edtValorUni.Text:= FormatFloat('#,##0.00', StrToFloat( edtValorUni.Text));
   lbValorTotal.Caption := FormatFloat('#,##0.00', StrToInt(edtQuantidade.Text)* StrToFloat( edtValorUni.Text));

end;

procedure TfrmPedidos.limpaprodutos;
begin
   edtCodProduto.ReadOnly        := false;
   edtCodProduto.Text            := '';
   lbdescricao.Caption           := '';
   edtQuantidade.Text            := '';
   edtValorUni.Text              := '';
   lbValorTotal.Caption          := '';

end;



procedure TfrmPedidos.limpacliente;
begin
   dtEmissao.DateTime     := now;
   EdtCodCliente.Text     := '';
   lbCliente.Caption      := '';
   lbLocalizacao.Caption  := '';
end;

procedure TfrmPedidos.btCancelarClick(Sender: TObject);
var id_pedido:Integer;
    Pedido:TPedidos;
begin
   limpaprodutos;
   limpacliente;
   FDMTItens.Close;
   FDMTItens.Open;

   Pedido:=TPedidos.Create;
   Pedido.Itens := TFDMemTable.Create(nil);
   Pedido.Itens.data := FDMTItens.Data;
   id_pedido := -1;
   if(EdtPedido.Text<>'') then
      id_pedido := StrToInt(EdtPedido.Text);
   if(Pedido.LocalizaPedido(id_pedido)) then
   begin
     EdtCodCliente.Text := IntToStr(Pedido.Id_Cliente);
     EdtCodCliente.OnExit(Sender);
     dtEmissao.DateTime := Pedido.Dt_Emissao;
     FDMTItens.close;
     FDMTItens.Data := Pedido.Itens.data;
     if application.messageBox(pwidechar('Deseja excluir este Pedido?'), 'Confirmação', mb_YesNo+MB_ICONQUESTION) = mrYes Then
        if(Pedido.CancelarPedido) then
        Begin
          limpaprodutos;
          limpacliente;
          FDMTItens.Close;
          FDMTItens.Open;
        End
        else
           ShowMessage('Erro ao cancelar o pedido. Entrar em contato com o suporte.');
   end
   else
      ShowMessage('Pedido não encotrado.');
   btConsultar.Visible := true;
   btCancelar.Visible  := true;
   Pedido.Destroy;


end;

procedure TfrmPedidos.btConsultarClick(Sender: TObject);
var id_pedido:Integer;
    Pedido:TPedidos;
begin
   limpaprodutos;
   limpacliente;
   FDMTItens.Close;
   FDMTItens.Open;

   Pedido:=TPedidos.Create;
   Pedido.Itens := TFDMemTable.Create(nil);
   Pedido.Itens.data := FDMTItens.Data;
   id_pedido := -1;
   if(EdtPedido.Text<>'') then
      id_pedido := StrToInt(EdtPedido.Text);
   if(Pedido.LocalizaPedido(id_pedido)) then
   begin
     EdtCodCliente.Text := IntToStr(Pedido.Id_Cliente);
     EdtCodCliente.OnExit(Sender);
     dtEmissao.DateTime := Pedido.Dt_Emissao;
     FDMTItens.close;
     FDMTItens.Data := Pedido.Itens.data;
   end
   else
      ShowMessage('Pedido não encotrado.');
   btConsultar.Visible := true;
   btCancelar.Visible := true;
   Pedido.Destroy;
   EdtPedido.SetFocus;

end;

procedure TfrmPedidos.BtGravarClick(Sender: TObject);
var Pedido:TPedidos;
begin
   if((EdtCodCliente.Text='') or (FDMTItens.RecordCount=0)) then
   begin
     ShowMessage('Pedido incompleto. Verifique.');
     Abort;
   end;

   Pedido:=TPedidos.Create;
   Pedido.Dt_Emissao := dtEmissao.DateTime;
   Pedido.Id_Cliente := StrToInt(EdtCodCliente.Text);
   Pedido.Vlr_Total  := FDMTItenstotalpedido.AsVariant;
   Pedido.Itens      := TFDMemTable.Create(nil);
   // Copia a estrutura da tabela de origem para a tabela de destino com os dados
   Pedido.Itens.Data := FDMTItens.Data;
   if(Pedido.GravarPedido) then
   Begin
      ShowMessage('Pedido Número:'+IntToStr(Pedido.Codigo)+ sLineBreak + 'Gravado com sucesso.');
      limpaprodutos;
      limpacliente;
      FDMTItens.Close;
      FDMTItens.Open;
   End;
   Pedido.Destroy;
end;

procedure TfrmPedidos.btInserirProdutoClick(Sender: TObject);
begin
   if((edtCodProduto.Text='') or(edtQuantidade.Text='')) then
     abort;
   if(btInserirProduto.Caption = 'Inserir') then
     FDMTItens.Insert()
   else
     FDMTItens.Edit();

   FDMTItenscodproduto.AsString   := edtCodProduto.Text;
   FDMTItensdescricao.AsString    := lbdescricao.Caption;
   FDMTItensquantidade.AsInteger  := StrToInt(edtQuantidade.Text);
   FDMTItensvalorunitario.AsFloat := StrToFloat(edtValorUni.Text);
   FDMTItens.Post();

   btInserirProduto.Caption        := 'Inserir';
   limpaprodutos;
   edtCodProduto.SetFocus();



end;

procedure TfrmPedidos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if(EdtPedido.Text <> '')  then
    Abort;
  if(key=#13) then
  begin
    edtCodProduto.Text  := FDMTItenscodproduto.AsString;
    lbdescricao.Caption := FDMTItensdescricao.AsString;
    edtQuantidade.Text  := FDMTItensquantidade.AsString;
    edtValorUni.Text    := FDMTItensvalorunitario.AsString;
    btInserirProduto.Caption := 'Alterar';
    edtCodProduto.ReadOnly := true;
    edtQuantidade.SetFocus();
  end;

end;

procedure TfrmPedidos.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(EdtPedido.Text <> '')  then
    Abort;
  if(key=VK_DELETE) and not (ssCtrl in Shift)  then
    FDMTItens.Delete; // Pergunta de confirmacao esta no before delete

end;

procedure TfrmPedidos.EdtCodClienteChange(Sender: TObject);
begin
   btConsultar.Visible := EdtCodCliente.Text = '';
   btCAncelar.Visible  := EdtCodCliente.Text = '';
end;

procedure TfrmPedidos.EdtCodClienteExit(Sender: TObject);
Var id_Cliente:integer;
begin
  id_cliente := -1;
  if(EdtCodCliente.Text<>'') then
    id_cliente := StrToInt(EdtCodCliente.Text);
  Cliente.LocalizaCliente(id_cliente);
  lbCliente.Caption     := Cliente.Nome;
  lbLocalizacao.Caption := Cliente.Cidade+'/'+Cliente.UF;

end;

procedure TfrmPedidos.EdtCodClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key In ['0' .. '9',  #8, #9, #27]) then
    Key := #0;

end;

procedure TfrmPedidos.edtCodProdutoExit(Sender: TObject);
Var id_Produto:integer;
begin
  id_Produto := -1;
  if(edtCodProduto.Text<>'') then
    id_Produto := StrToInt(edtCodProduto.Text);
  Produto.LocalizaProduto(id_Produto);
  lbDescricao.Caption    := Produto.Descricao;
  edtValorUni.Text       := FormatFloat('#,##0.00', Produto.Preco);
  edtQuantidade.Text     := '1';
  lbValorTotal.Caption := FormatFloat('#,##0.00', StrToInt(edtQuantidade.Text)* StrToFloat( edtValorUni.Text));


end;

procedure TfrmPedidos.edtCodProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key In ['0' .. '9', ',', #8, #9,  #27]) then
    Key := #0;

end;

procedure TfrmPedidos.EdtPedidoChange(Sender: TObject);
begin
   BtGravar.Enabled         := EdtPedido.Text = '';
   btInserirProduto.Enabled := EdtPedido.Text = '';
   EdtCodCliente.Enabled    := EdtPedido.Text = '';
   dtEmissao.Enabled        := EdtPedido.Text = '';
end;

procedure TfrmPedidos.EdtPedidoExit(Sender: TObject);
begin
   if(EdtPedido.Text = '') then
   begin
     limpaprodutos;
     limpacliente;
     FDMTItens.Close;
     FDMTItens.Open;
   end;

end;

procedure TfrmPedidos.EdtPedidoKeyPress(Sender: TObject; var Key: Char);
begin
   if((key=#13) and (EdtPedido.Text<>'')) then
      btConsultar.Click;

end;

procedure TfrmPedidos.edtQuantidadeExit(Sender: TObject);
begin
  calculartotalproduto;
end;

procedure TfrmPedidos.edtValorUniExit(Sender: TObject);
begin
   calculartotalproduto;
end;

procedure TfrmPedidos.edtValorUniKeyPress(Sender: TObject; var Key: Char);
begin
  if (not(Key In ['0' .. '9',',',  #8, #9,  #27])) or ((key in[',']) and (pos(',',TEdit(Sender).Text)>0))   then
    Key := #0;
end;

procedure TfrmPedidos.FDMTItensBeforeDelete(DataSet: TDataSet);
begin
   if application.messageBox(pwidechar('Deseja excluir este item?'), 'Confirmação', mb_YesNo+MB_ICONQUESTION) = mrNo Then
      Abort;

end;

procedure TfrmPedidos.FDMTItensCalcFields(DataSet: TDataSet);
begin
   FDMTItensvalortotal.AsFloat := FDMTItensquantidade.AsInteger*FDMTItensvalorunitario.AsFloat;
end;

procedure TfrmPedidos.FormCreate(Sender: TObject);
var
  i: Integer;
begin
   // Tecla ENTER ir para proximo
   for i := 0 to ComponentCount - 1 do
     if ((Components[i] is TEdit) or (Components[i] is TDateTimePicker)) then
     begin
        TEdit(Components[i]).OnKeyDown:=EnterToNextControl;
     end;

   Cliente := TCliente.Create;
   Produto := TProduto.Create;
   limpaprodutos;
   limpacliente;


end;


procedure TfrmPedidos.EnterToNextControl(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then  // Verifica se a tecla Enter foi pressionada
  begin
    Key := 0;  // Remove o efeito de "beep"
    Perform(WM_NEXTDLGCTL, 0, 0);  // Move o foco para o próximo controle
  end;
end;


end.

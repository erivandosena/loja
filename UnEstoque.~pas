unit UnEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Menus, IBQuery, DBCtrls, ComCtrls, Mask,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Barcode, abarra;

type
  TFrmEstoque = class(TForm)
    Panel: TPanel;
    GroupBox_Estoque: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DS_Codigo: TDataSource;
    IBQueryCodigo: TIBQuery;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Fechar1: TMenuItem;
    IBQuery_Estoque: TIBQuery;
    Ds_Estoque: TDataSource;
    DBGrid_Estoque: TDBGrid;
    IBQuery_EstoqueCOD_ESTO: TIntegerField;
    IBQuery_EstoqueCODIGO: TIBStringField;
    IBQuery_EstoqueCATEGORIA_PRODUTO: TIBStringField;
    IBQuery_EstoqueDESCRICAO: TIBStringField;
    IBQuery_EstoqueUNIDADE_ESTOQUE: TIBStringField;
    IBQuery_EstoqueQUANTIDADE_ESTOQUE: TIntegerField;
    IBQuery_EstoqueESTOQUE_MINIMO: TIntegerField;
    IBQuery_EstoqueVALOR_CUSTO: TIBBCDField;
    IBQuery_EstoqueVALOR_LUCRO: TIBBCDField;
    IBQuery_EstoqueVALOR_VENDA: TIBBCDField;
    IBQuery_EstoqueFORNECEDOR: TIBStringField;
    DataSource1: TDataSource;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label4: TLabel;
    DBComboBox2: TDBComboBox;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBComboBox1: TDBComboBox;
    Panel1: TPanel;
    SbNovo: TBitBtn;
    SbSalvar: TBitBtn;
    SbExcluir: TBitBtn;
    SbCancelar: TBitBtn;
    SbAnterior: TBitBtn;
    SbProximo: TBitBtn;
    SbAtualiza: TBitBtn;
    BtnOpcoes: TBitBtn;
    SbFechar: TBitBtn;
    IBQuery_EstoqueLUCRO_PRODUTO: TFloatField;
    IBQuery_EstoqueIMPOSTO_PRODUTO: TFloatField;
    Barcode1: TBarcode;
    ABarra1: TABarra;
    BtnManutencao: TBitBtn;
    BtnFechar: TBitBtn;
    Label_Prod: TLabel;
    MEdit_Prod: TMaskEdit;
    procedure DS_CodigoStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SbSalvarClick(Sender: TObject);
    procedure SbExcluirClick(Sender: TObject);
    procedure SbCancelarClick(Sender: TObject);
    procedure SbAtualizaClick(Sender: TObject);
    procedure SbProximoClick(Sender: TObject);
    procedure SbAnteriorClick(Sender: TObject);
    procedure SbNovoClick(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure DBGrid_EstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid_EstoqueDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSource1StateChange(Sender: TObject);
    procedure DBGrid_EstoqueKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOpcoesClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid_EstoqueDblClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure MEdit_ProdKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdit_ProdKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEstoque: TFrmEstoque;
  Novo_Cad, EAN, CODIGO, DESCRICAO, VALOR: String;
  Percentual1, Percentual2, Percentual3, QuantEst, ValUnit, ValTot: Real;

implementation

uses UnDm, UnPrincipal, UnTerminal;

{$R *.dfm}

procedure TFrmEstoque.SbSalvarClick(Sender: TObject);
begin
IBQueryCodigo.Close;
IBQueryCodigo.Open;
//if DBEdit1.Text = '' then
//begin
//ShowMessage('Preencha o campo "'+Label1.Caption+'"');
//DBEdit1.SetFocus;
if Dm.IBDS_ESTOQUECODIGO.AsString = '' then
begin
EAN:= FrmPrincipal.RetZero(Dm.IBDS_ESTOQUECOD_ESTO.AsString, 12);
// Gera o código de barras alternativo.
ABarra1.Codigo:= EAN;
ABarra1.Visible:= True;
ABarra1.Repaint;
ShowMessage('O código alternativo "'+ABarra1.Codigo+ABarra1.Digito+'" será adicionado no campo "'+Label1.Caption+'".');
Dm.IBDS_ESTOQUECODIGO.AsString:= ABarra1.Codigo+ABarra1.Digito;
//end;
Exit;
end else
if DBComboBox1.Text = '' then
begin
ShowMessage('Preencha o campo "'+Label2.Caption+'"');
DBComboBox1.SetFocus;
Exit;
end else
if DBEdit5.Text = '' then
begin
ShowMessage('Preencha o campo "'+Label3.Caption+'"');
DBEdit5.SetFocus;
Exit;
end else
if DBComboBox2.Text = '' then
begin
ShowMessage('Preencha o campo "'+Label4.Caption+'"');
DBComboBox2.SetFocus;
Exit;
end else
if DBEdit6.Text = '' then
begin
ShowMessage('Preencha o campo "'+Label5.Caption+'"');
DBEdit6.SetFocus;
Exit;
end else
if DBEdit7.Text = '' then
begin
ShowMessage('Preencha o campo "'+Label6.Caption+'"');
DBEdit7.SetFocus;
Exit;
end else
if DBEdit2.Text = '' then
begin
ShowMessage('Preencha o campo "'+Label7.Caption+'"');
DBEdit2.SetFocus;
Exit;
end else
if DBEdit3.Text = '' then
begin
ShowMessage('Preencha o campo "'+Label8.Caption+'"');
DBEdit3.SetFocus;
Exit;
end else
if DBEdit4.Text = '' then
begin
ShowMessage('Preencha o campo "'+Label9.Caption+'"');
DBEdit4.SetFocus;
Exit;
end else
(*if DBEdit8.Text = '' then
begin
ShowMessage('Preencha o campo "'+Label10.Caption+'"');
DBEdit8.SetFocus;
Exit;
end else  *)
(*if DBEdit9.Text = '' then
begin
ShowMessage('Preencha o campo "'+Label11.Caption+'"');
DBEdit9.SetFocus;
Exit;
end else *)
Percentual1:= Dm.IBDS_ESTOQUEIMPOSTO_PRODUTO.AsFloat / 100;
Percentual1:= Percentual1 * Dm.IBDS_ESTOQUEVALOR_CUSTO.AsFloat;

Percentual2:= Dm.IBDS_ESTOQUELUCRO_PRODUTO.AsFloat / 100;
Percentual2:= Percentual2 * Dm.IBDS_ESTOQUEVALOR_CUSTO.AsFloat;

Dm.IBDS_ESTOQUEVALOR_LUCRO.AsFloat:= Percentual2;

Dm.IBDS_ESTOQUEVALOR_VENDA.AsFloat:= Dm.IBDS_ESTOQUEVALOR_CUSTO.AsFloat + Percentual1 + Percentual2;

(*if DBEdit10.Text = '' then
begin
ShowMessage('Preencha o campo "'+Label12.Caption+'"');
DBEdit10.SetFocus;
Exit;
end else *)
// Testa o código de barras informado.
//EAN:= DBEdit1.Text;
//ABarra1.Codigo:= EAN;
//ABarra1.Visible:= True;
//ABarra1.Repaint;
//Dm.IBDS_ESTOQUECODIGO.AsString:= ABarra1.Codigo+ABarra1.Digito;
Screen.Cursor := crHourGlass;
if DataSource1.State = dsInsert then
begin
if not IBQueryCodigo.Locate('CODIGO', DBEdit1.text, []) then
begin
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_ESTOQUE.Post;
Dm.IBDS_ESTOQUE.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;

//QuantEst:= Dm.IBDS_ESTOQUEQUANTIDADE_ESTOQUE.AsInteger;
//ValUnit:= Dm.IBDS_ESTOQUEVALOR_UNITARIO.AsFloat;
//ValTot:= QuantEst * ValUnit;
Dm.IBDS_ESTOQUE.Edit;
//Dm.IBDS_ESTOQUEVALOR_TOTAL.AsFloat:= ValTot;
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_ESTOQUE.Post;
Dm.IBDS_ESTOQUE.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
DBEdit1.SetFocus;
Screen.Cursor := crDefault;
Exit;
end else
ShowMessage('Não é possível salvar os dados, o Produto de código: "'+DBEdit1.Text+'" já está cadastrado, informe outro.');
Dm.IBDS_ESTOQUE.Edit;
DBEdit1.SetFocus;
Screen.Cursor := crDefault;
Exit;
end else
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_ESTOQUE.Post;
Dm.IBDS_ESTOQUE.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;

//QuantEst:= Dm.IBDS_ESTOQUEQUANTIDADE_ESTOQUE.AsInteger;
//ValUnit:= Dm.IBDS_ESTOQUEVALOR_UNITARIO.AsFloat;
//ValTot:= QuantEst * ValUnit;
Dm.IBDS_ESTOQUE.Edit;
//Dm.IBDS_ESTOQUEVALOR_TOTAL.AsFloat:= ValTot;
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_ESTOQUE.Post;
Dm.IBDS_ESTOQUE.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
Screen.Cursor := crDefault;
DBEdit1.SetFocus;
end;

procedure TFrmEstoque.SbExcluirClick(Sender: TObject);
begin
if MessageBox(0,'Deseja realmente excluir este produto?','Pergunta',mb_yesno+mb_iconquestion)=6  then
begin
Dm.IBDS_ESTOQUE.Delete;
Dm.IBDS_ESTOQUE.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
DataSource1StateChange(FrmEstoque);
DBEdit1.SetFocus;
end;
end;

procedure TFrmEstoque.SbCancelarClick(Sender: TObject);
begin
if Novo_Cad <> '1' then
begin
if MessageBox(0,'Você tem certeza que deseja cancelar a edição deste produto?','Pergunta',mb_yesno+mb_iconquestion)=6  then
begin
Dm.IBDS_ESTOQUE.Cancel;
Dm.IBDS_ESTOQUE.CancelUpdates;
Dm.IBTransaction.RollbackRetaining;
SbNovo.SetFocus;
Exit;
end;
end else
if MessageBox(0,'Você tem certeza que deseja cancelar a edição deste novo cadastro de produto?','Pergunta',mb_yesno+mb_iconquestion)=6  then
begin
Dm.IBDS_ESTOQUE.Cancel;
Dm.IBDS_ESTOQUE.CancelUpdates;
Dm.IBTransaction.RollbackRetaining;
Novo_Cad:= '';
SbNovo.SetFocus;
Exit;
end;
DBEdit1.SetFocus;
end;

procedure TFrmEstoque.DS_CodigoStateChange(Sender: TObject);
begin
 SbNovo.Enabled           := DataSource1.State in [dsBrowse];
 SbExcluir.Enabled        := (DataSource1.State in [dsBrowse]) and (Dm.IBDS_ESTOQUE.RecordCount > 0);
 SbAtualiza.Enabled       := (DataSource1.State in [dsBrowse]) and (Dm.IBDS_ESTOQUE.RecordCount > 0);
 SbSalvar.Enabled         := DataSource1.State in [dsInsert,dsEdit];
 SbCancelar.Enabled       := DataSource1.State in [dsInsert,dsEdit];
 SbAnterior.Enabled       := (DataSource1.State in [dsBrowse]) and ( NOT Dm.IBDS_ESTOQUE.BOF);
 SbProximo.Enabled        := (DataSource1.State in [dsBrowse]) and ( NOT Dm.IBDS_ESTOQUE.EOF);
end;

procedure TFrmEstoque.FormShow(Sender: TObject);
begin
FrmEstoque.Top:=100;
FrmEstoque.Left:=0;
FrmEstoque.Height:= 453;
IBQuery_Estoque.Open;
//if FrmTerminal.Active = True then
//begin
//  FrmEstoque.MEdit_Prod.Visible:= True;
//  FrmEstoque.Label_Prod.Visible:= True;
//end;
//  ADICIONA PRODUTOS
//Screen.Cursor := crHourGlass;
//    DBComboBox1.Items.Clear;
//    Dm.IBDS_PRODUTO.First;
 //   if not Dm.IBDS_PRODUTO.Eof then
 //   repeat
 //   { seus comandos para a tabela }
 //   DBComboBox1.Items.Add(Dm.IBDS_PRODUTODESCRICAO.AsString);
 //   Dm.IBDS_PRODUTO.Next;
 //   until Dm.IBDS_PRODUTO.Eof;
//Screen.Cursor := crDefault;
//if Dm.IBDS_EMPRESANOME_EMPRESARIAL.AsString = '' then
//begin
//FrmProdutos.Caption:= FrmProdutos.Caption;
////Exit;
//end else
//FrmProdutos.Caption:= FrmProdutos.Caption+' - '+Dm.IBDS_EMPRESANOME_FANTASIA.AsString;
end;

procedure TFrmEstoque.SbAtualizaClick(Sender: TObject);
begin
Dm.IBDS_ESTOQUE.close;
Dm.IBDS_ESTOQUE.Open;
Dm.IBDS_ESTOQUE.Refresh;
end;

procedure TFrmEstoque.SbProximoClick(Sender: TObject);
begin
Dm.IBDS_ESTOQUE.Next;
DataSource1StateChange(FrmEstoque);
end;

procedure TFrmEstoque.SbAnteriorClick(Sender: TObject);
begin
Dm.IBDS_ESTOQUE.Prior;
DataSource1StateChange(FrmEstoque);
end;

procedure TFrmEstoque.SbNovoClick(Sender: TObject);
begin
IBQueryCodigo.Close;
IBQueryCodigo.Open;
Novo_Cad:= '1';
Dm.IBDS_ESTOQUE.Last;
Dm.IBDS_ESTOQUE.Append;
DBEdit1.SetFocus;
end;

procedure TFrmEstoque.Fechar1Click(Sender: TObject);
begin
Close;
end;

procedure TFrmEstoque.DBGrid_EstoqueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if IBQuery_Estoque.Active = False then
begin
Abort;
Exit;
end;
end;

procedure TFrmEstoque.DBGrid_EstoqueDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if not odd(IBQuery_Estoque.RecNo) then // se for impar
// se a célula não está selecionada
if not (gdSelected in State) then
begin
// define uma cor de fundo
DBGrid_Estoque.Canvas.Brush.Color:= $00E7F1E7;
DBGrid_Estoque.Canvas.FillRect(Rect); // pinta a célula
// pinta o texto padrão
DBGrid_Estoque.DefaultDrawDataCell(rect,column.Field,State);
end;
end;

procedure TFrmEstoque.DataSource1StateChange(Sender: TObject);
begin
SbNovo.Enabled           := DataSource1.State in [dsBrowse];
 SbExcluir.Enabled        := (DataSource1.State in [dsBrowse]) and (Dm.IBDS_ESTOQUE.RecordCount > 0);
 SbAtualiza.Enabled       := (DataSource1.State in [dsBrowse]) and (Dm.IBDS_ESTOQUE.RecordCount > 0);
 SbSalvar.Enabled         := DataSource1.State in [dsInsert,dsEdit];
 SbCancelar.Enabled       := DataSource1.State in [dsInsert,dsEdit];
 SbAnterior.Enabled       := (DataSource1.State in [dsBrowse]) and ( NOT Dm.IBDS_ESTOQUE.BOF);
 SbProximo.Enabled        := (DataSource1.State in [dsBrowse]) and ( NOT Dm.IBDS_ESTOQUE.EOF);
end;

procedure TFrmEstoque.DBGrid_EstoqueKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then
  begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
Dm.IBDS_ESTOQUE.Locate('CODIGO', DBGrid_Estoque.Fields[0].Text, []);
Panel.Caption:= 'CADASTRO DE PRODUTOS';
GroupBox_Estoque.Visible:= True;
GroupBox_Estoque.Top:= 48;
GroupBox_Estoque.Left:= 6;
DBGrid_Estoque.Height:= 100;
FrmEstoque.Height:= 290;
FrmEstoque.Top:= 154;
IBQuery_Estoque.Close;
SbNovo.SetFocus;
end;
end;

procedure TFrmEstoque.BtnOpcoesClick(Sender: TObject);
begin
Panel.Caption:= 'ESTOQUE';
FrmEstoque.Height:= 453;
DBGrid_Estoque.Height:= 293;
GroupBox_Estoque.Visible:= False;
IBQuery_Estoque.Open;
DBGrid_Estoque.SetFocus;
FrmEstoque.Top:=100;
FrmEstoque.Left:=0;
FrmEstoque.Height:= 453;
end;

procedure TFrmEstoque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
IBQuery_Estoque.Close;
end;

procedure TFrmEstoque.DBGrid_EstoqueDblClick(Sender: TObject);
begin
Dm.IBDS_ESTOQUE.Locate('CODIGO', DBGrid_Estoque.Fields[0].Text, []);
Panel.Caption:= 'CADASTRO DE PRODUTOS';
GroupBox_Estoque.Visible:= True;
GroupBox_Estoque.Top:= 48;
GroupBox_Estoque.Left:= 6;
DBGrid_Estoque.Height:= 100;
FrmEstoque.Height:= 290;
FrmEstoque.Top:= 154;
IBQuery_Estoque.Close;
SbNovo.SetFocus;
end;

procedure TFrmEstoque.BtnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TFrmEstoque.MEdit_ProdKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  theText: string;
  p: integer;
begin
  with MEdit_Prod do
    case key of
      8, 13, 46, 37..40: ; // Se for backspace, enter, delete, ou setas, ignora...
      else
      begin
        p := SelStart;
        theText := copy(text, 0, p);
        if IBQuery_Estoque.Locate('DESCRICAO', theText, [loCaseInsensitive, loPartialKey]) then
        begin
          text := IBQuery_Estoque.FieldByName('DESCRICAO').AsString;
          SelStart := p;
          SelLength := length(text) - selStart;
       end;
   end;
end;
end;

procedure TFrmEstoque.MEdit_ProdKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
CODIGO:= IBQuery_EstoqueCODIGO.AsString;
DESCRICAO:= IBQuery_EstoqueDESCRICAO.AsString;
VALOR:= IBQuery_EstoqueVALOR_VENDA.AsString;
Close;
  end;
end;

procedure TFrmEstoque.FormCreate(Sender: TObject);
begin
if Terminal = 1 then
begin
Label_Prod.Visible:= True;
MEdit_Prod.Visible:= True;
Exit;
end else
Label_Prod.Visible:= False;
MEdit_Prod.Visible:= False;
end;

end.

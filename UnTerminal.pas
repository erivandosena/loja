unit UnTerminal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Mask, StdCtrls, Menus, DB, IBCustomDataSet,
  IBQuery, abarra;

type
  TFrmTerminal = class(TForm)
    Panel1: TPanel;
    Panel_Mensagens: TPanel;
    Panel_TerminalLivre: TPanel;
    Panel_Logo: TPanel;
    Panel_Itens: TPanel;
    Image1: TImage;
    Label_TotalSubTotal: TLabel;
    Label_Iten_Desc: TLabel;
    Label_VolTotal: TLabel;
    Panel_Dados: TPanel;
    StatusBar: TStatusBar;
    MainMenu1: TMainMenu;
    Produtos1: TMenuItem;
    Adiciona1: TMenuItem;
    Remove1: TMenuItem;
    Cancela1: TMenuItem;
    Fecha1: TMenuItem;
    Panel2: TPanel;
    Timer1: TTimer;
    Fecha2: TMenuItem;
    Finaliza1: TMenuItem;
    Panel_Venda: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MEdit_Cod: TMaskEdit;
    MEdit_Quant: TMaskEdit;
    MEdit_PrUnit: TMaskEdit;
    MEdit_Desc: TMaskEdit;
    MEdit_Total: TMaskEdit;
    Panel_FechaVenda: TPanel;
    RichEdit_Venda: TRichEdit;
    IBQuery_BuscaProd: TIBQuery;
    Lab_TotalSubTotal: TLabel;
    Lab_Iten_Desc: TLabel;
    Lab_VolTotal: TLabel;
    IBQuery_Venda: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Finaliza1Click(Sender: TObject);
    procedure Fecha1Click(Sender: TObject);
    procedure Cancela1Click(Sender: TObject);
    procedure MEdit_CodKeyPress(Sender: TObject; var Key: Char);
    procedure Produtos1Click(Sender: TObject);
    procedure MEdit_PrUnitKeyPress(Sender: TObject; var Key: Char);
    procedure MEdit_QuantKeyPress(Sender: TObject; var Key: Char);
    procedure MEdit_DescKeyPress(Sender: TObject; var Key: Char);
    procedure MEdit_TotalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTerminal: TFrmTerminal;
  Percentual, ValorTotal: Real;
  VENDA: Integer;

implementation

uses UnPrincipal, UnDm, UnEstoque;

{$R *.dfm}

procedure TFrmTerminal.FormShow(Sender: TObject);
begin
Panel_TerminalLivre.Top:= 96;
Panel_TerminalLivre.Height:= 449;
Panel_Logo.Top:= 96;
Panel_Logo.Height:= 449;
//StatusBar.Panels.Items[0].Text:= 'F1 = Produtos';
//StatusBar.Panels.Items[0].Width:= 95;
//StatusBar.Panels.Items[1].Text:= 'F2 = Adiciona';
//StatusBar.Panels.Items[1].Width:= 95;
//StatusBar.Panels.Items[2].Text:= 'F3 = Remove';
//StatusBar.Panels.Items[2].Width:= 95;
StatusBar.Panels.Items[3].Text:= 'F4 = Abre Venda';
StatusBar.Panels.Items[3].Width:= 95;
//StatusBar.Panels.Items[4].Text:= 'F5 = Canc. Venda';
//StatusBar.Panels.Items[4].Width:= 95;
//StatusBar.Panels.Items[5].Text:= 'F6 = Fecha Venda';
//StatusBar.Panels.Items[5].Width:= 95;
StatusBar.Panels.Items[6].Text:= 'F7 = Finaliza Terminal';
StatusBar.Panels.Items[6].Width:= 95;
end;

procedure TFrmTerminal.Timer1Timer(Sender: TObject);
begin
Panel1.Caption:= TimeToStr(Now)+'          .::Sistema Expresso de Loja::.          '+DateToStr(Date);
end;

procedure TFrmTerminal.FormCreate(Sender: TObject);
begin
Timer1.Enabled:= True;
iOK:= 0;
end;

procedure TFrmTerminal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if iOK <> 625 then
Canclose := False;
Timer1.Enabled:= False;
end;

procedure TFrmTerminal.Finaliza1Click(Sender: TObject);
begin
Dm.IBDS_VENDAS.Close;
iOK := 625;
Close;
end;

procedure TFrmTerminal.Fecha1Click(Sender: TObject);
begin
Panel_Dados.Visible:= True;
Panel_Mensagens.Visible:= True;
Panel_TerminalLivre.Visible:= False;
Panel_Venda.Visible:= True;
Panel_Logo.Height:= 128;
Panel_Logo.Top:= 168;
Panel_Itens.Visible:= True;
StatusBar.Panels.Items[0].Text:= 'F1 = Produtos';
StatusBar.Panels.Items[0].Width:= 95;
StatusBar.Panels.Items[1].Text:= 'F2 = Adiciona';
StatusBar.Panels.Items[1].Width:= 95;
StatusBar.Panels.Items[2].Text:= 'F3 = Remove';
StatusBar.Panels.Items[2].Width:= 95;
StatusBar.Panels.Items[3].Text:= '';
StatusBar.Panels.Items[3].Width:= 0;
StatusBar.Panels.Items[4].Text:= 'F5 = Canc. Venda';
StatusBar.Panels.Items[4].Width:= 95;
StatusBar.Panels.Items[5].Text:= 'F6 = Fecha Venda';
StatusBar.Panels.Items[5].Width:= 95;
StatusBar.Panels.Items[6].Text:= '';
StatusBar.Panels.Items[6].Width:= 0;
Finaliza1.Enabled:= False;
IBQuery_BuscaProd.Open;
Dm.IBDS_VENDAS.Open;
Dm.IBDS_VENDAS.Append;
Dm.IBDS_VENDASNOME_USUARIO.AsString:= Usuario;
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_VENDAS.Post;
Dm.IBDS_VENDAS.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
VENDA:= Dm.IBDS_VENDASCOD_VEND.AsInteger;
Panel_Dados.Caption:= 'Venda: '+FormatFloat('####0000',VENDA)+' Cliente:           TIPO:           FORMA: ';
end;

procedure TFrmTerminal.Cancela1Click(Sender: TObject);
begin
Panel_TerminalLivre.Visible:= True;
Panel_TerminalLivre.Top:= 96;
Panel_TerminalLivre.Height:= 449;
Panel_Logo.Top:= 96;
Panel_Logo.Height:= 449;
Panel_Dados.Visible:= False;
Panel_Mensagens.Visible:= False;
Panel_Venda.Visible:= False;
Panel_Itens.Visible:= False;
StatusBar.Panels.Items[0].Text:= '';
StatusBar.Panels.Items[0].Width:= 0;
StatusBar.Panels.Items[1].Text:= '';
StatusBar.Panels.Items[1].Width:= 0;
StatusBar.Panels.Items[2].Text:= '';
StatusBar.Panels.Items[2].Width:= 0;
StatusBar.Panels.Items[3].Text:= 'F4 = Abre Venda';
StatusBar.Panels.Items[3].Width:= 95;
StatusBar.Panels.Items[4].Text:= '';
StatusBar.Panels.Items[4].Width:= 0;
StatusBar.Panels.Items[5].Text:= '';
StatusBar.Panels.Items[5].Width:= 0;
StatusBar.Panels.Items[6].Text:= 'F7 = Finaliza Terminal';
StatusBar.Panels.Items[6].Width:= 95;
Finaliza1.Enabled:= True;
end;

procedure TFrmTerminal.MEdit_CodKeyPress(Sender: TObject; var Key: Char);
begin
If not( key in['0'..'9',#8,#13] ) then
begin
Abort;
end;
if Key = #13 then
  begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
if not IBQuery_BuscaProd.Locate('CODIGO', MEdit_Cod.Text, []) then
begin
ShowMessage('Produto não encontrado no estoque.');
Exit;
end else
Panel_Mensagens.Caption:= IBQuery_BuscaProd.FieldByName('DESCRICAO').AsString;
Panel_Logo.Caption:= FormatFloat('R$ #,##0.00', IBQuery_BuscaProd.FieldByName('VALOR_VENDA').AsFloat);
MEdit_PrUnit.Text:= FormatFloat('#,##0.00', IBQuery_BuscaProd.FieldByName('VALOR_VENDA').AsFloat);
MEdit_Quant.SetFocus;
end;
end;

procedure TFrmTerminal.Produtos1Click(Sender: TObject);
begin
Terminal:= 1;
FrmEstoque:= TFrmEstoque.Create(Application);
try
  FrmEstoque.ShowModal;
finally
  FrmEstoque.Free;
end;
MEdit_Cod.Text:= CODIGO;
end;

procedure TFrmTerminal.MEdit_PrUnitKeyPress(Sender: TObject;
  var Key: Char);
begin
If not( key in['0'..'9',',',#8,#13] ) then
begin
Abort;
end;
if Key = #13 then
  begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
MEdit_Desc.SetFocus;
end;
end;

procedure TFrmTerminal.MEdit_QuantKeyPress(Sender: TObject; var Key: Char);
begin
If not( key in['0'..'9',#8,#13] ) then
begin
Abort;
end;
if Key = #13 then
  begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
if MEdit_Quant.Text = '' then
begin
MEdit_Quant.Text:= '1';
end;
MEdit_Total.Text:= FormatFloat('#,##0.00', IBQuery_BuscaProd.FieldByName('VALOR_VENDA').AsFloat * StrToFloat(MEdit_Quant.Text));
ValorTotal:= StrToFloat(MEdit_Total.Text);
MEdit_Desc.SetFocus;
end;
end;

procedure TFrmTerminal.MEdit_DescKeyPress(Sender: TObject; var Key: Char);
begin
If not( key in['0'..'9',',',#8,#13] ) then
begin
Abort;
end;
if Key = #13 then
  begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
if MEdit_Desc.Text = '' then
begin
MEdit_Desc.Text:= '0';
if MEdit_Quant.Text = '' then
begin
MEdit_Quant.Text:= '1';
end;
MEdit_Total.Text:= FormatFloat('#,##0.00', IBQuery_BuscaProd.FieldByName('VALOR_VENDA').AsFloat * StrToFloat(MEdit_Quant.Text));
ValorTotal:= StrToFloat(MEdit_Total.Text);
end;
MEdit_Total.Text:= FormatFloat('#,##0.00',  ValorTotal);
Percentual:= StrToFloat(MEdit_Desc.Text) / 100;
Percentual:= Percentual * StrToFloat(MEdit_Total.Text);
MEdit_Total.Text:= FormatFloat('#,##0.00',  StrToFloat(MEdit_Total.Text) - Percentual);
MEdit_Total.SetFocus;
end;
end;

procedure TFrmTerminal.MEdit_TotalKeyPress(Sender: TObject; var Key: Char);
begin
If not( key in['0'..'9',',',#8,#13] ) then
begin
Abort;
end;
if Key = #13 then
  begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
if MEdit_Total.Text = '' then
begin
MEdit_Desc.SetFocus;
Exit;
end else
Lab_TotalSubTotal.Caption:=  FormatFloat('#,##0.00', StrToFloat(Lab_TotalSubTotal.Caption) + StrToFloat(MEdit_Total.Text));
Lab_VolTotal.Caption:= IntToStr(StrToInt(Lab_VolTotal.Caption) + StrToInt(MEdit_Quant.Text));
end;
end;

end.

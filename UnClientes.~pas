unit UnClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Menus, IBQuery, DBCtrls, ComCtrls, Mask,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Barcode, ToolEdit, RXDBCtrl,
  jpeg, ExtDlgs;

type
  TFrmClientes = class(TForm)
    Panel: TPanel;
    DS_Codigo: TDataSource;
    IBQuery_Codigo: TIBQuery;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Fechar1: TMenuItem;
    IBQuery_Clientes: TIBQuery;
    DS_Clientes: TDataSource;
    DBGrid_Clientes: TDBGrid;
    DS_Botoes: TDataSource;
    Barcode1: TBarcode;
    BtnFechar: TBitBtn;
    IBQuery_ClientesCOD_CLIE: TIntegerField;
    IBQuery_ClientesDATA_CADASTRO: TDateTimeField;
    IBQuery_ClientesDATA_ATUALIZADO: TDateTimeField;
    IBQuery_ClientesCLIENTE: TIBStringField;
    IBQuery_ClientesAPELIDO: TIBStringField;
    IBQuery_ClientesRG: TIBStringField;
    IBQuery_ClientesCPF: TIBStringField;
    IBQuery_ClientesIE: TIBStringField;
    IBQuery_ClientesDATA_NASCIMENTO: TDateTimeField;
    IBQuery_ClientesPAI: TIBStringField;
    IBQuery_ClientesMAE: TIBStringField;
    IBQuery_ClientesENDERECO: TIBStringField;
    IBQuery_ClientesTELEFONE: TIBStringField;
    IBQuery_ClientesCIDADE: TIBStringField;
    IBQuery_ClientesBAIRRO: TIBStringField;
    IBQuery_ClientesCEP: TIBStringField;
    IBQuery_ClientesESTADO: TIBStringField;
    IBQuery_ClientesUF: TIBStringField;
    IBQuery_ClientesPONTO_REFERENCIA: TIBStringField;
    IBQuery_ClientesOBS: TMemoField;
    IBQuery_ClientesFOTO: TBlobField;
    IBQuery_ClientesNOME_EMPRESARIAL: TIBStringField;
    IBQuery_ClientesNOME_FANTASIA: TIBStringField;
    IBQuery_ClientesCONTATO: TIBStringField;
    IBQuery_ClientesRAMO_ATIVIDADE: TIBStringField;
    IBQuery_ClientesFAX: TIBStringField;
    IBQuery_ClientesEMAIL: TIBStringField;
    IBQuery_ClientesNOME_USUARIO: TIBStringField;
    Panel_Clientes: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Label7: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label30: TLabel;
    Label_Matricula: TDBText;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBComboBox6: TDBComboBox;
    DBMemo_OBS: TDBMemo;
    DBDateEdit_DN: TDBDateEdit;
    DBEdit7: TDBEdit;
    SbNovo: TBitBtn;
    SbSalvar: TBitBtn;
    SbExcluir: TBitBtn;
    SbCancelar: TBitBtn;
    SbAnterior: TBitBtn;
    SbProximo: TBitBtn;
    SbAtualiza: TBitBtn;
    BtnOpcoes: TBitBtn;
    SbFechar: TBitBtn;
    Panel10: TPanel;
    Image2: TImage;
    Image1: TImage;
    Label23: TLabel;
    DBText1: TDBText;
    DBText10: TDBText;
    Label91: TLabel;
    Btn_CarregaFoto: TBitBtn;
    DBText2: TDBText;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit13: TDBEdit;
    Label4: TLabel;
    DBEdit14: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit15: TDBEdit;
    Label11: TLabel;
    TabSheet2: TTabSheet;
    IBQuery_ClientesTIPO: TIBStringField;
    BitBtn1: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel1: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    DBText3: TDBText;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBMemo1: TDBMemo;
    DBEdit24: TDBEdit;
    Panel3: TPanel;
    Label39: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label40: TLabel;
    DBText6: TDBText;
    Label41: TLabel;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBEdit31: TDBEdit;
    Label42: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SbSalvarClick(Sender: TObject);
    procedure SbExcluirClick(Sender: TObject);
    procedure SbFecharClick(Sender: TObject);
    procedure SbCancelarClick(Sender: TObject);
    procedure SbAtualizaClick(Sender: TObject);
    procedure SbProximoClick(Sender: TObject);
    procedure SbAnteriorClick(Sender: TObject);
    procedure SbNovoClick(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure DBGrid_ClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid_ClientesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DS_BotoesStateChange(Sender: TObject);
    procedure DBGrid_ClientesKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOpcoesClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid_ClientesDblClick(Sender: TObject);
    procedure DS_BotoesDataChange(Sender: TObject; Field: TField);
    procedure Btn_CarregaFotoClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure LoadFileToDB(const FilePath: string);
     procedure Fotografia;
     procedure TipoCadastro;
  end;

var
  FrmClientes: TFrmClientes;
  Novo_Cad, CODIGO_CLI: String;
implementation

uses UnDm, UnPrincipal;

{$R *.dfm}

procedure TFrmClientes.SbSalvarClick(Sender: TObject);
begin
IBQuery_Codigo.Close;
IBQuery_Codigo.Open;
if Dm.IBDS_CLIENTES.FieldByName('TIPO').AsString = 'PF' then
begin
if DBEdit2.Text = '' then
begin
ShowMessage('Preencha o campo "'+LabeL2.Caption+'"');
PageControl1.ActivePageIndex:=0;
DBEdit2.SetFocus;
Exit;
end else
Screen.Cursor := crHourGlass;
if DS_Botoes.State = dsInsert then
begin
if not IBQuery_Codigo.Locate('COD_CLIE', CODIGO_CLI, []) then
begin
Dm.IBDS_CLIENTES.FieldByName('NOME_USUARIO').AsString:= Usuario;
Dm.IBDS_CLIENTES.FieldByName('DATA_ATUALIZADO').AsDateTime:= Data;
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_CLIENTES.Post;
Dm.IBDS_CLIENTES.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
Fotografia;
SbNovo.SetFocus;
Screen.Cursor := crDefault;
Exit;
end else
ShowMessage('Não é possível salvar os dados, o código: "'+CODIGO_CLI+'" já está lançado, informe outro.');
PageControl1.ActivePageIndex:=0;
Dm.IBDS_CLIENTES.Edit;
SbCancelar.SetFocus;
Screen.Cursor := crDefault;
Exit;
end else
Dm.IBDS_CLIENTES.FieldByName('NOME_USUARIO').AsString:= Usuario;
Dm.IBDS_CLIENTES.FieldByName('DATA_ATUALIZADO').AsDateTime:= Data;
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_CLIENTES.Post;
Dm.IBDS_CLIENTES.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
Fotografia;
SbNovo.SetFocus;
Screen.Cursor := crDefault;
Exit;
end else
// PESSOA JURÍDICA
if DBEdit16.Text = '' then
begin
ShowMessage('Preencha o campo "'+LabeL17.Caption+'"');
PageControl1.ActivePageIndex:= 1;
DBEdit16.SetFocus;
Exit;
end else
Screen.Cursor := crHourGlass;
if DS_Botoes.State = dsInsert then
begin
if not IBQuery_Codigo.Locate('COD_CLIE', CODIGO_CLI, []) then
begin
Dm.IBDS_CLIENTES.FieldByName('NOME_USUARIO').AsString:= Usuario;
Dm.IBDS_CLIENTES.FieldByName('DATA_ATUALIZADO').AsDateTime:= Data;
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_CLIENTES.Post;
Dm.IBDS_CLIENTES.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
Fotografia;
SbNovo.SetFocus;
Screen.Cursor := crDefault;
Exit;
end else
ShowMessage('Não é possível salvar os dados, o código: "'+CODIGO_CLI+'" já está lançado, informe outro.');
PageControl1.ActivePageIndex:=0;
Dm.IBDS_CLIENTES.Edit;
SbCancelar.SetFocus;
Screen.Cursor := crDefault;
Exit;
end else
Dm.IBDS_CLIENTES.FieldByName('USUARIO').AsString:= Usuario;
Dm.IBDS_CLIENTES.FieldByName('DATA_ATUALIZADO').AsDateTime:= Data;
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_CLIENTES.Post;
Dm.IBDS_CLIENTES.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
Fotografia;
SbNovo.SetFocus;
Screen.Cursor := crDefault;
end;

procedure TFrmClientes.SbExcluirClick(Sender: TObject);
begin
if MessageBox(0,'Deseja realmente excluir este cadastro?','Pergunta',mb_yesno+mb_iconquestion)=6  then
begin
Dm.IBDS_ESTOQUE.Delete;
Dm.IBDS_ESTOQUE.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
DS_BotoesStateChange(FrmClientes);
TipoCadastro;
end;
end;

procedure TFrmClientes.SbCancelarClick(Sender: TObject);
begin
if Novo_Cad <> '1' then
begin
if MessageBox(0,'Você tem certeza que deseja cancelar a edição deste cadastro?','Pergunta',mb_yesno+mb_iconquestion)=6  then
begin
Dm.IBDS_CLIENTES.Cancel;
Dm.IBDS_CLIENTES.CancelUpdates;
Dm.IBTransaction.RollbackRetaining;
SbNovo.SetFocus;
Fotografia;
Exit;
end;
end else
if MessageBox(0,'Você tem certeza que deseja cancelar a edição deste novo cadastro?','Pergunta',mb_yesno+mb_iconquestion)=6  then
begin
Dm.IBDS_CLIENTES.Cancel;
Dm.IBDS_CLIENTES.CancelUpdates;
Dm.IBTransaction.RollbackRetaining;
Novo_Cad:= '';
SbNovo.SetFocus;
Fotografia;
end;
end;

procedure TFrmClientes.SbFecharClick(Sender: TObject);
begin
Close;
end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
FrmClientes.Top:=100;
FrmClientes.Left:=0;
FrmClientes.Height:= 453;
IBQuery_Clientes.Open;
Fotografia;
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

procedure TFrmClientes.SbAtualizaClick(Sender: TObject);
begin
Dm.IBDS_CLIENTES.close;
Dm.IBDS_CLIENTES.Open;
Dm.IBDS_CLIENTES.Refresh;
TipoCadastro;
end;

procedure TFrmClientes.SbProximoClick(Sender: TObject);
begin
Dm.IBDS_CLIENTES.Next;
DS_BotoesStateChange(FrmClientes);
TipoCadastro;
end;

procedure TFrmClientes.SbAnteriorClick(Sender: TObject);
begin
Dm.IBDS_CLIENTES.Prior;
DS_BotoesStateChange(FrmClientes);
TipoCadastro;
end;

procedure TFrmClientes.SbNovoClick(Sender: TObject);
begin
IBQuery_Codigo.Close;
IBQuery_Codigo.Open;
if MessageBox(0,'O Cadastro é Pessoa Física?','Pergunta',mb_yesno+mb_iconquestion)=6 then
begin
PageControl1.ActivePageIndex:= 0;
Novo_Cad:= '1';
Dm.IBDS_CLIENTES.Last;
Dm.IBDS_CLIENTES.Append;
CODIGO_CLI:= Dm.IBDS_CLIENTES.FieldByName('COD_CLIE').AsString;
Dm.IBDS_CLIENTES.FieldByName('DATA_CADASTRO').AsFloat:= Data;
Dm.IBDS_CLIENTES.FieldByName('TIPO').AsString:= 'PF';
Fotografia;
DBEdit2.SetFocus;
Exit;
end else
PageControl1.ActivePageIndex:= 1;
Novo_Cad:= '1';
Dm.IBDS_CLIENTES.Last;
Dm.IBDS_CLIENTES.Append;
CODIGO_CLI:= Dm.IBDS_CLIENTES.FieldByName('COD_CLIE').AsString;
Dm.IBDS_CLIENTES.FieldByName('DATA_CADASTRO').AsFloat:= Data;
Dm.IBDS_CLIENTES.FieldByName('TIPO').AsString:= 'PJ';
Fotografia;
DBEdit16.SetFocus;
end;

procedure TFrmClientes.Fechar1Click(Sender: TObject);
begin
Close;
end;

procedure TFrmClientes.DBGrid_ClientesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if IBQuery_Clientes.Active = False then
begin
Abort;
Exit;
end;
end;

procedure TFrmClientes.DBGrid_ClientesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if not odd(IBQuery_Clientes.RecNo) then // se for impar
// se a célula não está selecionada
if not (gdSelected in State) then
begin
// define uma cor de fundo
DBGrid_Clientes.Canvas.Brush.Color:= $00E7F1E7;
DBGrid_Clientes.Canvas.FillRect(Rect); // pinta a célula
// pinta o texto padrão
DBGrid_Clientes.DefaultDrawDataCell(rect,column.Field,State);
end;
end;

procedure TFrmClientes.DS_BotoesStateChange(Sender: TObject);
begin
SbNovo.Enabled           := DS_Botoes.State in [dsBrowse];
 SbExcluir.Enabled        := (DS_Botoes.State in [dsBrowse]) and (Dm.IBDS_CLIENTES.RecordCount > 0);
 SbAtualiza.Enabled       := (DS_Botoes.State in [dsBrowse]) and (Dm.IBDS_CLIENTES.RecordCount > 0);
 SbSalvar.Enabled         := DS_Botoes.State in [dsInsert,dsEdit];
 SbCancelar.Enabled       := DS_Botoes.State in [dsInsert,dsEdit];
 SbAnterior.Enabled       := (DS_Botoes.State in [dsBrowse]) and ( NOT Dm.IBDS_CLIENTES.BOF);
 SbProximo.Enabled        := (DS_Botoes.State in [dsBrowse]) and ( NOT Dm.IBDS_CLIENTES.EOF);
end;

procedure TFrmClientes.DBGrid_ClientesKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then
  begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
Dm.IBDS_CLIENTES.Locate('COD_CLIE', DBGrid_Clientes.Fields[0].Text, []);
Panel.Caption:= 'CADASTRO DE CLIENTES';
Panel_Clientes.Visible:= True;
Panel_Clientes.Top:= 48;
Panel_Clientes.Left:= 6;
IBQuery_Clientes.Close;
SbNovo.SetFocus;
end;
end;

procedure TFrmClientes.BtnOpcoesClick(Sender: TObject);
begin
Panel.Caption:= 'CLIENTES';
Panel_Clientes.Visible:= False;
IBQuery_Clientes.Open;
DBGrid_Clientes.SetFocus;
end;

procedure TFrmClientes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
IBQuery_Clientes.Close;
end;

procedure TFrmClientes.DBGrid_ClientesDblClick(Sender: TObject);
begin
Dm.IBDS_CLIENTES.Locate('COD_CLIE', DBGrid_Clientes.Fields[0].Text, []);
Panel.Caption:= 'CADASTRO DE CLIENTES';
Panel_Clientes.Visible:= True;
Panel_Clientes.Top:= 48;
Panel_Clientes.Left:= 6;
IBQuery_Clientes.Close;
SbNovo.SetFocus;
end;

procedure TFrmClientes.LoadFileToDB(const FilePath: string);
var
 MS: TMemoryStream; J1: TJPEGImage;
begin
  MS := TMemoryStream.Create;
  J1 := TJPEGImage.Create;
    Try{Except}
     {Adquira quadro indiretamente por TImage, stream(flua), e então para DB}
      Image1.Picture.LoadFromFile(FilePath);
     J1.Assign(Image1.Picture);
      J1.SaveToStream(MS);
      Dm.IBDS_CLIENTESFOTO.LoadFromStream(MS);
    Except
      On e:Exception do begin
       ShowMessage
            (e.Message + ^M + 'enquanto tentava carregar '+FilePath);
        With Dm.IBDS_CLIENTES do if not (State in [dsInactive, dsBrowse])
         then
         MessageBox(FrmClientes.handle,'Houve um erro ao carregar a imagem selecionada. A imagem não será salva no cadastro atual. Tente novamente.','Informação',0+64);
       Abort;
       end;
       end;
    MS.Free;
    J1.Free;
end;

procedure TFrmClientes.DS_BotoesDataChange(Sender: TObject; Field: TField);
var
  MS: TMemoryStream;
  J1: TJPEGImage;
begin
  Try{Finall}
    If Dm.IBDS_CLIENTESFOTO.IsNull
      then Image1.Picture.Assign(nil)
      else begin
        J1 := TJPEGImage.Create;
        MS := TMemoryStream.Create;
        try
          Dm.IBDS_CLIENTESFOTO.SaveToStream(MS);
          MS.Seek(0,soFromBeginning);
          with J1 do begin
            PixelFormat := jf24Bit;
            Scale := jsFullSize;
            Grayscale := False;
            Performance := jpBestQuality;
            ProgressiveDisplay := True;
            ProgressiveEncoding := True;
            LoadFromStream(MS);
          end;
         Image1.Picture.Assign(J1);
        finally
          J1.Free;
          MS.Free;
      end;
      end;
  Finally
    End;
if  Dm.IBDS_CLIENTES.FieldByName('FOTO').asString = '' then
begin
Image2.Visible:=True;
end
else
Image2.Visible:=False;
end;

procedure TFrmClientes.Fotografia;
begin
if Dm.IBDS_CLIENTES.FieldByName('FOTO').Value = '' then
begin
Btn_CarregaFoto.Caption:= '&Imagem';
Exit;
end else
Btn_CarregaFoto.Caption:= 'A&pagar';
end;

procedure TFrmClientes.Btn_CarregaFotoClick(Sender: TObject);
 var i: integer;
begin
if Btn_CarregaFoto.Caption = '&Imagem' then
begin
Dm.IBDS_CLIENTES.Edit;
  With OpenPictureDialog1 do if Execute
   then
   for i := 0 to Files.Count-1
        do LoadFileToDB(Files[i]);
if SbSalvar.Enabled = True then
begin
SbSalvar.SetFocus;
end;
Exit;
end else
if Btn_CarregaFoto.Caption = 'A&pagar' then
begin
Dm.IBDS_CLIENTES.Edit;
Dm.IBDS_CLIENTES.FieldByName('FOTO').Clear;
Image1.Picture.Graphic:= nil;
Image2.Visible:=True;
If Not(DM.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_CLIENTES.Post;
Dm.IBDS_CLIENTES.ApplyUpdates;
DM.IBTransaction.CommitRetaining;
Fotografia;
end;
end;

procedure TFrmClientes.TipoCadastro;
begin
if Dm.IBDS_CLIENTES.FieldByName('TIPO').AsString = 'PF' then
begin
IBQuery_Codigo.Locate('TIPO', 'PF', []);
PageControl1.ActivePageIndex:= 0;
Fotografia;
Exit;
end else
IBQuery_Codigo.Locate('TIPO', 'PJ', []);
PageControl1.ActivePageIndex:= 1;
Fotografia;
end;

procedure TFrmClientes.PageControl1Change(Sender: TObject);
begin
case PageControl1.TabIndex of
    0: begin
Dm.IBDS_CLIENTES.Close;
Dm.IBDS_CLIENTES.SelectSQL.Clear;
Dm.IBDS_CLIENTES.SelectSQL.Add('select * from CLIENTES where TIPO = '+#39+'PF'+#39+' order by COD_CLIE');
Dm.IBDS_CLIENTES.Open;
    end;
    1: begin
Dm.IBDS_CLIENTES.Close;
Dm.IBDS_CLIENTES.SelectSQL.Clear;
Dm.IBDS_CLIENTES.SelectSQL.Add('select * from CLIENTES where TIPO = '+#39+'PJ'+#39+' order by COD_CLIE');
Dm.IBDS_CLIENTES.Open;
    end;
end;
end;

end.

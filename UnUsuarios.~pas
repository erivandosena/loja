unit UnUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Menus, Mask, Grids, DBGrids,
  StdCtrls, DBCtrls, Buttons, ExtCtrls, ComCtrls, TreeSeguranca;

type
  TFrmUsuarios = class(TForm)
    Panel1: TPanel;
    SbExcluir: TBitBtn;
    SbCancelar: TBitBtn;
    SbNova: TBitBtn;
    SbSalvar: TBitBtn;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    SbAtualizar: TBitBtn;
    Bevel2: TBevel;
    SpeedButton1: TBitBtn;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    N2: TMenuItem;
    Fechar1: TMenuItem;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    IBQueryUsuario: TIBQuery;
    Panel4: TPanel;
    procedure SbNovaClick(Sender: TObject);
    procedure SbSalvarClick(Sender: TObject);
    procedure SbExcluirClick(Sender: TObject);
    procedure SbCancelarClick(Sender: TObject);
    procedure SbAtualizarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function ObterSenha(var Senha: string): boolean;
    function ObterSenhaAnterior(var SA: string): boolean;
    function ObterSenhaUsuario(var SU: string): boolean;
  public
    { Public declarations }
  end;

  const
  my_key = 21327;//33189;

var
  FrmUsuarios: TFrmUsuarios;
  Codificado, Descodificado :AnsiString;

implementation

uses UnDm, UnEncrypt;

{$R *.dfm}

procedure TFrmUsuarios.SbNovaClick(Sender: TObject);
begin
IBQueryUsuario.Close;
IBQueryUsuario.Open;
Dm.IBDS_USUARIOS.Last;
Dm.IBDS_USUARIOS.Append;
MaskEdit1.Text:='';
DBEdit1.SetFocus;
end;

procedure TFrmUsuarios.SbSalvarClick(Sender: TObject);
var
  A, B: string;
begin
IBQueryUsuario.Close;
IBQueryUsuario.Open;
if DBEdit1.Text = '' then
begin
DBEdit1.Color:=$00F4FFF4;
DBEdit1.SetFocus;
Exit;
end
else
if MaskEdit1.Text = '' then
begin
MaskEdit1.Color:=$00F4FFF4;
MaskEdit1.SetFocus;
Exit;
end
else
DBEdit1.Color:=clWindow;
MaskEdit1.Color:=clWindow;
 if ObterSenha(A) then
if A <> MaskEdit1.Text then
begin
MessageBox(FrmUsuarios.Handle,'Senha inválida, tente novamente.','Aviso',0+48);
Dm.IBDS_USUARIOS.Cancel;
Dm.IBDS_USUARIOS.CancelUpdates;
Dm.IBTransaction.RollbackRetaining;
MaskEdit1.Text:= '';
MaskEdit1.SetFocus;
Exit;
end
else
MaskEdit1.Text:=(A);
Dm.IBDS_USUARIOS.Edit;
if DataSource1.State = dsInsert then
begin
Descodificado:= Decrypt('jB',my_key);
end else
Descodificado:= Decrypt(Dm.IBDS_USUARIOS.FieldByName('ANTERIOR').Value,my_key);

if Dm.IBDS_USUARIOS.FieldByName('ANTERIOR').AsString = '' then
begin
Codificado:= Encrypt(MaskEdit1.Text,my_key);
Dm.IBDS_USUARIOS.FieldByName('SENHA').Value:= Codificado;
Dm.IBDS_USUARIOS.FieldByName('ANTERIOR').Value:= Codificado;

Screen.Cursor := crHourGlass;
if DataSource1.State = dsInsert then
begin
if not IBQueryUsuario.Locate('NOME_USUARIO', DBEdit1.text, []) then
begin
MaskEdit1.Text:= '';
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_USUARIOS.Post;
Dm.IBDS_USUARIOS.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
DBEdit1.SetFocus;
Screen.Cursor := crDefault;
Exit;
end else
ShowMessage('Não é possível salvar, o usuário de nome "'+DBEdit1.Text+'" já está cadastrado, informe outro.');
Dm.IBDS_USUARIOS.Edit;
DBEdit1.SetFocus;
Screen.Cursor := crDefault;
Exit;
end else
MaskEdit1.Text:= '';
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_USUARIOS.Post;
Dm.IBDS_USUARIOS.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
Screen.Cursor := crDefault;
DBEdit1.SetFocus;
Exit;
end else

if ObterSenhaAnterior(B) then
if (B) <> Descodificado then
begin
MessageBox(FrmUsuarios.Handle,'Senha anterior inválida, tente novamente.','Aviso',0+48);
Dm.IBDS_USUARIOS.Cancel;
Dm.IBDS_USUARIOS.CancelUpdates;
Dm.IBTransaction.RollbackRetaining;
MaskEdit1.Text:= '';
MaskEdit1.SetFocus;
Exit;
end
else
Codificado:= Encrypt(MaskEdit1.Text,my_key);
Dm.IBDS_USUARIOS.FieldByName('SENHA').Value:= Codificado;
Dm.IBDS_USUARIOS.FieldByName('ANTERIOR').Value:= Codificado;

Screen.Cursor := crHourGlass;
if DataSource1.State = dsInsert then
begin
if not IBQueryUsuario.Locate('NOME_USUARIO', DBEdit1.text, []) then
begin
MaskEdit1.Text:= '';
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_USUARIOS.Post;
Dm.IBDS_USUARIOS.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
DBEdit1.SetFocus;
Screen.Cursor := crDefault;
Exit;
end else
ShowMessage('Não é possível salvar, o usuário de nome "'+DBEdit1.Text+'" já está cadastrado, informe outro.');
Dm.IBDS_USUARIOS.Edit;
DBEdit1.SetFocus;
Screen.Cursor := crDefault;
Exit;
end else
MaskEdit1.Text:= '';
If Not(Dm.IBTransaction.InTransaction) Then
Dm.IBTransaction.StartTransaction;
Dm.IBDS_USUARIOS.Post;
Dm.IBDS_USUARIOS.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
Screen.Cursor := crDefault;
DBEdit1.SetFocus;
end;

procedure TFrmUsuarios.SbExcluirClick(Sender: TObject);
var
A: String;
begin
if (Dm.IBDS_USUARIOS.FieldByName('NOME_USUARIO').asString = 'ADMINISTRADOR') or (Dm.IBDS_USUARIOS.FieldByName('NOME_USUARIO').asString = 'ADMIN') then
begin
MessageBox(FrmUsuarios.Handle,'Você não tem permissão para excluir o "ADMINISTRADOR".','Informação',0+64);
Abort;
end
else
if MessageBox(0,'Deseja realmente excluir este cadastro?','Pergunta',mb_yesno+mb_iconquestion)=6  then
  begin
Descodificado:= Decrypt(Dm.IBDS_USUARIOS.FieldByName('SENHA').Value,my_key);
 if ObterSenhaUsuario(A) then
if A <> Descodificado then
begin
MessageBox(FrmUsuarios.Handle,'Senha inválida, tente novamente.','Aviso',0+48);
MaskEdit1.Text:= '';
SbExcluir.SetFocus;
Exit;
end
else
MaskEdit1.Text:= '';
Dm.IBDS_USUARIOS.Delete;
Dm.IBDS_USUARIOS.ApplyUpdates;
Dm.IBTransaction.CommitRetaining;
DataSource1StateChange(FrmUsuarios);
end;
end;

procedure TFrmUsuarios.SbCancelarClick(Sender: TObject);
begin
MaskEdit1.Text:='';
Dm.IBDS_USUARIOS.Cancel;
Dm.IBDS_USUARIOS.CancelUpdates;
Dm.IBTransaction.RollbackRetaining;
end;

procedure TFrmUsuarios.SbAtualizarClick(Sender: TObject);
begin
Dm.IBDS_USUARIOS.Edit;
MaskEdit1.Text:= '';
MaskEdit1.SetFocus;
end;

procedure TFrmUsuarios.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmUsuarios.DataSource1StateChange(Sender: TObject);
begin
 SbNova.Enabled           := DataSource1.State in [dsBrowse];
 SbExcluir.Enabled          := (DataSource1.State in [dsBrowse]) and (Dm.IBDS_USUARIOS.RecordCount > 0);
 DBGrid1.Enabled          := (DataSource1.State in [dsBrowse]) and (Dm.IBDS_USUARIOS.RecordCount > 0);
 SbAtualizar.Enabled       := (DataSource1.State in [dsBrowse]) and (Dm.IBDS_USUARIOS.RecordCount > 0);
 SbSalvar.Enabled          := DataSource1.State in [dsInsert,dsEdit];
 MaskEdit1.Enabled          := DataSource1.State in [dsInsert,dsEdit];
 SbCancelar.Enabled        := DataSource1.State in [dsInsert,dsEdit];
end;

function TFrmUsuarios.ObterSenha(var Senha: string): boolean;
var
  Form: TForm; { Variável para o Form }
  Medt1: TMaskEdit; { Variável para o MaskEdit }
begin
  Result := false; { Por padrão retorna false }
  { Cria o form }
  Form := TForm.Create(Application);
  try
  { Altera algumas propriedades do Form }
  Form.BorderStyle := bsDialog;
  Form.Caption := 'Senha';
  Form.Position := poMainFormCenter;
  Form.Width := 211;
  Form.Height := 133;
  { Coloca um Label }
  with TLabel.Create(Form) do begin
  Parent := Form;
  Caption := 'Redigite a senha';
  Left := 10;
  Top := 8;
  end;
  { Coloca o Edit }
  Medt1 := TMaskEdit.Create(Form);
  with Medt1 do begin
  Parent := Form;
  Left := 10;
  Top := 25;
  Width := 184;
  BevelInner:= bvLowered;
  BevelKind:= bkTile;
  BevelOuter:= bvRaised;
  BorderStyle:= bsNone;
  CharCase:=ecNormal;
  Font.Size:= 18;
  Font.Style:=[fsBold];
  PasswordChar:='*';
  MaxLength:= 15;
  end;
  { Coloca o botão OK }
  with TBitBtn.Create(Form) do begin
  Parent := Form;
  { Posiciona de acordo com a largura do form }
  Left := 64;
  Top := 64;
  Kind := bkOK; { Botão Ok }
  end;
  { Exibe o form e aguarda a ação do usuário. Se for OK... }
  if Form.ShowModal = mrOK then begin
  Senha := Medt1.Text;
  Result := true;
  end;
  finally
  Form.Free;
  end;
end;

procedure TFrmUsuarios.MaskEdit1Change(Sender: TObject);
begin
Dm.IBDS_USUARIOS.Edit;
end;

function TFrmUsuarios.ObterSenhaAnterior(var SA: string): boolean;
var
  Form: TForm; { Variável para o Form }
  Medt1: TMaskEdit; { Variável para o MaskEdit }
begin
  Result := false; { Por padrão retorna false }
  { Cria o form }
  Form := TForm.Create(Application);
  try
  { Altera algumas propriedades do Form }
  Form.BorderStyle := bsDialog;
  Form.Caption := 'Senha';
  Form.Position := poMainFormCenter;
  Form.Width := 211;
  Form.Height := 133;
  { Coloca um Label }
  with TLabel.Create(Form) do begin
  Parent := Form;
  Caption := 'Informe a senha anterior';
  Left := 10;
  Top := 8;
  end;
  { Coloca o Edit }
  Medt1 := TMaskEdit.Create(Form);
  with Medt1 do begin
  Parent := Form;
  Left := 10;
  Top := 25;
  Width := 184;
  BevelInner:= bvLowered;
  BevelKind:= bkTile;
  BevelOuter:= bvRaised;
  BorderStyle:= bsNone;
  CharCase:=ecNormal;
  Font.Size:= 18;
  Font.Style:=[fsBold];
  PasswordChar:='*';
  MaxLength:= 15;
  end;
  { Coloca o botão OK }
  with TBitBtn.Create(Form) do begin
  Parent := Form;
  { Posiciona de acordo com a largura do form }
  Left := 64;
  Top := 64;
  Kind := bkOK; { Botão Ok }
  end;
  { Exibe o form e aguarda a ação do usuário. Se for OK... }
  if Form.ShowModal = mrOK then begin
  SA := Medt1.Text;
  Result := true;
  end;
  finally
  Form.Free;
  end;
end;

function TFrmUsuarios.ObterSenhaUsuario(var SU: string): boolean;
var
  Form: TForm; { Variável para o Form }
  Medt1: TMaskEdit; { Variável para o MaskEdit }
begin
  Result := false; { Por padrão retorna false }
  { Cria o form }
  Form := TForm.Create(Application);
  try
  { Altera algumas propriedades do Form }
  Form.BorderStyle := bsDialog;
  Form.Caption := 'Senha';
  Form.Position := poMainFormCenter;
  Form.Width := 211;
  Form.Height := 133;
  { Coloca um Label }
  with TLabel.Create(Form) do begin
  Parent := Form;
  Caption := 'Informe a senha do usuário';
  Left := 10;
  Top := 8;
  end;
  { Coloca o Edit }
  Medt1 := TMaskEdit.Create(Form);
  with Medt1 do begin
  Parent := Form;
  Left := 10;
  Top := 25;
  Width := 184;
  BevelInner:= bvLowered;
  BevelKind:= bkTile;
  BevelOuter:= bvRaised;
  BorderStyle:= bsNone;
  CharCase:=ecNormal;
  Font.Size:= 18;
  Font.Style:=[fsBold];
  PasswordChar:='*';
  MaxLength:= 15;
  end;
  { Coloca o botão OK }
  with TBitBtn.Create(Form) do begin
  Parent := Form;
  { Posiciona de acordo com a largura do form }
  Left := 64;
  Top := 64;
  Kind := bkOK; { Botão Ok }
  end;
  { Exibe o form e aguarda a ação do usuário. Se for OK... }
  if Form.ShowModal = mrOK then begin
  SU := Medt1.Text;
  Result := true;
  end;
  finally
  Form.Free;
  end;
end;

procedure TFrmUsuarios.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Shift = [ssCtrl]) and (Key = 46) Then
KEY := 0;
MaskEdit1.Text:= '';
end;

procedure TFrmUsuarios.FormShow(Sender: TObject);
begin
FrmUsuarios.Top:=100;
FrmUsuarios.Left:=181;
//if Dm.IBDS_EMPRESANOME_EMPRESARIAL.AsString = '' then
//begin
//FrmUsuarios.Caption:= FrmUsuarios.Caption;
//Exit;
//end else
//FrmUsuarios.Caption:= FrmUsuarios.Caption+' - '+Dm.IBDS_EMPRESANOME_FANTASIA.AsString;
end;

procedure TFrmUsuarios.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
SbSalvar.SetFocus;
  end;
end;

end.

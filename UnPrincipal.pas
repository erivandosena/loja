unit UnPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRPrntr, backup, DB, Menus, ComCtrls, StdCtrls, ExtCtrls,
  Buttons, jpeg, Mask, Registry, ShockwaveFlashObjects_TLB;

type
  TFrmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn8: TBitBtn;
    Ferramentas1: TMenuItem;
    Calculadora1: TMenuItem;
    CpiadeSegurana1: TMenuItem;
    SobreoSGO1: TMenuItem;
    Cadastros1: TMenuItem;
    Usurios1: TMenuItem;
    BackupFile1: TBackupFile;
    Consultas1: TMenuItem;
    Relatrios1: TMenuItem;
    N1: TMenuItem;
    Principal1: TMenuItem;
    Sobre1: TMenuItem;
    Estoque1: TMenuItem;
    FileListBox: TListBox;
    Panel_Logo: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Clientes1: TMenuItem;
    procedure Fechar1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure CpiadeSegurana1Click(Sender: TObject);
    procedure SobreoSGO1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BackupFile1Progress(Sender: TObject; Filename: String;
      Percent: TPercentage; var Continue: Boolean);
    procedure BtnTerminalClick(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ManipulaExcecoes(Sender: TObject; E: Exception);
  public
    { Public declarations }
    procedure CustomPreview(Sender: TObject);
    function TiraMascara(text:string): String;
    procedure ConverterJPegParaBmp(Arquivo: string);
    function RemoveZeros(S: string): string;
    function RetZero(ZEROS:string;QUANT:integer):String;
  end;

var
  FrmPrincipal: TFrmPrincipal;
  iOK, Terminal: Integer;
  Reg: TRegistry;
  Data: TDateTime;
  Usuario, Empresa, AnoBase: String;
  OldValue : LongBool;
  VarTipoTBitmap: tbITMAP;
  flash: TShockwaveFlash;

implementation

uses UnBackup, UnDm, UnUsuarios, UnSenha, UnFrmDataGeral, UnPreview,
  UnEstoque, UnTerminal, UnClientes;

{$R *.dfm}

procedure TFrmPrincipal.Fechar1Click(Sender: TObject);
begin
Close
end;

procedure TFrmPrincipal.Calculadora1Click(Sender: TObject);
begin
WinExec('Calc', SW_Show);
end;

procedure TFrmPrincipal.CpiadeSegurana1Click(Sender: TObject);
begin
FrmBackup:= TFrmBackup.Create(Application);
try
  FrmBackup.ShowModal;
finally
  FrmBackup.Free;
end;
end;

procedure TFrmPrincipal.SobreoSGO1Click(Sender: TObject);
begin
ShowMessage('Sistema Expresso de Loja 1.0'
+#13+#13+'Atendimento: Erivando Ramos'
+#13+'Horário: De Segunda à Sexta, das 8:00h às 17:00h'
+#13+'Contatos: Tel.(85)9602.5039 / 347.1170 E-mail: inforamos.servicos@bol.com.br'
+#13+'___________________________________________________________________________________'
+#13+#13+'© Propriedade Intelectual de Programa de Computador protegida sob Lei do Direito Autoral, LEI 9609/98.');
end;

procedure TFrmPrincipal.BitBtn4Click(Sender: TObject);
begin
FrmBackup:= TFrmBackup.Create(Application);
try
  FrmBackup.ShowModal;
finally
  FrmBackup.Free;
end;
end;

procedure TFrmPrincipal.BitBtn8Click(Sender: TObject);
begin
ShowMessage('INFORAMOS Serviços - Desenvolvimento de Softwares'
+#13+#13+'Atendimento: Erivando Ramos'
+#13+'Horário: De Segunda à Sexta, das 8:00h às 17:00h'
+#13+'Contatos: Tel.(85)9602.5039 / 3471170 E-mail: sosinforamos@bol.com.br'
+#13+'___________________________________________________________________________________'
+#13+#13+'Cópia em locação autorizada para:'
+#13+''+'Modelo'+''
+#13+'CNPJ:'+'Modelo'+''
+#13+'___________________________________________________________________________________'
+#13+#13+'© Propriedade Intelectual de Programa de Computador protegida sob Lei do Direito Autoral, LEI 9609/98.');
end;

procedure TFrmPrincipal.Usurios1Click(Sender: TObject);
begin
FrmUsuarios:= TFrmUsuarios.Create(Application);
try
  FrmUsuarios.ShowModal;
finally
  FrmUsuarios.Free;
end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
FrmSenha := TfrmSenha.Create(self);
FrmSenha.ShowModal;
FrmDataGeral:= TFrmDataGeral.Create(self);
FrmDataGeral.ShowModal;
//Empresa:= Dm.IBDS_EMPRESACNPJ.AsString;
//if Dm.IBDS_EMPRESANOME_EMPRESARIAL.AsString = '' then
//begin
//FrmPrincipal.Caption:= FrmPrincipal.Caption;
//Exit;
//end else
//FrmPrincipal.Caption:= FrmPrincipal.Caption+' - '+Dm.IBDS_EMPRESANOME_FANTASIA.AsString;
end;

procedure TFrmPrincipal.ManipulaExcecoes(Sender: TObject; E: Exception);
var
 Erros: TextFile;
 Hora: String;
begin
Hora:=TimeToStr(Time);
ShowMessage('Ocorreu um comando inválido nesta aplicação.'+#13+#13+'Verifique se algo de incorreto foi efetuado.'+#13+#13+'Se o problema continuar consulte o suporte técnico deste produto.');
try
  AssignFile(Erros, 'C:\Windows\SelLog.log');
  if not FileExists('C:\Windows\SelLog.log') then Rewrite(Erros,'C:\Windows\SelLog.log');
  Append(Erros);
  WriteLn(Erros, 'Ocorrência: '+(E.Message)+ ' em: '+DateToStr(Data)+ ' às ' +Hora+'Hs');
  finally
  CloseFile(Erros);
  end;
  Screen.Cursor := crDefault;
  Abort;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
Flash := TShockwaveFlash.Create(self);
Flash.Align:= alCustom;
Flash.Width:= 550;
Flash.Height:= 440;
Flash.Parent := Panel_Logo;
Flash.Movie := 'C:\Inforamos\sel\divulgacao.swf';
//flash.Stop;
flash.Play;
Application.OnException := ManipulaExcecoes;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
 Dir, Filename: string;
begin
CanClose:= False;
if MessageBox(0,'Tem certeza que deseja sair deste aplicativo?','Pergunta',mb_yesno+mb_iconquestion)=6 then
CanClose := True;
if CanClose = True then
begin
Reg:= TRegistry.Create;
Reg.OpenKey('Backup', True);
Diario:=Reg.ReadString('Backup Diário');
Reg.CloseKey;

Dir := 'C:\Meus documentos\Meus backups\SEL';
if not DirectoryExists(Dir) then
ForceDirectories(Dir);
Panel2.Visible:=True;
Screen.Cursor := crMultiDrag;

if Diario = 'Não' then
begin
DeleteFile('C:\Meus documentos\Meus backups\SEL\'+FrmPrincipal.TiraMascara(Empresa)+'-'+FrmPrincipal.TiraMascara(DateToStr(Data - 1))+'.bck');
Filename:= 'C:\Meus documentos\Meus backups\SEL\'+FrmPrincipal.TiraMascara(Empresa)+'-'+FrmPrincipal.TiraMascara(DateToStr(Data))+'.bck';
end else
Filename:= 'C:\Meus documentos\Meus backups\SEL\'+FrmPrincipal.TiraMascara(Empresa)+'-'+FrmPrincipal.TiraMascara(DateToStr(Data))+'.bck';
if Filelistbox.items.count = 0 then MessageBox(FrmBackup.handle,'Nenhum arquivo adicionado.','Aviso',0+48)
     else //
  BackupFile1.maxSize := 0;
  backupfile1.backuptitle      := 'SEL - Cópia de segurança';
  backupfile1.backupmode       := bmAll;
  backupfile1.compressionLevel := clMax;
  backupfile1.SaveFileID       := False;
  if backupfile1.backup(filelistbox.items, Filename) then
Panel2.Visible:=False;
Screen.Cursor := crDefault;
end;
end;

procedure TFrmPrincipal.BackupFile1Progress(Sender: TObject;
  Filename: String; Percent: TPercentage; var Continue: Boolean);
begin
with Progressbar1 do
     begin
          visible := Percent < 100;
          if visible then position := Percent;
     end;
end;

procedure TFrmPrincipal.CustomPreview(Sender: TObject);
begin
FrmPreview := TfrmPreview.Create(self);
FrmPreview.QRPreview1.QRPrinter := TQRPrinter(Sender);
FrmPreview.Show;
end;

function TFrmPrincipal.TiraMascara(text: string): String;
// Remove mascaras de valores Numericos
var aux:string;
    i:integer;
begin
Aux := '';
for i :=1 to Length(text) do
    begin
    if(copy(text,i,1)<>'.') and (copy(text,i,1)<>'-') and (copy(text,i,1)<>'/')and(copy(text,i,1)<>'\') then
      begin
      Aux := Aux + copy(text,i,1);
      end;
    end;
Result := Aux;
end;

procedure TFrmPrincipal.ConverterJPegParaBmp(Arquivo: string);
var
  JPeg: TJPegImage;
  Bmp: TBitmap;
begin
  JPeg := TJPegImage.Create;
  try
    JPeg.LoadFromFile(Arquivo);
    Bmp := TBitmap.Create;
    try
      Bmp.Assign(JPeg);
      Bmp.SaveToFile(ChangeFileExt(Arquivo, '.bmp'));
    finally
      Bmp.Free;
    end;
  finally
    JPeg.Free;
  end;
end;

function TFrmPrincipal.RemoveZeros(S: string): string;
// Remove os zeros na frente de um valor.
var  I, J : Integer;
begin
I := Length(S);
while (I > 0) and (S[I] <= ' ') do begin
Dec(I); end;
J := 1;
while (J < I) and ((S[J] <= ' ') or (S[J] = '0')) do begin
Inc(J); end;
Result := Copy(S, J, (I-J) + 1);
end;

function TFrmPrincipal.RetZero(ZEROS: string; QUANT: integer): String;
var
I,Tamanho:integer;
aux: string;
begin
  aux:=zeros;
  Tamanho:=length(ZEROS);
  ZEROS:='';
  for I:=1 to quant-tamanho do
  ZEROS:=ZEROS+'0';
  aux:=zeros+aux;
  RetZero:=aux;
end;

procedure TFrmPrincipal.BtnTerminalClick(Sender: TObject);
begin
FrmTerminal:= TFrmTerminal.Create(Application);
try
  FrmTerminal.ShowModal;
finally
  FrmTerminal.Free;
end;
end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
begin
FrmClientes:= TFrmClientes.Create(Application);
try
  FrmClientes.ShowModal;
finally
  FrmClientes.Free;
end;
end;

end.

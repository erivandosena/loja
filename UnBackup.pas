unit UnBackup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  backup, Menus, ComCtrls, StdCtrls, Buttons, FileCtrl, ExtCtrls, Registry;

type
  TFrmBackup = class(TForm)
    SaveDialog: TSaveDialog;
    PopupMenu1: TPopupMenu;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    OrigemPadrodaCpiadeSegurana1: TMenuItem;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    ExecurarCpiadesegurana1: TMenuItem;
    Restaurar1: TMenuItem;
    N1: TMenuItem;
    GroupBox3: TGroupBox;
    ProgressBar1: TProgressBar;
    BackupFile1: TBackupFile;
    BitBtn4: TBitBtn;
    FormatarDisquete1: TMenuItem;
    BitBtn2: TBitBtn;
    OrigemPadrodaCpiadeSegurana2: TMenuItem;
    Fechar1: TMenuItem;
    CheckBox_BackupDiario: TCheckBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    FileListBox: TListBox;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OrigemdoBackup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BackupFile1Progress(Sender: TObject; Filename: String;
      Percent: TPercentage; var Continue: Boolean);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BackupFile1Error(Sender: TObject; const Error: Integer;
      ErrString: String);
    procedure FormShow(Sender: TObject);
    procedure DirectoryListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DriveComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FileListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox_BackupDiarioKeyPress(Sender: TObject;
      var Key: Char);
    procedure CheckBox_BackupDiarioClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBackup: TFrmBackup;
  Diario: String;

implementation

uses UnDm, UnPrincipal;

const
  SHFMT_ID_DEFAULT = $FFFF;

  { Opções de formatação }
  SHFMT_OPT_FULL = $0000;        { Formatação completa }
  SHFMT_OPT_QUICKFORMAT = $0001; { Formatação rápida }
  SHFMT_OPT_SYSONLY = $0002;     { Copia sistema }

  { Códigos de errros }
  SHFMT_ERROR = $FFFFFFFF; { Ocorreu erro }
  SHFMT_CANCEL = $FFFFFFFE; { Foi cancelado }
  SHFMT_NOFORMAT = $FFFFFFFD; { Não formatou }

function SHFormatDrive(Handle: HWND; Drive, ID, Options: Word):
  LongInt; stdcall; external 'shell32.dll' name 'SHFormatDrive'

{$R *.DFM}

procedure TFrmBackup.BitBtn4Click(Sender: TObject);
begin
Close;
end;

procedure TFrmBackup.FormCreate(Sender: TObject);
var
Dir: string;
begin
Reg:= TRegistry.Create;
Reg.OpenKey('Backup', True);
Diario:=Reg.ReadString('Backup Diário');
if Diario = 'Sim' then
begin
CheckBox_BackupDiario.Checked:= True;
end else
CheckBox_BackupDiario.Checked:= False;
Reg.CloseKey;
Dir := 'C:\Meus documentos\Meus backups\SEL';
if not DirectoryExists(Dir) then
ForceDirectories(Dir);
DirectoryListBox1.Directory := ExtractFilePath('C:\Meus documentos\Meus backups\SEL\');
end;

procedure TFrmBackup.OrigemdoBackup1Click(Sender: TObject);
begin
DirectoryListBox1.Directory := ExtractFilePath('C:\Meus documentos\Meus backups\SEL\');
end;

procedure TFrmBackup.BitBtn1Click(Sender: TObject);
begin
SaveDialog.InitialDir := ExtractFilePath('C:\Meus documentos\Meus backups\SEL\');
if CheckBox_BackupDiario.Checked = False then
begin
DeleteFile('C:\Meus documentos\Meus backups\SEL\'+FrmPrincipal.TiraMascara(Empresa)+'-'+FrmPrincipal.TiraMascara(DateToStr(Data - 1))+'.bck');
SaveDialog.FileName:= FrmPrincipal.TiraMascara(Empresa)+'-'+FrmPrincipal.TiraMascara(DateToStr(Data))+'.bck';
end;
SaveDialog.FileName:= FrmPrincipal.TiraMascara(Empresa)+'-'+FrmPrincipal.TiraMascara(DateToStr(Data))+'.bck';
SaveDialog.Options := [ofOverwritePrompt, ofHideReadOnly];
     if Filelistbox.items.count = 0 then MessageBox(FrmBackup.handle,'Nenhum arquivo adicionado.','Aviso',0+48)
     else with SaveDialog do if execute then
     begin
          if uppercase(copy(filename, 1, 1)) = 'A' then
          begin
               MessageBox(FrmBackup.handle,'Foi selecionado o drive "A", disquete de 3½ polegadas.'+#13+'È recomendável que o disquete esteja formatado e rotulado como:'+#13+#13+'"SEL - Cópia de segurança - Disco 1".'+#13+#13+'Pressione OK para continuar.','Aviso',0+48);
               BackupFile1.maxSize := 1400000;  //backup to floppy
          end
          else BackupFile1.maxSize := 0;
          FrmBackup.Height:=265;
          backupfile1.backuptitle      := 'SEL - Cópia de segurança';
          backupfile1.backupmode       := bmAll;
          backupfile1.compressionLevel := clMax;
          backupfile1.SaveFileID       := False;
          Screen.Cursor := crHourGlass;
          if backupfile1.backup(filelistbox.items, filename)
           then
           ShowMessage('Cópia de segurança finalizada.'+#13+#13+' A taxa de compactação do arquivo foi de ' + inttostr(BackupFile1.compressionrate) + ' %.')
           else MessageBox(FrmBackup.handle,'O backup falhou ou foi cancelado pelo o usuário.','Aviso',0+48);
FrmBackup.Height:=211;
     end;
     Screen.Cursor := crDefault;
end;

procedure TFrmBackup.BitBtn3Click(Sender: TObject);
var
   S: string;
begin
FileListBox1.SetFocus;
FileListbox1.ItemIndex:=0;
if FileListbox1.items[FileListbox1.itemindex] <> ''+dateToStr(data)+'-'+FrmPrincipal.TiraMascara(DateToStr(Data))+'.bck' then
begin
Exit;
end
else
Dm.IBDatabase.Connected:=False;
Dm.IBTransaction.Active:=False;
Dm.IBDS_USUARIOS.Close;
//Dm.IBDS_EMPRESA.Close;
Dm.IBDS_CLIENTES.Close;
//Dm.IBDS_DEPENDE.Close;
//Dm.IBDS_INATIVOS.Close;
//Dm.IBDS_PROMOTOR.Close;
     backupfile1.Restoremode  := rmAll;
     backupfile1.restoreFullpath := False;
FrmBackup.Height:=265;
Screen.Cursor := crHourGlass;
     if backupfile1.restore(filelistbox1.filename, S)
       then showmessage('Restauração finalizada, '+inttostr(backupfile1.FilesProcessed)+' arquivo de '+inttostr(backupfile1.FilesTotal)+' restaurado.')
       else MessageBox(FrmBackup.handle,'A restauração falhou ou foi cancelada pelo o usuário.','Aviso',0+48);
   FrmBackup.Height:=211;
Dm.IBDatabase.Connected:=True;
Dm.IBTransaction.Active:=True;
Dm.IBDS_USUARIOS.Open;
//Dm.IBDS_EMPRESA.Open;
Dm.IBDS_CLIENTES.Open;
//Dm.IBDS_DEPENDE.Open;
//Dm.IBDS_INATIVOS.Open;
//Dm.IBDS_PROMOTOR.Open;
Screen.Cursor := crdefault;
end;

procedure TFrmBackup.BackupFile1Progress(Sender: TObject; Filename: String;
  Percent: TPercentage; var Continue: Boolean);
begin
with Progressbar1 do
     begin
          visible := Percent < 100;
          if visible then position := Percent;
     end;
end;

procedure TFrmBackup.BitBtn34Click(Sender: TObject);
var
  Erro: DWord;
  Msg: string;
begin
  Erro := SHFormatDrive(Handle, 0, SHFMT_ID_DEFAULT, SHFMT_OPT_QUICKFORMAT);
  case Erro of
    SHFMT_ERROR:    Msg := 'Ocorreu um erro ao tentar formatar.';
    SHFMT_CANCEL:   Msg := 'A formatação foi cancelada.';
    SHFMT_NOFORMAT: Msg := 'Não foi possível formatar.';
  else
    Msg := 'Disquete formatado.';
  end;
  ShowMessage(Msg);
end;

procedure TFrmBackup.BitBtn2Click(Sender: TObject);
begin
if not BackupFile1.busy then 
close
else if messagebox(0,'Tem certeza que deseja cancelar esta operação?','Pergunta',mb_yesno+mb_iconquestion)=6 then Backupfile1.Stop;
end;

procedure TFrmBackup.BackupFile1Error(Sender: TObject;
  const Error: Integer; ErrString: String);
begin
FrmBackup.Height:=211;
end;

procedure TFrmBackup.FormShow(Sender: TObject);
begin
//if Dm.IBDS_EMPRESANOME_EMPRESARIAL.AsString = '' then
//begin
//FrmBackup.Caption:= FrmBackup.Caption;
//Exit;
//end else
//FrmBackup.Caption:= FrmBackup.Caption+' - '+Dm.IBDS_EMPRESANOME_FANTASIA.AsString;
end;

procedure TFrmBackup.DirectoryListBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then
 begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
FileListBox1.SetFocus;
  end;
end;

procedure TFrmBackup.DriveComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then
 begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
DirectoryListBox1.SetFocus;
  end;
end;

procedure TFrmBackup.FileListBox1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
BitBtn3.SetFocus;
  end;
end;

procedure TFrmBackup.CheckBox_BackupDiarioKeyPress(Sender: TObject;
  var Key: Char);
//var
//Reg: TRegistry;
//Diario: String;
begin
//if Key = #13 then
// begin
 // Key := #0;{ Suprime o som }
//  { escreva aqui os seus comandos }
//if CheckBox_BackupDiario.Checked = True then
//begin
//Diario:= 'Sim';
//end else
//Diario:= 'Não';
//Reg:=TRegistry.Create;
//Reg.CreateKey('Backup');
//If Reg.OpenKey('Backup', True) then
//begin
//Reg.WriteString('Backup Diário', Diario);
//Reg.CloseKey;
//end;
//end;
end;

procedure TFrmBackup.CheckBox_BackupDiarioClick(Sender: TObject);
begin
if CheckBox_BackupDiario.Checked = True then
begin
Diario:= 'Sim';
end else
Diario:= 'Não';
Reg:=TRegistry.Create;
Reg.CreateKey('Backup');
If Reg.OpenKey('Backup', True) then
begin
Reg.WriteString('Backup Diário', Diario);
Reg.CloseKey;
end;
end;

end.

unit UnSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Registry, ComCtrls, Mask;

type
  TFrmSenha = class(TForm)
    btnSair: TBitBtn;
    btnOK: TBitBtn;
    Label2: TLabel;
    Label1: TLabel;
    EditNome: TEdit;
    Image1: TImage;
    Bevel1: TBevel;
    Timer1: TTimer;
    EditSenha: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure EditNomeChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure EditNomeKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure EditSenhaChange(Sender: TObject);
    procedure MEdit_MesKeyPress(Sender: TObject; var Key: Char);
    procedure MEdit_DiaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  const 
  my_key = 21327;//33189;

var
  FrmSenha: TFrmSenha;
  cont:integer;
  Reg : TRegistry;
  Codificado, Descodificado :AnsiString;

implementation

uses UnDm, UnPrincipal, UnUsuarios, UnEncrypt, UnFrmDataGeral;

{$R *.DFM}

procedure TFrmSenha.btnOKClick(Sender: TObject);
begin
if EditNome.Text = '' then
begin
btnOK.Enabled:= False;
EditNome.SetFocus;
Exit;
end
else
Usuario:= EditNome.Text;
if EditSenha.Text = '' then
begin
btnOK.Enabled:= False;
EditSenha.SetFocus;
Exit;
end
else
Dm.IBQ_SENHA.close;
Dm.IBQ_SENHA.sql.clear;
Dm.IBQ_SENHA.sql.add('select * from USUARIOS where NOME_USUARIO='+char(39)+EditNome.text+char(39)+'and SENHA='+char(39)+Codificado+char(39));
Dm.IBQ_SENHA.open;                                                                                               //      +EditSenha.text+char(39));
if (Dm.IBQ_SENHANOME_USUARIO.Value<>'') and (Dm.IBQ_SENHASENHA.Value<>'')then
begin
Dm.IBQ_SENHA.close;
Dm.IBQ_SENHA.sql.clear;
Dm.IBQ_SENHA.sql.add('select * from USUARIOS');
Dm.IBQ_SENHA.open;
Dm.IBQ_SENHA.Locate('NOME_USUARIO', EditNome.Text, []);
iOK := 625;
//FrmPrincipal.Enabled:=True;
FrmPrincipal.StatusBar1.Panels[2].Text:= Usuario;
Close;
Exit;
end else
begin
inc(Cont);
Beep;
ShowMessage('Usuário não cadastrado ou senha incorreta.'+#10+#10+'Tente novamente.');
btnOK.Enabled:= False;
EditSenha.Text:='';
EditSenha.SetFocus;
if cont= 3 then
begin
MessageBox(FrmSenha.handle,'Esgotado as chances de tentativas.','Atenção',0+48);
Close;
application.terminate;
end;
end;
end;

procedure TFrmSenha.FormCreate(Sender: TObject);
var
Verificar: String;
begin
Shortdateformat:='dd/mm/yyyy';
Reg:=TRegistry.Create;
Reg.OpenKey('Login', True);
Verificar:=Reg.ReadString('Gees');
EditNome.Text:=Verificar;
Reg.CloseKey;
end;

procedure TFrmSenha.btnSairClick(Sender: TObject);
begin
Application.Terminate; 
end;

procedure TFrmSenha.EditNomeChange(Sender: TObject);
var
Caminho: String;
begin
Caminho:= EditNome.Text;
Reg:=TRegistry.Create;
Reg.CreateKey('Login');
If Reg.OpenKey('Login', True) then
begin
Reg.WriteString('Gees', Caminho);
Reg.CloseKey;
end;
end;

procedure TFrmSenha.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if iOK <> 625 then
Canclose := False;
end;

procedure TFrmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:= caFree; // libera o form da memória
end;

procedure TFrmSenha.FormShow(Sender: TObject);
begin
if EditNome.Text = '' then
begin
EditNome.SetFocus;
end else
EditSenha.SetFocus;
FrmPrincipal.Enabled:=false;
//if Dm.IBDS_EMPRESANOME_EMPRESARIAL.AsString = '' then
//begin
//FrmSenha.Caption:= FrmSenha.Caption;
//Exit;
//end else
//FrmSenha.Caption:= FrmSenha.Caption+' - '+Dm.IBDS_EMPRESANOME_FANTASIA.AsString;
end;

procedure TFrmSenha.EditNomeKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
if EditNome.Text = '' then
begin
EditNome.SetFocus;
Exit;
end else
EditSenha.SetFocus;
end;
end;

procedure TFrmSenha.EditSenhaKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
if EditNome.Text = '' then
begin
EditNome.SetFocus;
Exit;
end else
if EditSenha.Text = '' then
begin
EditSenha.SetFocus;
Exit;
end else
btnOK.Enabled:= True;
btnOK.OnClick(Nil);
end;
end;

procedure TFrmSenha.Timer1Timer(Sender: TObject);
begin
Image1.Visible:=not Image1.Visible;
end;

procedure TFrmSenha.EditSenhaChange(Sender: TObject);
begin
Codificado:= Encrypt(EditSenha.text,my_key);
Dm.IBQ_SENHA.close;
Dm.IBQ_SENHA.sql.clear;
Dm.IBQ_SENHA.sql.add('select * from USUARIOS where NOME_USUARIO='+char(39)+EditNome.text+char(39)+'and SENHA='+char(39)+Codificado+char(39));
Dm.IBQ_SENHA.open;                                                                                               //      +EditSenha.text+char(39));
if (Dm.IBQ_SENHANOME_USUARIO.Value<>'') and (Dm.IBQ_SENHASENHA.Value<>'')then
begin
Dm.IBQ_SENHA.close;
Dm.IBQ_SENHA.sql.clear;
Dm.IBQ_SENHA.sql.add('select * from USUARIOS');
Dm.IBQ_SENHA.open;
Dm.IBQ_SENHA.Locate('NOME_USUARIO', EditNome.Text, []);
Timer1.Enabled:=False;
Image1.Visible:=True;
Exit;
end
else
Timer1.Enabled:=True;
end;

procedure TFrmSenha.MEdit_MesKeyPress(Sender: TObject; var Key: Char);
begin
If not( key in['0'..'9',#8,#13] ) then
begin
Abort;
end;
end;

procedure TFrmSenha.MEdit_DiaKeyPress(Sender: TObject; var Key: Char);
begin
If not( key in['0'..'9',#8,#13] ) then
begin
Abort;
end;
end;

end.

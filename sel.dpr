program SEL;

uses
  Forms,
  Windows,
  Dialogs,
  UnBackup in 'UnBackup.pas' {FrmBackup},
  UnDm in 'UnDm.pas' {Dm: TDataModule},
  UnEncrypt in 'UnEncrypt.pas',
  UnAbertura in 'UnAbertura.pas' {FrmAbertura},
  UnPreview in 'UnPreview.pas' {FrmPreview},
  UnPrincipal in 'UnPrincipal.pas' {FrmPrincipal},
  UnSenha in 'UnSenha.pas' {FrmSenha},
  UnUsuarios in 'UnUsuarios.pas' {FrmUsuarios},
  UnFrmDataGeral in 'UnFrmDataGeral.pas' {FrmDataGeral},
  UnClientes in 'UnClientes.pas' {FrmClientes};

{$R *.res}

Var HprevHist : HWND;

begin
  Application.Initialize;
HprevHist := FindWindow(Nil, PChar('Sistema Expresso de Loja 1.0'));
if HprevHist = 0 then begin
 FrmAbertura:=TFrmAbertura.create(Application);
 FrmAbertura.Show;
 FrmAbertura.Refresh;
  Application.Title := 'Sistema Expresso de Loja 1.0';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDm, Dm);
  FrmAbertura.Free;
  Application.Run;
  end else
ShowMessage('Já existe uma cópia do "'+Application.Title+'" em execução.'+#13#13+
'Não será possível executar uma outra cópia deste aplicativo.');
end.

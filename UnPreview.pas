unit UnPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, QRPrntr, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TFrmPreview = class(TForm)
    QRPreview1: TQRPreview;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    lblSimbolo: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    sbPrimeiro: TBitBtn;
    sbAnterior: TBitBtn;
    sbProximo: TBitBtn;
    sbUltima: TBitBtn;
    sbSetup: TBitBtn;
    sbImprime: TBitBtn;
    sbFecha: TBitBtn;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Fechar1: TMenuItem;
    procedure ComboBox1Change(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimaClick(Sender: TObject);
    procedure QRPreview1PageAvailable(Sender: TObject; PageNum: Integer);
    procedure Edit1Change(Sender: TObject);
    procedure sbSetupClick(Sender: TObject);
    procedure sbImprimeClick(Sender: TObject);
    procedure sbFechaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ChecaPaginas;
  end;

var
  FrmPreview: TFrmPreview;

implementation

{$R *.DFM}

procedure TFrmPreview.ChecaPaginas;
begin
 Edit1.Text := IntToStr(QrPreview1.PageNumber);
 label1.Caption := 'de '+ IntToStr(QrPreview1.QrPrinter.PageCount);
 sbPrimeiro.Enabled := (qrPreview1.PageNumber > 1);
 sbAnterior.Enabled := (qrPreview1.PageNumber > 1);
 sbProximo.Enabled := (qrPreview1.PageNumber <
 qrPreview1.QRPrinter.PageCount);
 sbUltima.Enabled := (qrPreview1.PageNumber <
 qrPreview1.QRPrinter.PageCount);
end; 
procedure TFrmPreview.ComboBox1Change(Sender: TObject);
begin
  try
    qrPreview1.Zoom := StrToInt(ComboBox1.Text)
   except
  End;
end;

procedure TFrmPreview.sbPrimeiroClick(Sender: TObject);
begin
QrPreview1.PageNumber := 1;
ChecaPaginas;
end;

procedure TFrmPreview.sbAnteriorClick(Sender: TObject);
begin
QrPreview1.PageNumber := QrPreview1.PageNumber-1;
ChecaPaginas;
end;

procedure TFrmPreview.sbProximoClick(Sender: TObject);
begin
QrPreview1.PageNumber := QrPreview1.PageNumber+1;
ChecaPaginas;
end;

procedure TFrmPreview.sbUltimaClick(Sender: TObject);
begin
QrPreview1.PageNumber := QrPreview1.QRPrinter.PageCount;
ChecaPaginas;
end;

procedure TFrmPreview.QRPreview1PageAvailable(Sender: TObject;
  PageNum: Integer);
begin
ComboBox1Change(Nil);
  ChecaPaginas;
end;

procedure TFrmPreview.Edit1Change(Sender: TObject);
begin
 try
   qrPreview1.PageNumber := StrToInt(Edit1.Text);
  except
 End; // Try
end;

procedure TFrmPreview.sbSetupClick(Sender: TObject);
begin
QrPreview1.QRPrinter.PrintSetup;
end;

procedure TFrmPreview.sbImprimeClick(Sender: TObject);
begin
QrPreview1.QRPrinter.Print;
end;

procedure TFrmPreview.sbFechaClick(Sender: TObject);
begin
Close;
end;

procedure TFrmPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
frmPreview := Nil;
end;

end.

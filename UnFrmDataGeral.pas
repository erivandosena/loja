unit UnFrmDataGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls;

type
  TFrmDataGeral = class(TForm)
    MEdit_Dia: TMaskEdit;
    Label5: TLabel;
    MEdit_Mes: TMaskEdit;
    Label6: TLabel;
    MEdit_Ano: TMaskEdit;
    Label4: TLabel;
    Bevel1: TBevel;
    Label_DataExtenco: TLabel;
    procedure MEdit_DiaExit(Sender: TObject);
    procedure MEdit_MesExit(Sender: TObject);
    procedure MEdit_AnoExit(Sender: TObject);
    procedure MEdit_AnoKeyPress(Sender: TObject; var Key: Char);
    procedure MEdit_MesKeyPress(Sender: TObject; var Key: Char);
    procedure MEdit_DiaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function DataExtenso(Data:TDateTime): String;
  end;

var
  FrmDataGeral: TFrmDataGeral;
  Dia, Mes, Ano: Word;

implementation

uses UnPrincipal;

{$R *.dfm}

procedure TFrmDataGeral.MEdit_DiaExit(Sender: TObject);
begin
if MEdit_Dia.Text = '' then
begin
MEdit_Dia.Text:= '01';
end else
MEdit_Dia.Text:= FrmPrincipal.RetZero(MEdit_Dia.Text, 2);
end;

procedure TFrmDataGeral.MEdit_MesExit(Sender: TObject);
begin
if MEdit_Mes.Text = '' then
begin
MEdit_Mes.Text:= '01';
end else
MEdit_Mes.Text:= FrmPrincipal.RetZero(MEdit_Mes.Text, 2);
end;

procedure TFrmDataGeral.MEdit_AnoExit(Sender: TObject);
begin
if MEdit_Ano.Text = '' then
begin
MEdit_Ano.Text:= '1930';
end;
end;

procedure TFrmDataGeral.MEdit_AnoKeyPress(Sender: TObject; var Key: Char);
begin
If not( key in['0'..'9',#8,#13] ) then
begin
Abort;
end;
if Key = #13 then
 begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
if MEdit_Ano.Text = '' then
begin
MEdit_Ano.Text:= '1930';
end else
Label_DataExtenco.Caption:=DataExtenso(Data);
Close;
end;
end;

procedure TFrmDataGeral.MEdit_MesKeyPress(Sender: TObject; var Key: Char);
begin
If not( key in['0'..'9',#8,#13] ) then
begin
Abort;
end;
if Key = #13 then
 begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
MEdit_Ano.SetFocus;
end;
end;

procedure TFrmDataGeral.MEdit_DiaKeyPress(Sender: TObject; var Key: Char);
begin
If not( key in['0'..'9',#8,#13] ) then
begin
Abort;
end;
if Key = #13 then
 begin
  Key := #0;{ Suprime o som }
  { escreva aqui os seus comandos }
MEdit_Mes.SetFocus;
end;
end;

procedure TFrmDataGeral.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
try
StrToDate(MEdit_Dia.Text+'/'+MEdit_Mes.Text+'/'+MEdit_Ano.Text);
except
on EConvertError do begin
ShowMessage ('Data inválida.');
Exit;
end;
end;
Dia:= StrToInt(MEdit_Dia.Text);
Mes:= StrToInt(MEdit_Mes.Text);
Ano:= StrToInt(MEdit_Ano.Text);
Data:= EncodeDate(Ano, Mes, Dia);
AnoBase:= FormatDateTime('yyyy',Data);
FrmPrincipal.Enabled:=True;
Close;
end;

procedure TFrmDataGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:= caFree; // libera o form da memória
end;

procedure TFrmDataGeral.FormCreate(Sender: TObject);
begin
Shortdateformat:='dd/mm/yyyy';
Data:= Date;
DecodeDate (Data, Ano, Mes, Dia);
MEdit_Dia.Text:= IntToStr(Dia);
MEdit_Dia.Text:= FrmPrincipal.RetZero(MEdit_Dia.Text, 2);
MEdit_Mes.Text:= IntToStr(Mes);
MEdit_Mes.Text:= FrmPrincipal.RetZero(MEdit_Mes.Text, 2);
MEdit_Ano.Text:= IntToStr(Ano);
end;

function TFrmDataGeral.DataExtenso(Data: TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terçafeira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Março';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result := DiaDaSemana[NoDia] + ', ' +
  IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
end;

procedure TFrmDataGeral.FormShow(Sender: TObject);
begin
Label_DataExtenco.Caption:=DataExtenso(Data);
end;

end.

object FrmDataGeral: TFrmDataGeral
  Left = 226
  Top = 207
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Data'
  ClientHeight = 120
  ClientWidth = 435
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 435
    Height = 120
    Align = alClient
    Shape = bsFrame
  end
  object Label5: TLabel
    Left = 144
    Top = 41
    Width = 22
    Height = 41
    Caption = '/'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 227
    Top = 41
    Width = 22
    Height = 41
    Caption = '/'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 88
    Top = 5
    Width = 265
    Height = 29
    Caption = 'Confirma a Data Atual?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_DataExtenco: TLabel
    Left = 88
    Top = 93
    Width = 209
    Height = 16
    Caption = 'Baturit'#233',  21 de Mar'#231'o de 1976'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MEdit_Dia: TMaskEdit
    Left = 88
    Top = 40
    Width = 50
    Height = 41
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkTile
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    MaxLength = 2
    ParentFont = False
    TabOrder = 2
    Text = '21'
    OnExit = MEdit_DiaExit
    OnKeyPress = MEdit_DiaKeyPress
  end
  object MEdit_Mes: TMaskEdit
    Left = 171
    Top = 40
    Width = 50
    Height = 41
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkTile
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    MaxLength = 2
    ParentFont = False
    TabOrder = 1
    Text = '03'
    OnExit = MEdit_MesExit
    OnKeyPress = MEdit_MesKeyPress
  end
  object MEdit_Ano: TMaskEdit
    Left = 254
    Top = 40
    Width = 100
    Height = 41
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkTile
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 0
    Text = '1976'
    OnExit = MEdit_AnoExit
    OnKeyPress = MEdit_AnoKeyPress
  end
end

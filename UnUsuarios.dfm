object FrmUsuarios: TFrmUsuarios
  Left = 380
  Top = 316
  BorderIcons = [biHelp]
  BorderStyle = bsSingle
  Caption = 'Usu'#225'rios'
  ClientHeight = 426
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 12
    Top = 53
    Width = 411
    Height = 52
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 48
    Top = 59
    Width = 82
    Height = 13
    Caption = 'Nome do Usu'#225'rio'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 320
    Top = 59
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object Label3: TLabel
    Left = 12
    Top = 112
    Width = 44
    Height = 13
    Caption = 'Usu'#225'rios:'
  end
  object Panel1: TPanel
    Left = 12
    Top = 312
    Width = 411
    Height = 101
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object SbExcluir: TBitBtn
      Left = 210
      Top = 8
      Width = 90
      Height = 40
      Cursor = crHandPoint
      Caption = '&Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = SbExcluirClick
    end
    object SbCancelar: TBitBtn
      Left = 310
      Top = 8
      Width = 90
      Height = 40
      Cursor = crHandPoint
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = SbCancelarClick
    end
    object SbNova: TBitBtn
      Left = 10
      Top = 8
      Width = 90
      Height = 40
      Cursor = crHandPoint
      Caption = 'No&vo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = SbNovaClick
    end
    object SbSalvar: TBitBtn
      Left = 110
      Top = 8
      Width = 90
      Height = 40
      Cursor = crHandPoint
      Caption = '&Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = SbSalvarClick
    end
    object SbAtualizar: TBitBtn
      Left = 10
      Top = 52
      Width = 190
      Height = 40
      Cursor = crHandPoint
      Caption = '&Alterar Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = SbAtualizarClick
    end
    object SpeedButton1: TBitBtn
      Left = 210
      Top = 52
      Width = 190
      Height = 40
      Cursor = crHandPoint
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = SpeedButton1Click
    end
  end
  object DBEdit1: TDBEdit
    Left = 48
    Top = 74
    Width = 225
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkTile
    BorderStyle = bsNone
    CharCase = ecUpperCase
    DataField = 'NOME_USUARIO'
    DataSource = Dm.Ds_USUARIOS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 12
    Top = 128
    Width = 411
    Height = 177
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NOME_USUARIO'
        ReadOnly = True
        Width = 388
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 41
    Align = alTop
    Caption = 'CADASTRO DE USU'#193'RIOS'
    Color = clActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object MaskEdit1: TMaskEdit
    Left = 320
    Top = 74
    Width = 66
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkTile
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
    OnChange = MaskEdit1Change
    OnKeyPress = MaskEdit1KeyPress
  end
  object DataSource1: TDataSource
    DataSet = Dm.IBDS_USUARIOS
    OnStateChange = DataSource1StateChange
    Left = 360
    Top = 136
  end
  object MainMenu1: TMainMenu
    Left = 360
    Top = 168
    object Arquivo1: TMenuItem
      Caption = 'Menu'
      ShortCut = 123
      Visible = False
      object N2: TMenuItem
        Caption = '-'
      end
      object Fechar1: TMenuItem
        Caption = 'Fechar'
        ShortCut = 122
        OnClick = SpeedButton1Click
      end
    end
  end
  object IBQueryUsuario: TIBQuery
    Database = Dm.IBDatabase
    Transaction = Dm.IBTransaction
    SQL.Strings = (
      'select NOME_USUARIO from USUARIOS'
      'order by NOME_USUARIO')
    Left = 184
    Top = 160
  end
end

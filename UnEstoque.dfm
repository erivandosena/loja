object FrmEstoque: TFrmEstoque
  Left = 178
  Top = 5
  BorderIcons = [biHelp]
  BorderStyle = bsSingle
  Caption = 'Estoque'
  ClientHeight = 426
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label_Prod: TLabel
    Left = 16
    Top = 60
    Width = 165
    Height = 13
    Caption = 'Pesquisa manual de produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object MEdit_Prod: TMaskEdit
    Left = 184
    Top = 55
    Width = 593
    Height = 24
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkTile
    BiDiMode = bdLeftToRight
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -20
    Font.Name = 'Courier'
    Font.Style = [fsBold]
    MaxLength = 13
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    Visible = False
    OnKeyPress = MEdit_ProdKeyPress
    OnKeyUp = MEdit_ProdKeyUp
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    Caption = 'ESTOQUE'
    Color = clActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object DBGrid_Estoque: TDBGrid
    Left = 14
    Top = 84
    Width = 764
    Height = 290
    DataSource = Ds_Estoque
    FixedColor = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid_EstoqueDrawColumnCell
    OnDblClick = DBGrid_EstoqueDblClick
    OnKeyDown = DBGrid_EstoqueKeyDown
    OnKeyPress = DBGrid_EstoqueKeyPress
    OnKeyUp = DBGrid_EstoqueKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Width = 371
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADE_ESTOQUE'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE_ESTOQUE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTOQUE_MINIMO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VALOR_CUSTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IMPOSTO_PRODUTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LUCRO_PRODUTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VALOR_LUCRO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VALOR_VENDA'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORNECEDOR'
        Visible = False
      end>
  end
  object GroupBox_Estoque: TGroupBox
    Left = 6
    Top = 128
    Width = 781
    Height = 209
    Caption = 'Atualiza'#231#227'o / Manuten'#231#227'o do Estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = False
    object Label1: TLabel
      Left = 8
      Top = 26
      Width = 58
      Height = 13
      Caption = 'C'#243'digo EAN'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 307
      Top = 26
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 74
      Top = 66
      Width = 77
      Height = 13
      Caption = 'Estoque M'#237'nimo'
      FocusControl = DBEdit7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 118
      Top = 26
      Width = 45
      Height = 13
      Caption = 'Categoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 66
      Width = 55
      Height = 13
      Caption = 'Quantidade'
      FocusControl = DBEdit6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 640
      Top = 26
      Width = 40
      Height = 13
      Caption = 'Unidade'
      FocusControl = DBEdit6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 162
      Top = 66
      Width = 69
      Height = 13
      Caption = 'Valor de Custo'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 250
      Top = 66
      Width = 59
      Height = 13
      Caption = 'Impostos (%)'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 338
      Top = 66
      Width = 59
      Height = 13
      Caption = 'Marckup (%)'
      FocusControl = DBEdit4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 426
      Top = 66
      Width = 68
      Height = 13
      Caption = 'Margem Lucro'
      FocusControl = DBEdit8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 514
      Top = 66
      Width = 73
      Height = 13
      Caption = 'Valor de Venda'
      FocusControl = DBEdit9
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 602
      Top = 66
      Width = 54
      Height = 13
      Caption = 'Fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ABarra1: TABarra
      Left = 9
      Top = 20
      Width = 96
      Height = 0
      Visible = False
      Digito = '1'
      CorBarra = clBlack
      CorEspaco = clWhite
      Tipo = cdEAN13
      Codigo = '123456789123'
      Largura = 1
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 40
      Width = 100
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkTile
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = Dm.Ds_ESTOQUE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 80
      Width = 56
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkTile
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'QUANTIDADE_ESTOQUE'
      DataSource = Dm.Ds_ESTOQUE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 74
      Top = 80
      Width = 78
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkTile
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'ESTOQUE_MINIMO'
      DataSource = Dm.Ds_ESTOQUE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object DBEdit5: TDBEdit
      Left = 307
      Top = 40
      Width = 323
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkTile
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = Dm.Ds_ESTOQUE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBComboBox2: TDBComboBox
      Left = 640
      Top = 40
      Width = 130
      Height = 21
      Style = csDropDownList
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkTile
      CharCase = ecUpperCase
      DataField = 'UNIDADE_ESTOQUE'
      DataSource = Dm.Ds_ESTOQUE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        'UNIDADE'
        'CAIXA'
        'FARDO'
        'CARTELA'
        'SACA')
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 162
      Top = 80
      Width = 78
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkTile
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'VALOR_CUSTO'
      DataSource = Dm.Ds_ESTOQUE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object DBEdit3: TDBEdit
      Left = 250
      Top = 80
      Width = 78
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkTile
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'IMPOSTO_PRODUTO'
      DataSource = Dm.Ds_ESTOQUE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object DBEdit4: TDBEdit
      Left = 338
      Top = 80
      Width = 78
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkTile
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'LUCRO_PRODUTO'
      DataSource = Dm.Ds_ESTOQUE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object DBEdit8: TDBEdit
      Left = 426
      Top = 80
      Width = 78
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkTile
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'VALOR_LUCRO'
      DataSource = Dm.Ds_ESTOQUE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object DBEdit9: TDBEdit
      Left = 514
      Top = 80
      Width = 78
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkTile
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'VALOR_VENDA'
      DataSource = Dm.Ds_ESTOQUE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object DBEdit10: TDBEdit
      Left = 602
      Top = 80
      Width = 168
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkTile
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'FORNECEDOR'
      DataSource = Dm.Ds_ESTOQUE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object DBComboBox1: TDBComboBox
      Left = 118
      Top = 40
      Width = 177
      Height = 21
      Style = csDropDownList
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkTile
      CharCase = ecUpperCase
      DataField = 'CATEGORIA_PRODUTO'
      DataSource = Dm.Ds_ESTOQUE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        'BEBIDA'
        'REFEI'#199#195'O'
        'GULOSEIMA'
        'DIVERSOS')
      ParentFont = False
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 8
      Top = 120
      Width = 765
      Height = 81
      BevelOuter = bvLowered
      TabOrder = 12
      object SbNovo: TBitBtn
        Left = 16
        Top = 27
        Width = 70
        Height = 30
        Cursor = crHandPoint
        Caption = 'No&vo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = SbNovoClick
      end
      object SbSalvar: TBitBtn
        Left = 86
        Top = 27
        Width = 70
        Height = 30
        Cursor = crHandPoint
        Caption = '&Salvar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = SbSalvarClick
      end
      object SbExcluir: TBitBtn
        Left = 156
        Top = 27
        Width = 70
        Height = 30
        Cursor = crHandPoint
        Caption = '&Excluir'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = SbExcluirClick
      end
      object SbCancelar: TBitBtn
        Left = 226
        Top = 27
        Width = 70
        Height = 30
        Cursor = crHandPoint
        Caption = '&Cancelar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = SbCancelarClick
      end
      object SbAnterior: TBitBtn
        Left = 316
        Top = 27
        Width = 70
        Height = 30
        Cursor = crHandPoint
        Caption = 'An&terior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = SbAnteriorClick
      end
      object SbProximo: TBitBtn
        Left = 386
        Top = 27
        Width = 70
        Height = 30
        Cursor = crHandPoint
        Caption = 'P&r'#243'ximo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = SbProximoClick
        Layout = blGlyphRight
      end
      object SbAtualiza: TBitBtn
        Left = 477
        Top = 27
        Width = 70
        Height = 30
        Cursor = crHandPoint
        Caption = 'Atualizar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = SbAtualizaClick
      end
      object BtnOpcoes: TBitBtn
        Left = 555
        Top = 27
        Width = 119
        Height = 30
        Cursor = crHandPoint
        Caption = '&Voltar <<'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnClick = BtnOpcoesClick
      end
      object SbFechar: TBitBtn
        Left = 683
        Top = 27
        Width = 70
        Height = 30
        Cursor = crHandPoint
        Cancel = True
        Caption = '&Fechar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 2
        ParentFont = False
        TabOrder = 8
      end
    end
  end
  object BtnManutencao: TBitBtn
    Left = 569
    Top = 387
    Width = 119
    Height = 30
    Cursor = crHandPoint
    Caption = '&Manuten'#231#227'o >>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = DBGrid_EstoqueDblClick
  end
  object BtnFechar: TBitBtn
    Left = 697
    Top = 387
    Width = 70
    Height = 30
    Cursor = crHandPoint
    Cancel = True
    Caption = '&Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
    OnClick = BtnFecharClick
  end
  object DS_Codigo: TDataSource
    DataSet = IBQueryCodigo
    OnStateChange = DS_CodigoStateChange
    Left = 436
    Top = 40
  end
  object IBQueryCodigo: TIBQuery
    Database = Dm.IBDatabase
    Transaction = Dm.IBTransaction
    ForcedRefresh = True
    BufferChunks = 10
    CachedUpdates = True
    SQL.Strings = (
      'select CODIGO from ESTOQUE'
      'order by CODIGO')
    Left = 400
    Top = 40
  end
  object MainMenu1: TMainMenu
    Left = 544
    Top = 40
    object Arquivo1: TMenuItem
      Caption = 'Menu'
      ShortCut = 123
      Visible = False
      object Fechar1: TMenuItem
        Caption = 'Fechar'
        ShortCut = 122
        OnClick = Fechar1Click
      end
    end
  end
  object IBQuery_Estoque: TIBQuery
    Database = Dm.IBDatabase
    Transaction = Dm.IBTransaction
    ForcedRefresh = True
    BufferChunks = 10
    CachedUpdates = True
    SQL.Strings = (
      'select * from ESTOQUE')
    Left = 312
    Top = 40
    object IBQuery_EstoqueCOD_ESTO: TIntegerField
      FieldName = 'COD_ESTO'
      Origin = '"ESTOQUE"."COD_ESTO"'
      Required = True
      Visible = False
    end
    object IBQuery_EstoqueCODIGO: TIBStringField
      DisplayLabel = 'C'#243'digo EAN'
      FieldName = 'CODIGO'
      Origin = '"ESTOQUE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object IBQuery_EstoqueCATEGORIA_PRODUTO: TIBStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA_PRODUTO'
      Origin = '"ESTOQUE"."CATEGORIA_PRODUTO"'
    end
    object IBQuery_EstoqueDESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = '"ESTOQUE"."DESCRICAO"'
      Size = 30
    end
    object IBQuery_EstoqueUNIDADE_ESTOQUE: TIBStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE_ESTOQUE'
      Origin = '"ESTOQUE"."UNIDADE_ESTOQUE"'
      Size = 10
    end
    object IBQuery_EstoqueQUANTIDADE_ESTOQUE: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE_ESTOQUE'
      Origin = '"ESTOQUE"."QUANTIDADE_ESTOQUE"'
    end
    object IBQuery_EstoqueESTOQUE_MINIMO: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Estoque M'#237'nimo'
      FieldName = 'ESTOQUE_MINIMO'
      Origin = '"ESTOQUE"."ESTOQUE_MINIMO"'
    end
    object IBQuery_EstoqueVALOR_CUSTO: TIBBCDField
      DisplayLabel = 'Valor de Custo'
      FieldName = 'VALOR_CUSTO'
      Origin = '"ESTOQUE"."VALOR_CUSTO"'
      currency = True
      Precision = 18
      Size = 2
    end
    object IBQuery_EstoqueVALOR_LUCRO: TIBBCDField
      DisplayLabel = 'Margem Lucro'
      FieldName = 'VALOR_LUCRO'
      Origin = '"ESTOQUE"."VALOR_LUCRO"'
      currency = True
      Precision = 18
      Size = 2
    end
    object IBQuery_EstoqueLUCRO_PRODUTO: TFloatField
      DisplayLabel = 'Marckup (%)'
      FieldName = 'LUCRO_PRODUTO'
      Origin = '"ESTOQUE"."LUCRO_PRODUTO"'
    end
    object IBQuery_EstoqueIMPOSTO_PRODUTO: TFloatField
      DisplayLabel = 'Impostos (%)'
      FieldName = 'IMPOSTO_PRODUTO'
      Origin = '"ESTOQUE"."IMPOSTO_PRODUTO"'
    end
    object IBQuery_EstoqueVALOR_VENDA: TIBBCDField
      DisplayLabel = 'Valor de Venda'
      FieldName = 'VALOR_VENDA'
      Origin = '"ESTOQUE"."VALOR_VENDA"'
      currency = True
      Precision = 18
      Size = 2
    end
    object IBQuery_EstoqueFORNECEDOR: TIBStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Origin = '"ESTOQUE"."FORNECEDOR"'
      Size = 51
    end
  end
  object Ds_Estoque: TDataSource
    DataSet = IBQuery_Estoque
    Left = 344
    Top = 41
  end
  object DataSource1: TDataSource
    DataSet = Dm.IBDS_ESTOQUE
    OnStateChange = DataSource1StateChange
    Left = 502
    Top = 40
  end
  object Barcode1: TBarcode
    Height = 0
    Top = 368
    Left = 136
    Modul = 1
    Ratio = 2.000000000000000000
    Typ = bcCodeEAN13
    ShowText = True
  end
end

object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 380
  Top = 291
  Height = 383
  Width = 583
  object IBDatabase: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Inforamos\sel\informac\sel.gdb'
    Params.Strings = (
      'user_name=INFORAMOS'
      'password=eri21033001')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    Left = 40
    Top = 8
  end
  object IBTransaction: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version')
    Left = 112
    Top = 8
  end
  object Ds_USUARIOS: TDataSource
    DataSet = IBDS_USUARIOS
    Left = 32
    Top = 128
  end
  object IBDS_USUARIOS: TIBDataSet
    Database = IBDatabase
    Transaction = IBTransaction
    ForcedRefresh = True
    BufferChunks = 10
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from USUARIOS'
      'where'
      '  NOME_USUARIO = :OLD_NOME_USUARIO')
    InsertSQL.Strings = (
      'insert into USUARIOS'
      '  (NOME_USUARIO, SENHA, ANTERIOR)'
      'values'
      '  (:NOME_USUARIO, :SENHA, :ANTERIOR)')
    RefreshSQL.Strings = (
      'Select '
      '  NOME_USUARIO,'
      '  SENHA,'
      '  ANTERIOR'
      'from USUARIOS '
      'where'
      '  NOME_USUARIO = :NOME_USUARIO')
    SelectSQL.Strings = (
      'select * from USUARIOS'
      'order by NOME_USUARIO')
    ModifySQL.Strings = (
      'update USUARIOS'
      'set'
      '  NOME_USUARIO = :NOME_USUARIO,'
      '  SENHA = :SENHA,'
      '  ANTERIOR = :ANTERIOR'
      'where'
      '  NOME_USUARIO = :OLD_NOME_USUARIO')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 32
    Top = 72
    object IBDS_USUARIOSNOME_USUARIO: TIBStringField
      FieldName = 'NOME_USUARIO'
      Origin = '"USUARIOS"."NOME_USUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDS_USUARIOSSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"USUARIOS"."SENHA"'
      Size = 15
    end
    object IBDS_USUARIOSANTERIOR: TIBStringField
      FieldName = 'ANTERIOR'
      Origin = '"USUARIOS"."ANTERIOR"'
      Size = 15
    end
  end
  object IBQ_SENHA: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    ForcedRefresh = True
    CachedUpdates = True
    SQL.Strings = (
      'select * from USUARIOS')
    Left = 280
    Top = 8
    object IBQ_SENHANOME_USUARIO: TIBStringField
      FieldName = 'NOME_USUARIO'
      Origin = '"USUARIOS"."NOME_USUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
    end
    object IBQ_SENHASENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"USUARIOS"."SENHA"'
      FixedChar = True
      Size = 15
    end
  end
  object DSSENHA: TDataSource
    DataSet = IBQ_SENHA
    Left = 352
    Top = 8
  end
  object IBConfigService: TIBConfigService
    LoginPrompt = False
    TraceFlags = []
    Left = 200
    Top = 8
  end
  object IBDS_CEPS: TIBDataSet
    Database = IBDatabase
    Transaction = IBTransaction
    ForcedRefresh = True
    BufferChunks = 10
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CEPS'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  NOME_CID = :OLD_NOME_CID and'
      '  CEP_CID = :OLD_CEP_CID and'
      '  ESTADO = :OLD_ESTADO and'
      '  UF = :OLD_UF')
    InsertSQL.Strings = (
      'insert into CEPS'
      '  (CODIGO, NOME_CID, CEP_CID, ESTADO, UF)'
      'values'
      '  (:CODIGO, :NOME_CID, :CEP_CID, :ESTADO, :UF)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  NOME_CID,'
      '  CEP_CID,'
      '  ESTADO,'
      '  UF'
      'from CEPS '
      'where'
      '  CODIGO = :CODIGO and'
      '  NOME_CID = :NOME_CID and'
      '  CEP_CID = :CEP_CID and'
      '  ESTADO = :ESTADO and'
      '  UF = :UF')
    SelectSQL.Strings = (
      'select * from CEPS')
    ModifySQL.Strings = (
      'update CEPS'
      'set'
      '  CODIGO = :CODIGO,'
      '  NOME_CID = :NOME_CID,'
      '  CEP_CID = :CEP_CID,'
      '  ESTADO = :ESTADO,'
      '  UF = :UF'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  NOME_CID = :OLD_NOME_CID and'
      '  CEP_CID = :OLD_CEP_CID and'
      '  ESTADO = :OLD_ESTADO and'
      '  UF = :OLD_UF')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 116
    Top = 76
    object IBDS_CEPSCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"CEPS"."CODIGO"'
      Required = True
    end
    object IBDS_CEPSNOME_CID: TIBStringField
      FieldName = 'NOME_CID'
      Origin = '"CEPS"."NOME_CID"'
      Size = 25
    end
    object IBDS_CEPSCEP_CID: TIBStringField
      FieldName = 'CEP_CID'
      Origin = '"CEPS"."CEP_CID"'
      EditMask = '99.999-999;1;_'
      Size = 10
    end
    object IBDS_CEPSESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"CEPS"."ESTADO"'
      Size = 25
    end
    object IBDS_CEPSUF: TIBStringField
      FieldName = 'UF'
      Origin = '"CEPS"."UF"'
      Size = 2
    end
  end
  object Ds_CEPS: TDataSource
    DataSet = IBDS_CEPS
    Left = 120
    Top = 128
  end
  object IBDS_ESTOQUE: TIBDataSet
    Database = IBDatabase
    Transaction = IBTransaction
    ForcedRefresh = True
    AfterInsert = IBDS_ESTOQUEAfterInsert
    BufferChunks = 10
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from ESTOQUE'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into ESTOQUE'
      
        '  (COD_ESTO, CODIGO, CATEGORIA_PRODUTO, DESCRICAO, UNIDADE_ESTOQ' +
        'UE, QUANTIDADE_ESTOQUE, '
      
        '   ESTOQUE_MINIMO, VALOR_CUSTO, LUCRO_PRODUTO, IMPOSTO_PRODUTO, ' +
        'VALOR_LUCRO, '
      '   VALOR_VENDA, FORNECEDOR)'
      'values'
      
        '  (:COD_ESTO, :CODIGO, :CATEGORIA_PRODUTO, :DESCRICAO, :UNIDADE_' +
        'ESTOQUE, '
      
        '   :QUANTIDADE_ESTOQUE, :ESTOQUE_MINIMO, :VALOR_CUSTO, :LUCRO_PR' +
        'ODUTO, '
      '   :IMPOSTO_PRODUTO, :VALOR_LUCRO, :VALOR_VENDA, :FORNECEDOR)')
    RefreshSQL.Strings = (
      'Select '
      '  COD_ESTO,'
      '  CODIGO,'
      '  CATEGORIA_PRODUTO,'
      '  DESCRICAO,'
      '  UNIDADE_ESTOQUE,'
      '  QUANTIDADE_ESTOQUE,'
      '  ESTOQUE_MINIMO,'
      '  VALOR_CUSTO,'
      '  LUCRO_PRODUTO,'
      '  IMPOSTO_PRODUTO,'
      '  VALOR_LUCRO,'
      '  VALOR_VENDA,'
      '  FORNECEDOR'
      'from ESTOQUE '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select * from ESTOQUE')
    ModifySQL.Strings = (
      'update ESTOQUE'
      'set'
      '  COD_ESTO = :COD_ESTO,'
      '  CODIGO = :CODIGO,'
      '  CATEGORIA_PRODUTO = :CATEGORIA_PRODUTO,'
      '  DESCRICAO = :DESCRICAO,'
      '  UNIDADE_ESTOQUE = :UNIDADE_ESTOQUE,'
      '  QUANTIDADE_ESTOQUE = :QUANTIDADE_ESTOQUE,'
      '  ESTOQUE_MINIMO = :ESTOQUE_MINIMO,'
      '  VALOR_CUSTO = :VALOR_CUSTO,'
      '  LUCRO_PRODUTO = :LUCRO_PRODUTO,'
      '  IMPOSTO_PRODUTO = :IMPOSTO_PRODUTO,'
      '  VALOR_LUCRO = :VALOR_LUCRO,'
      '  VALOR_VENDA = :VALOR_VENDA,'
      '  FORNECEDOR = :FORNECEDOR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 204
    Top = 76
    object IBDS_ESTOQUECOD_ESTO: TIntegerField
      FieldName = 'COD_ESTO'
      Origin = '"ESTOQUE"."COD_ESTO"'
      Required = True
    end
    object IBDS_ESTOQUECODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"ESTOQUE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object IBDS_ESTOQUECATEGORIA_PRODUTO: TIBStringField
      FieldName = 'CATEGORIA_PRODUTO'
      Origin = '"ESTOQUE"."CATEGORIA_PRODUTO"'
    end
    object IBDS_ESTOQUEDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ESTOQUE"."DESCRICAO"'
      Size = 30
    end
    object IBDS_ESTOQUEUNIDADE_ESTOQUE: TIBStringField
      FieldName = 'UNIDADE_ESTOQUE'
      Origin = '"ESTOQUE"."UNIDADE_ESTOQUE"'
      Size = 10
    end
    object IBDS_ESTOQUEQUANTIDADE_ESTOQUE: TIntegerField
      Alignment = taCenter
      FieldName = 'QUANTIDADE_ESTOQUE'
      Origin = '"ESTOQUE"."QUANTIDADE_ESTOQUE"'
    end
    object IBDS_ESTOQUEESTOQUE_MINIMO: TIntegerField
      Alignment = taCenter
      FieldName = 'ESTOQUE_MINIMO'
      Origin = '"ESTOQUE"."ESTOQUE_MINIMO"'
    end
    object IBDS_ESTOQUEVALOR_CUSTO: TIBBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = '"ESTOQUE"."VALOR_CUSTO"'
      currency = True
      Precision = 18
      Size = 2
    end
    object IBDS_ESTOQUEVALOR_LUCRO: TIBBCDField
      FieldName = 'VALOR_LUCRO'
      Origin = '"ESTOQUE"."VALOR_LUCRO"'
      currency = True
      Precision = 18
      Size = 2
    end
    object IBDS_ESTOQUELUCRO_PRODUTO: TFloatField
      FieldName = 'LUCRO_PRODUTO'
      Origin = '"ESTOQUE"."LUCRO_PRODUTO"'
    end
    object IBDS_ESTOQUEIMPOSTO_PRODUTO: TFloatField
      FieldName = 'IMPOSTO_PRODUTO'
      Origin = '"ESTOQUE"."IMPOSTO_PRODUTO"'
    end
    object IBDS_ESTOQUEVALOR_VENDA: TIBBCDField
      FieldName = 'VALOR_VENDA'
      Origin = '"ESTOQUE"."VALOR_VENDA"'
      currency = True
      Precision = 18
      Size = 2
    end
    object IBDS_ESTOQUEFORNECEDOR: TIBStringField
      FieldName = 'FORNECEDOR'
      Origin = '"ESTOQUE"."FORNECEDOR"'
      Size = 51
    end
  end
  object Ds_ESTOQUE: TDataSource
    DataSet = IBDS_ESTOQUE
    Left = 208
    Top = 128
  end
  object CODIGO_ESTOQUE: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    ForcedRefresh = True
    BufferChunks = 10
    CachedUpdates = True
    SQL.Strings = (
      'select max (COD_ESTO) from ESTOQUE')
    Left = 208
    Top = 184
  end
  object IBDS_CLIENTES: TIBDataSet
    Database = IBDatabase
    Transaction = IBTransaction
    ForcedRefresh = True
    AfterInsert = IBDS_CLIENTESAfterInsert
    BufferChunks = 10
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CLIENTES'
      'where'
      '  COD_CLIE = :OLD_COD_CLIE')
    InsertSQL.Strings = (
      'insert into CLIENTES'
      
        '  (COD_CLIE, DATA_CADASTRO, DATA_ATUALIZADO, CLIENTE, APELIDO, R' +
        'G, CPF, '
      
        '   IE, DATA_NASCIMENTO, PAI, MAE, ENDERECO, TELEFONE, CIDADE, BA' +
        'IRRO, CEP, '
      
        '   ESTADO, UF, PONTO_REFERENCIA, OBS, FOTO, NOME_EMPRESARIAL, NO' +
        'ME_FANTASIA, '
      '   CONTATO, RAMO_ATIVIDADE, FAX, EMAIL, NOME_USUARIO, TIPO)'
      'values'
      
        '  (:COD_CLIE, :DATA_CADASTRO, :DATA_ATUALIZADO, :CLIENTE, :APELI' +
        'DO, :RG, '
      
        '   :CPF, :IE, :DATA_NASCIMENTO, :PAI, :MAE, :ENDERECO, :TELEFONE' +
        ', :CIDADE, '
      
        '   :BAIRRO, :CEP, :ESTADO, :UF, :PONTO_REFERENCIA, :OBS, :FOTO, ' +
        ':NOME_EMPRESARIAL, '
      
        '   :NOME_FANTASIA, :CONTATO, :RAMO_ATIVIDADE, :FAX, :EMAIL, :NOM' +
        'E_USUARIO, '
      '   :TIPO)')
    RefreshSQL.Strings = (
      'Select '
      '  COD_CLIE,'
      '  DATA_CADASTRO,'
      '  DATA_ATUALIZADO,'
      '  CLIENTE,'
      '  APELIDO,'
      '  RG,'
      '  CPF,'
      '  IE,'
      '  DATA_NASCIMENTO,'
      '  PAI,'
      '  MAE,'
      '  ENDERECO,'
      '  TELEFONE,'
      '  CIDADE,'
      '  BAIRRO,'
      '  CEP,'
      '  ESTADO,'
      '  UF,'
      '  PONTO_REFERENCIA,'
      '  OBS,'
      '  FOTO,'
      '  NOME_EMPRESARIAL,'
      '  NOME_FANTASIA,'
      '  CONTATO,'
      '  RAMO_ATIVIDADE,'
      '  FAX,'
      '  EMAIL,'
      '  NOME_USUARIO,'
      '  TIPO'
      'from CLIENTES '
      'where'
      '  COD_CLIE = :COD_CLIE')
    SelectSQL.Strings = (
      'select * from CLIENTES'
      'order by COD_CLIE,TIPO')
    ModifySQL.Strings = (
      'update CLIENTES'
      'set'
      '  COD_CLIE = :COD_CLIE,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  DATA_ATUALIZADO = :DATA_ATUALIZADO,'
      '  CLIENTE = :CLIENTE,'
      '  APELIDO = :APELIDO,'
      '  RG = :RG,'
      '  CPF = :CPF,'
      '  IE = :IE,'
      '  DATA_NASCIMENTO = :DATA_NASCIMENTO,'
      '  PAI = :PAI,'
      '  MAE = :MAE,'
      '  ENDERECO = :ENDERECO,'
      '  TELEFONE = :TELEFONE,'
      '  CIDADE = :CIDADE,'
      '  BAIRRO = :BAIRRO,'
      '  CEP = :CEP,'
      '  ESTADO = :ESTADO,'
      '  UF = :UF,'
      '  PONTO_REFERENCIA = :PONTO_REFERENCIA,'
      '  OBS = :OBS,'
      '  FOTO = :FOTO,'
      '  NOME_EMPRESARIAL = :NOME_EMPRESARIAL,'
      '  NOME_FANTASIA = :NOME_FANTASIA,'
      '  CONTATO = :CONTATO,'
      '  RAMO_ATIVIDADE = :RAMO_ATIVIDADE,'
      '  FAX = :FAX,'
      '  EMAIL = :EMAIL,'
      '  NOME_USUARIO = :NOME_USUARIO,'
      '  TIPO = :TIPO'
      'where'
      '  COD_CLIE = :OLD_COD_CLIE')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 316
    Top = 76
    object IBDS_CLIENTESCOD_CLIE: TIntegerField
      FieldName = 'COD_CLIE'
      Origin = '"CLIENTES"."COD_CLIE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '####0000'
    end
    object IBDS_CLIENTESDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = '"CLIENTES"."DATA_CADASTRO"'
    end
    object IBDS_CLIENTESDATA_ATUALIZADO: TDateTimeField
      FieldName = 'DATA_ATUALIZADO'
      Origin = '"CLIENTES"."DATA_ATUALIZADO"'
    end
    object IBDS_CLIENTESCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Origin = '"CLIENTES"."CLIENTE"'
      Size = 51
    end
    object IBDS_CLIENTESAPELIDO: TIBStringField
      FieldName = 'APELIDO'
      Origin = '"CLIENTES"."APELIDO"'
      Size = 25
    end
    object IBDS_CLIENTESRG: TIBStringField
      FieldName = 'RG'
      Origin = '"CLIENTES"."RG"'
      Size = 25
    end
    object IBDS_CLIENTESCPF: TIBStringField
      FieldName = 'CPF'
      Origin = '"CLIENTES"."CPF"'
      Size = 18
    end
    object IBDS_CLIENTESDATA_NASCIMENTO: TDateTimeField
      FieldName = 'DATA_NASCIMENTO'
      Origin = '"CLIENTES"."DATA_NASCIMENTO"'
    end
    object IBDS_CLIENTESPAI: TIBStringField
      FieldName = 'PAI'
      Origin = '"CLIENTES"."PAI"'
      Size = 51
    end
    object IBDS_CLIENTESMAE: TIBStringField
      FieldName = 'MAE'
      Origin = '"CLIENTES"."MAE"'
      Size = 51
    end
    object IBDS_CLIENTESENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"CLIENTES"."ENDERECO"'
      Size = 50
    end
    object IBDS_CLIENTESTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = '"CLIENTES"."TELEFONE"'
    end
    object IBDS_CLIENTESCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = '"CLIENTES"."CIDADE"'
      Size = 25
    end
    object IBDS_CLIENTESBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"CLIENTES"."BAIRRO"'
      Size = 30
    end
    object IBDS_CLIENTESCEP: TIBStringField
      FieldName = 'CEP'
      Origin = '"CLIENTES"."CEP"'
      Size = 10
    end
    object IBDS_CLIENTESESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"CLIENTES"."ESTADO"'
      Size = 25
    end
    object IBDS_CLIENTESUF: TIBStringField
      FieldName = 'UF'
      Origin = '"CLIENTES"."UF"'
      Size = 2
    end
    object IBDS_CLIENTESPONTO_REFERENCIA: TIBStringField
      FieldName = 'PONTO_REFERENCIA'
      Origin = '"CLIENTES"."PONTO_REFERENCIA"'
      Size = 50
    end
    object IBDS_CLIENTESOBS: TMemoField
      FieldName = 'OBS'
      Origin = '"CLIENTES"."OBS"'
      BlobType = ftMemo
      Size = 8
    end
    object IBDS_CLIENTESFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = '"CLIENTES"."FOTO"'
      Size = 8
    end
    object IBDS_CLIENTESNOME_EMPRESARIAL: TIBStringField
      FieldName = 'NOME_EMPRESARIAL'
      Origin = '"CLIENTES"."NOME_EMPRESARIAL"'
      Size = 116
    end
    object IBDS_CLIENTESNOME_FANTASIA: TIBStringField
      FieldName = 'NOME_FANTASIA'
      Origin = '"CLIENTES"."NOME_FANTASIA"'
      Size = 56
    end
    object IBDS_CLIENTESCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Origin = '"CLIENTES"."CONTATO"'
      Size = 51
    end
    object IBDS_CLIENTESRAMO_ATIVIDADE: TIBStringField
      FieldName = 'RAMO_ATIVIDADE'
      Origin = '"CLIENTES"."RAMO_ATIVIDADE"'
      Size = 30
    end
    object IBDS_CLIENTESFAX: TIBStringField
      FieldName = 'FAX'
      Origin = '"CLIENTES"."FAX"'
    end
    object IBDS_CLIENTESEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"CLIENTES"."EMAIL"'
      Size = 51
    end
    object IBDS_CLIENTESNOME_USUARIO: TIBStringField
      FieldName = 'NOME_USUARIO'
      Origin = '"CLIENTES"."NOME_USUARIO"'
      Required = True
    end
    object IBDS_CLIENTESTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"CLIENTES"."TIPO"'
      Size = 2
    end
  end
  object Ds_CLIENTES: TDataSource
    DataSet = IBDS_CLIENTES
    Left = 312
    Top = 128
  end
  object IBQ_CODCLIE: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    ForcedRefresh = True
    BufferChunks = 10
    CachedUpdates = True
    SQL.Strings = (
      'select max (COD_CLIE) from CLIENTES')
    GeneratorField.Field = 'MAX'
    Left = 312
    Top = 184
  end
  object IBDS_VENDAS: TIBDataSet
    Database = IBDatabase
    Transaction = IBTransaction
    ForcedRefresh = True
    AfterInsert = IBDS_VENDASAfterInsert
    BufferChunks = 10
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from VENDAS'
      'where'
      '  COD_VEND = :OLD_COD_VEND')
    InsertSQL.Strings = (
      'insert into VENDAS'
      
        '  (COD_VEND, DATA_VENDA, CLIENTE, VENDEDOR, NOME_USUARIO, TIPO, ' +
        'FORMA, '
      '   SUB_TOTAL, DESCONTO, VALOR_TOTAL)'
      'values'
      
        '  (:COD_VEND, :DATA_VENDA, :CLIENTE, :VENDEDOR, :NOME_USUARIO, :' +
        'TIPO, :FORMA, '
      '   :SUB_TOTAL, :DESCONTO, :VALOR_TOTAL)')
    RefreshSQL.Strings = (
      'Select '
      '  COD_VEND,'
      '  DATA_VENDA,'
      '  CLIENTE,'
      '  VENDEDOR,'
      '  NOME_USUARIO,'
      '  TIPO,'
      '  FORMA,'
      '  SUB_TOTAL,'
      '  DESCONTO,'
      '  VALOR_TOTAL'
      'from VENDAS '
      'where'
      '  COD_VEND = :COD_VEND')
    SelectSQL.Strings = (
      'select * from VENDAS')
    ModifySQL.Strings = (
      'update VENDAS'
      'set'
      '  COD_VEND = :COD_VEND,'
      '  DATA_VENDA = :DATA_VENDA,'
      '  CLIENTE = :CLIENTE,'
      '  VENDEDOR = :VENDEDOR,'
      '  NOME_USUARIO = :NOME_USUARIO,'
      '  TIPO = :TIPO,'
      '  FORMA = :FORMA,'
      '  SUB_TOTAL = :SUB_TOTAL,'
      '  DESCONTO = :DESCONTO,'
      '  VALOR_TOTAL = :VALOR_TOTAL'
      'where'
      '  COD_VEND = :OLD_COD_VEND')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 404
    Top = 76
    object IBDS_VENDASCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"VENDAS"."COD_VEND"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '####0000'
    end
    object IBDS_VENDASDATA_VENDA: TDateTimeField
      FieldName = 'DATA_VENDA'
      Origin = '"VENDAS"."DATA_VENDA"'
    end
    object IBDS_VENDASCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Origin = '"VENDAS"."CLIENTE"'
      Size = 51
    end
    object IBDS_VENDASVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Origin = '"VENDAS"."VENDEDOR"'
      Size = 51
    end
    object IBDS_VENDASNOME_USUARIO: TIBStringField
      FieldName = 'NOME_USUARIO'
      Origin = '"VENDAS"."NOME_USUARIO"'
      Required = True
    end
    object IBDS_VENDASTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"VENDAS"."TIPO"'
    end
    object IBDS_VENDASFORMA: TIBStringField
      FieldName = 'FORMA'
      Origin = '"VENDAS"."FORMA"'
    end
    object IBDS_VENDASSUB_TOTAL: TIBBCDField
      FieldName = 'SUB_TOTAL'
      Origin = '"VENDAS"."SUB_TOTAL"'
      currency = True
      Precision = 18
      Size = 2
    end
    object IBDS_VENDASDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"VENDAS"."DESCONTO"'
      Precision = 18
      Size = 2
    end
    object IBDS_VENDASVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"VENDAS"."VALOR_TOTAL"'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object Ds_VENDAS: TDataSource
    DataSet = IBDS_VENDAS
    Left = 408
    Top = 128
  end
  object IBQ_CODVEND: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    ForcedRefresh = True
    BufferChunks = 10
    CachedUpdates = True
    SQL.Strings = (
      'select max (COD_VEND) from VENDAS')
    Left = 408
    Top = 192
  end
end

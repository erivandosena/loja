unit UnDm;

interface

uses
  SysUtils, IBServices, DB, IBCustomDataSet, IBQuery, IBDatabase, Classes, Dialogs;

type
  TDm = class(TDataModule)
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    Ds_USUARIOS: TDataSource;
    IBDS_USUARIOS: TIBDataSet;
    IBQ_SENHA: TIBQuery;
    DSSENHA: TDataSource;
    IBQ_SENHASENHA: TIBStringField;
    IBQ_SENHANOME_USUARIO: TIBStringField;
    IBConfigService: TIBConfigService;
    IBDS_CEPS: TIBDataSet;
    Ds_CEPS: TDataSource;
    IBDS_USUARIOSNOME_USUARIO: TIBStringField;
    IBDS_USUARIOSSENHA: TIBStringField;
    IBDS_USUARIOSANTERIOR: TIBStringField;
    IBDS_CEPSCODIGO: TIntegerField;
    IBDS_CEPSNOME_CID: TIBStringField;
    IBDS_CEPSCEP_CID: TIBStringField;
    IBDS_CEPSESTADO: TIBStringField;
    IBDS_CEPSUF: TIBStringField;
    IBDS_ESTOQUE: TIBDataSet;
    Ds_ESTOQUE: TDataSource;
    CODIGO_ESTOQUE: TIBQuery;
    IBDS_ESTOQUECOD_ESTO: TIntegerField;
    IBDS_ESTOQUECODIGO: TIBStringField;
    IBDS_ESTOQUECATEGORIA_PRODUTO: TIBStringField;
    IBDS_ESTOQUEDESCRICAO: TIBStringField;
    IBDS_ESTOQUEUNIDADE_ESTOQUE: TIBStringField;
    IBDS_ESTOQUEQUANTIDADE_ESTOQUE: TIntegerField;
    IBDS_ESTOQUEESTOQUE_MINIMO: TIntegerField;
    IBDS_ESTOQUEVALOR_CUSTO: TIBBCDField;
    IBDS_ESTOQUEVALOR_LUCRO: TIBBCDField;
    IBDS_ESTOQUEVALOR_VENDA: TIBBCDField;
    IBDS_ESTOQUEFORNECEDOR: TIBStringField;
    IBDS_ESTOQUELUCRO_PRODUTO: TFloatField;
    IBDS_ESTOQUEIMPOSTO_PRODUTO: TFloatField;
    IBDS_CLIENTES: TIBDataSet;
    Ds_CLIENTES: TDataSource;
    IBQ_CODCLIE: TIBQuery;
    IBDS_CLIENTESCOD_CLIE: TIntegerField;
    IBDS_CLIENTESDATA_CADASTRO: TDateTimeField;
    IBDS_CLIENTESDATA_ATUALIZADO: TDateTimeField;
    IBDS_CLIENTESCLIENTE: TIBStringField;
    IBDS_CLIENTESAPELIDO: TIBStringField;
    IBDS_CLIENTESRG: TIBStringField;
    IBDS_CLIENTESCPF: TIBStringField;
    IBDS_CLIENTESDATA_NASCIMENTO: TDateTimeField;
    IBDS_CLIENTESPAI: TIBStringField;
    IBDS_CLIENTESMAE: TIBStringField;
    IBDS_CLIENTESENDERECO: TIBStringField;
    IBDS_CLIENTESTELEFONE: TIBStringField;
    IBDS_CLIENTESCIDADE: TIBStringField;
    IBDS_CLIENTESBAIRRO: TIBStringField;
    IBDS_CLIENTESCEP: TIBStringField;
    IBDS_CLIENTESESTADO: TIBStringField;
    IBDS_CLIENTESUF: TIBStringField;
    IBDS_CLIENTESPONTO_REFERENCIA: TIBStringField;
    IBDS_CLIENTESOBS: TMemoField;
    IBDS_CLIENTESFOTO: TBlobField;
    IBDS_CLIENTESNOME_EMPRESARIAL: TIBStringField;
    IBDS_CLIENTESNOME_FANTASIA: TIBStringField;
    IBDS_CLIENTESCONTATO: TIBStringField;
    IBDS_CLIENTESRAMO_ATIVIDADE: TIBStringField;
    IBDS_CLIENTESFAX: TIBStringField;
    IBDS_CLIENTESEMAIL: TIBStringField;
    IBDS_CLIENTESNOME_USUARIO: TIBStringField;
    IBDS_CLIENTESTIPO: TIBStringField;
    IBDS_VENDAS: TIBDataSet;
    Ds_VENDAS: TDataSource;
    IBQ_CODVEND: TIBQuery;
    IBDS_VENDASCOD_VEND: TIntegerField;
    IBDS_VENDASDATA_VENDA: TDateTimeField;
    IBDS_VENDASCLIENTE: TIBStringField;
    IBDS_VENDASVENDEDOR: TIBStringField;
    IBDS_VENDASNOME_USUARIO: TIBStringField;
    IBDS_VENDASTIPO: TIBStringField;
    IBDS_VENDASFORMA: TIBStringField;
    IBDS_VENDASSUB_TOTAL: TIBBCDField;
    IBDS_VENDASDESCONTO: TIBBCDField;
    IBDS_VENDASVALOR_TOTAL: TIBBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure IBDS_ESTOQUEAfterInsert(DataSet: TDataSet);
    procedure IBDS_CLIENTESAfterInsert(DataSet: TDataSet);
    procedure IBDS_VENDASAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;
  nNum: Integer;

implementation

{$R *.dfm}

procedure TDm.DataModuleCreate(Sender: TObject);
begin
IBConfigService.DatabaseName:='C:\Inforamos\store.gdb';
IBConfigService.Params.add('user_name=SYSDBA');
IBConfigService.Params.add('password=masterkey');
Try
   begin
     IBconfigService.Active:=true;
     IBConfigService.SetAsyncMode(False);
     //ATIVADA OPERAÇÃO EM MODO SINCRONO - "Forced Write - Gravação Forçada"
     IBconfigService.Active:=false;
   end;
 except
    Begin
     ShowMessage('Não foi possível ativar modo de operação Síncrono');
    end;
 end;// try
IBQ_SENHA.Open;
IBDS_USUARIOS.Open;
IBDS_ESTOQUE.Open;
IBDS_CLIENTES.Open;
//IBDS_DEPENDE.Open;
//IBDS_INATIVOS.Open;
IBDS_CEPS.Open;
//IBDS_PROMOTOR.Open;
end;

procedure TDm.DataModuleDestroy(Sender: TObject);
begin
IBQ_SENHA.Close;
IBDS_USUARIOS.Close;
IBDS_ESTOQUE.Close;
IBDS_CLIENTES.Close;
//IBDS_DEPENDE.Close;
//IBDS_INATIVOS.Close;
IBDS_CEPS.Close;
//IBDS_PROMOTOR.Close;
end;

procedure TDm.IBDS_ESTOQUEAfterInsert(DataSet: TDataSet);
begin
  CODIGO_ESTOQUE.Open;
  CODIGO_ESTOQUE.First;
  If CODIGO_ESTOQUE.EOF Then
    nNum := 0
  Else
    nNum := CODIGO_ESTOQUE.Fields[0].AsInteger;
  CODIGO_ESTOQUE.Close;
  Inc( nNum );
 IBDS_ESTOQUECOD_ESTO.AsString:= IntToStr(nNum);
end;

procedure TDm.IBDS_CLIENTESAfterInsert(DataSet: TDataSet);
Var
  nNum: Integer;
begin
  IBQ_CODCLIE.Open;
  IBQ_CODCLIE.First;
  If IBQ_CODCLIE.EOF Then
    nNum := 0
  Else
    nNum := IBQ_CODCLIE.Fields[0].AsInteger;
  IBQ_CODCLIE.Close;
  Inc( nNum );
  IBDS_CLIENTESCOD_CLIE.AsInteger := nNum;
end;

procedure TDm.IBDS_VENDASAfterInsert(DataSet: TDataSet);
Var
  nNum: Integer;
begin
  IBQ_CODVEND.Open;
  IBQ_CODVEND.First;
  If IBQ_CODVEND.EOF Then
    nNum := 0
  Else
    nNum := IBQ_CODVEND.Fields[0].AsInteger;
  IBQ_CODVEND.Close;
  Inc( nNum );
  IBDS_VENDASCOD_VEND.AsInteger := nNum;
end;

end.


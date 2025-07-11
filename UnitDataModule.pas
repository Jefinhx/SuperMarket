unit UnitDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDConnection1: TFDConnection;
    FDTableFuncionario: TFDTable;
    DSFuncionario: TDataSource;
    FDTableFuncionarioidUsuario: TFDAutoIncField;
    FDTableFuncionarionome: TStringField;
    FDTableFuncionariotelefone: TStringField;
    FDTableFuncionarioemail: TStringField;
    FDTableFuncionarionascimento: TDateField;
    FDTableFuncionariosexo: TStringField;
    FDTableFuncionariosenha: TStringField;
    FDQueryLogin: TFDQuery;
    FDQueryName: TFDQuery;
    FDTableCliente: TFDTable;
    DSCliente: TDataSource;
    FDQueryCPF: TFDQuery;
    FDTableFornecedor: TFDTable;
    DSFornecedor: TDataSource;
    FDTableProduto: TFDTable;
    DSProduto: TDataSource;
    FDTableFuncionariocpfl: TStringField;
    FDTableTransportadora: TFDTable;
    DSTransportadora: TDataSource;
    FDTableCaixa: TFDTable;
    DSCaixa: TDataSource;
    FDTableItensVenda: TFDTable;
    DSItensVendas: TDataSource;
    FDQueryFatura: TFDQuery;
    DSFatura: TDataSource;
    FDQueryProdutoVend: TFDQuery;
    DSProdutoVend: TDataSource;
    FDQueryProdutoVend2: TFDQuery;
    DSProdutoVend2: TDataSource;
    FDQueryValorTotal: TFDQuery;
    DSTotalVendas: TDataSource;
    FDQueryClienteMasc: TFDQuery;
    DSClienteMasc: TDataSource;
    FDQueryClienteFemin: TFDQuery;
    DSClienteFemin: TDataSource;
    FDQueryBestClients: TFDQuery;
    DSBests: TDataSource;
    FDQuerySalario: TFDQuery;
    DSSalario: TDataSource;
    FDTableCompraFornece: TFDTable;
    DSCompFornece: TDataSource;
    FDQueryFornecimento: TFDQuery;
    DSFornecimento: TDataSource;
    FDTableLancamentos: TFDTable;
    DSLancamentos: TDataSource;
    FDQueryLancamentos: TFDQuery;
    DSLancFun: TDataSource;
    FDQueryMaxID: TFDQuery;
    FDTableItensVendaidItensVenda: TFDAutoIncField;
    FDTableItensVendaQuantidade: TIntegerField;
    FDTableItensVendaProduto: TStringField;
    FDTableItensVendaData: TDateField;
    FDTableItensVendaValor: TIntegerField;
    FDTableItensVendaidProdutoo: TIntegerField;
    FDTableItensVendaidFuncionariooo: TIntegerField;
    FDTableItensVendaidClientee: TIntegerField;
    FDTableItensVendaidCaixaaa: TIntegerField;
    FDTableItensVendaidVendaAtual: TIntegerField;
    FDTableItensVendaformapagamento: TStringField;
    FDTableFuncionariosalario: TBCDField;
    FDTableFuncionariostatusPagamento: TStringField;
    FDTableFuncionariodataPagamento: TDateTimeField;
    FDTableClienteidCliente: TFDAutoIncField;
    FDTableClientenome: TStringField;
    FDTableClientenascimento: TDateField;
    FDTableClientecpf: TStringField;
    FDTableClienteemail: TStringField;
    FDTableClientetelefone: TStringField;
    FDTableClientesexo: TStringField;
    FDTableClienteestado: TStringField;
    FDTableClientecomplemento: TStringField;
    FDTableClientecidade: TStringField;
    FDTableClientebairro: TStringField;
    FDTableClienterua: TStringField;
    FDTableClientenumero: TStringField;
    FDTableClientecep: TStringField;
    FDTableFornecedoridFornecedor: TFDAutoIncField;
    FDTableFornecedornome: TStringField;
    FDTableFornecedorcnpj: TStringField;
    FDTableFornecedortelefone: TStringField;
    FDTableFornecedoremail: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}


end.

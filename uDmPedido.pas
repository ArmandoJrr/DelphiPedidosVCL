unit uDmPedido;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.Provider, Datasnap.DBClient,
  uclass.Produtos;

type
  TDmPedido = class(TDataModule)
    Conn: TFDConnection;
    DSPProdutosVenda: TDataSetProvider;
    DsProdutosVenda: TDataSource;
    Cdsprodutosvenda: TClientDataSet;
    QryPedido: TFDQuery;
    QryPedidoNro_pedido: TFDAutoIncField;
    QryPedidoDt_emiss: TDateField;
    QryPedidoCod_cliente: TIntegerField;
    QryPedidoValorTot: TFloatField;
    DsPedido: TDataSource;
    QryCliente: TFDQuery;
    QryClientenome: TStringField;
    QryInserirProd: TFDQuery;
    QryInserirProdSequencia: TFDAutoIncField;
    QryInserirProdnro_pedido: TIntegerField;
    QryInserirProdcod_produto: TIntegerField;
    QryInserirProdqtd: TIntegerField;
    QryInserirProdvl_unit: TFloatField;
    QryInserirProdvl_total: TFloatField;
    CdsprodutosvendaSequencia: TAutoIncField;
    Cdsprodutosvendanro_pedido: TIntegerField;
    Cdsprodutosvendacod_produto: TIntegerField;
    Cdsprodutosvendaqtd: TIntegerField;
    Cdsprodutosvendavl_unit: TFloatField;
    Cdsprodutosvendavl_total: TFloatField;
    CdsprodutosvendaNomeProd: TStringField;
    QryDetalhePedido: TFDQuery;
    QryDetalhePedidoNome: TStringField;
    QryDetalhePedidoNro_pedido: TFDAutoIncField;
    QryDetalhePedidoDt_emiss: TDateField;
    QryDetalhePedidoCod_cliente: TIntegerField;
    QryDetalhePedidoValorTot: TFloatField;
    CdsprodutosvendaTotalProd: TAggregateField;
    QrySalvarProdutos: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    procedure CdsprodutosvendaCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    Produto : TProduto;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmPedido: TDmPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmPedido.CdsprodutosvendaCalcFields(DataSet: TDataSet);
begin
  Produto := TProduto.Create;

  CdsprodutosvendaNomeProd.AsString := Produto.CarregarNomeProduto(Cdsprodutosvendacod_produto.AsInteger);
end;

procedure TDmPedido.DataModuleCreate(Sender: TObject);
begin
   DmPedido.Cdsprodutosvenda.Close;
   DmPedido.Cdsprodutosvenda.Open;
end;

end.

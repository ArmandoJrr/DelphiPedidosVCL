program PedidoVenda;

uses
  Vcl.Forms,
  uPedido in 'uPedido.pas' {FrmPedido},
  uDmPedido in 'uDmPedido.pas' {DmPedido: TDataModule},
  uFormat in 'Units\uFormat.pas',
  uclass.Clientes in 'Classes\uclass.Clientes.pas',
  uclass.pedido in 'Classes\uclass.pedido.pas',
  uclass.Produtos in 'Classes\uclass.Produtos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmPedido, DmPedido);
  Application.CreateForm(TFrmPedido, FrmPedido);
  Application.Run;
end.

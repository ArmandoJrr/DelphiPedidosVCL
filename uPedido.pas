unit uPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  uclass.Clientes, uclass.Produtos, uDmPedido, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Datasnap.Provider, Datasnap.DBClient, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmPedido = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblNome: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    EditNomeCli: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid: TDBGrid;
    BtnSalvar: TButton;
    BtnInserirProd: TButton;
    BtnConsultarPedido: TButton;
    DBEditCodPedido: TDBEdit;
    DBEditDtEmiss: TDBEdit;
    BtnNovoPedido: TButton;
    EditCodCliente: TEdit;
    EditCodProduto: TEdit;
    EditQtd: TEdit;
    EditVlUnit: TEdit;
    LblTotPedido: TLabel;
    BtnExcluirPedido: TButton;
    EditTotPedido: TEdit;
    procedure BtnInserirProdClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnNovoPedidoClick(Sender: TObject);
    procedure BtnConsultarPedidoClick(Sender: TObject);
    procedure DBEditCodClienteExit(Sender: TObject);
    procedure EditCodClienteExit(Sender: TObject);
    procedure EditQtdExit(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditVlUnitExit(Sender: TObject);
    procedure BtnExcluirPedidoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Produto : TProduto;
    Cliente : TCliente;
    function FormataValor(str: string): string;
    procedure LimparTela;
    { Private declarations }
  public
    function SoNumeros(const S: string): string;
    { Public declarations }
  end;

var
  FrmPedido: TFrmPedido;

implementation

uses
uclass.pedido;

var
Pedido  : TPedido;

{$R *.dfm}


function TFrmPedido.FormataValor(str : string) : string;
begin
    if Str = '' then Str := '0';

    try
        Result := FormatFloat('#,##0.00', strtofloat(str) / 100);
    except
        Result := FormatFloat('#,##0.00', 0);
    end;
end;

procedure TFrmPedido.BtnConsultarPedidoClick(Sender: TObject);
var
Resposta : String;
Result   : String;
begin
  Resposta := InputBox('Consultar Pedido','Qual o c�dido do pedido ?','');

  Result := Pedido.CarregarPedido(StrtoInt(resposta));

  Produto.CarregarProdutos(StrtoInt(resposta));

  Pedido.Edicao := True;

  if Result = 'Erro' then ShowMessage('Pedido n�o encontrado!');
end;

procedure TFrmPedido.BtnExcluirPedidoClick(Sender: TObject);
var
Resposta : String;
Result   : String;
begin
  Resposta := InputBox('Excluir pedido','Qual o c�dido do pedido ?','');

  Result := Pedido.ExcluirPedido(StrtoInt(resposta));

  Pedido.ExcluirProdutos(StrtoInt(resposta));

  if Result <> 'OK' then
    ShowMessage('O Pedido n�o foi excluido rollback executado!')
  else
    ShowMessage('Pedido '+resposta+' exclu�do com sucesso!');
end;

procedure TFrmPedido.BtnInserirProdClick(Sender: TObject);
begin
    Produto.CodProd   := StrtoInt(EditCodProduto.Text);
    Produto.ValorUnit := StrtoFLoat(EditVlUnit.Text);
    Produto.Qtd       := StrtoInt(EditQtd.Text);

    Produto.InserirProdGrid;

    EditTotPedido.Text    := DmPedido.CdsprodutosvendaTotalProd.Value;
end;

procedure TFrmPedido.DBEditCodClienteExit(Sender: TObject);
begin
  EditNomeCli.Text := Cliente.CarregarNome(StrtoInt(EditCodProduto.Text));
end;

procedure TFrmPedido.DBGridCellClick(Column: TColumn);
begin
  DmPedido.Cdsprodutosvenda.Edit;
  DmPedido.Cdsprodutosvendavl_total.AsFloat := DmPedido.Cdsprodutosvendaqtd.Asinteger * DmPedido.Cdsprodutosvendavl_unit.AsFloat;
  EditTotPedido.Text                        := DmPedido.CdsprodutosvendaTotalProd.Value;
  DmPedido.Cdsprodutosvenda.Post;


end;

procedure TFrmPedido.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE
  then begin
       if MessageDlg('Deseja excluir o produto ?',mtConfirmation,[mbYes,mbNo],0) = mrYes
       then begin
            DmPedido.Cdsprodutosvenda.Delete;
       end;
  end;
end;

procedure TFrmPedido.EditQtdExit(Sender: TObject);
begin
  if EditQtd.Text = '' then EditQtd.Text := '1';
end;

procedure TFrmPedido.EditVlUnitExit(Sender: TObject);
begin
 if EditVlUnit.Text = '' then EditVlUnit.Text := '0';

 if SoNumeros(EditVlUnit.Text) = '' then
 begin
  ShowMessage('Cont�m letra(s) no valor!');
  Abort;
 end;
end;

function TFrmPedido.SoNumeros(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9']) then
    {$ELSE}
    if vText^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + vText^;

    Inc(vText);
  end;
end;

procedure TFrmPedido.EditCodClienteExit(Sender: TObject);
begin
  if not (EditCodCliente.Text = '') then
  begin
    if SoNumeros(EditCodCliente.Text) <> '' then
    begin
      EditCodProduto.ReadOnly := False;
      EditQtd.ReadOnly := False;
      EditVlUnit.ReadOnly := False;
      BtnInserirProd.Visible := True;
      EditNomeCli.Text := Cliente.CarregarNome(StrtoInt(SoNumeros(EditCodCliente.Text)));
    end
    else
      ShowMessage('Exite(m) letra(s) no c�digo do produto!');
  end;
end;

procedure TFrmPedido.BtnNovoPedidoClick(Sender: TObject);
begin
  Pedido.NovoPedido;

  Pedido.Edicao              := False;
  BtnNovoPedido.Visible      := False;
  DBEditCodPedido.ReadOnly   := True;
  BtnConsultarPedido.Visible := False;
  BtnExcluirPedido.Visible   := False;
  EditCodCliente.ReadOnly    := False;
end;

procedure TFrmPedido.BtnSalvarClick(Sender: TObject);
var
ResultPedido : String;
ResultProd   : String;
i            : Integer;
begin
  if not Pedido.Edicao then
  begin
    Pedido.GravarPedidoCompleto;
    ResultPedido := Pedido.GravarPedidoCompleto;

    if not (ResultPedido = 'OK') then
    begin
      ShowMessage('Erro ao gravar dados do pedido!');
      Abort;
    end
    else
    begin
      try
        DmPedido.Cdsprodutosvenda.First;

        for i := 0 to DmPedido.Cdsprodutosvenda.RecordCount - 1 do
        begin
          Produto.InserirEditar('Inserir');

          DmPedido.Cdsprodutosvenda.Next;
        end;

        ShowMessage('Pedido gravado com sucesso!');

        BtnConsultarPedido.Visible := True;
        BtnNovoPedido.Visible      := True;
        BtnExcluirPedido.Visible   := True;

        LimparTela;
      Except
        ShowMessage('Erro ao gravar produtos do pedido!');
      end;
    end;
  end
  else
  begin
    try
      Pedido.EditarPedidoCompleto;

      DmPedido.Cdsprodutosvenda.First;

      for i := 0 to DmPedido.Cdsprodutosvenda.RecordCount - 1 do
      begin
        Produto.InserirEditar('Editar');

        DmPedido.Cdsprodutosvenda.Next;
      end;

      BtnConsultarPedido.Visible := True;
      BtnNovoPedido.Visible      := True;
      BtnExcluirPedido.Visible   := True;

      LimparTela;

      ShowMessage('Pedido gravado com sucesso!');
    Except
      ShowMessage('Erro ao editar produtos do pedido!');
    end;
  end;
end;

procedure TFrmPedido.FormCreate(Sender: TObject);
begin
  Produto := TProduto.Create;
  Cliente := TCliente.Create;
  Pedido  := TPedido.Create;
end;

procedure TFrmPedido.FormShow(Sender: TObject);
begin
   BtnConsultarPedido.Visible   := True;
   BtnExcluirPedido.Visible     := True;
end;

procedure TFrmPedido.LimparTela;
var
i : Integer;
begin
  DBEditCodPedido.Text := '';
  DBEditDtEmiss.Text   := '';
  EditCodCliente.Text  := '';
  EditNomeCli.Text  := '';
  EditCodProduto.Text  := '';
  EditQtd.Text  := '';
  EditVlUnit.Text  := '';
  EditTotPedido.Text := '';

  for i := 0 to DmPedido.Cdsprodutosvenda.RecordCount - 1 do
  begin
     DmPedido.Cdsprodutosvenda.Delete;
  end;
end;

end.

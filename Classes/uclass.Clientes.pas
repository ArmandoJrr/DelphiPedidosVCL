unit uclass.Clientes;

interface

uses
FireDAC.Comp.Client;

type
 TCliente = Class
 FConexao : TFDConnection;
 Fcodigo   : integer;
 Fnome     : String;
 Fcidade   : String;
 FUF       : String;

 private
 //
 public
   property Conexao : TFdConnection read FConexao write FConexao;
   property Codigo  : Integer read Fcodigo write Fcodigo;
   property Nome    : String read Fnome write Fnome;
   property Cidade : String read Fcidade write Fcidade;
   property UF : String read FUF write FUF;

   function CarregarNome(cod : integer) : String;
 End;

implementation

uses
uDmPedido;

{ TCliente }

function TCliente.CarregarNome(cod: integer): String;
begin
 with DmPedido.QryCliente do
 begin
   Close;
   ParamByName('codigo').AsInteger := cod;
   Open;
 end;

 result := DmPedido.QryClienteNome.AsString;
end;

end.

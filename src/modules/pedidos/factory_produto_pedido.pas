unit factory_produto_pedido;

interface

uses
  entity_pedido_produto;

type
  TPedidoProdutoFactory = class
  public
    class function CriarPedidoProduto(Id: Integer; PedidoId: Integer; ProdutoId: Integer; Quantidade: Integer): TPedidoProduto;
  end;

implementation

class function TPedidoProdutoFactory.CriarPedidoProduto(Id: Integer; PedidoId: Integer; ProdutoId: Integer; Quantidade: Integer): TPedidoProduto;
begin
  Result := TPedidoProduto.Create;
  Result.Id := Id;
  Result.PedidoId := PedidoId;
  Result.ProdutoId := ProdutoId;
  Result.Quantidade := Quantidade;
end;

end.

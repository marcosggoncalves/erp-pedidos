unit entity_pedido_produto;

interface

type
  TPedidoProduto = class
  private
    FId: Integer;
    FPedidoId: Integer;
    FProdutoId: Integer;
    FQuantidade: Integer;
  public
    property Id: Integer read FId write FId;
    property PedidoId: Integer read FPedidoId write FPedidoId;
    property ProdutoId: Integer read FProdutoId write FProdutoId;
    property Quantidade: Integer read FQuantidade write FQuantidade;
  end;

implementation

end.

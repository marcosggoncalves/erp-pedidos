unit interface_pedido;

interface

uses
  entity_pedido, entity_pedido_relatorio,  entity_pedido_produto, System.Generics.Collections;

type
  IPedidoRepository = interface
    function AbrirPedido(Pedido: TPedido): Integer;
    function InserirProdutoNoPedido(PedidoProduto: TPedidoProduto): Boolean;
    function ListarRelatorio(DataInicial : TDate = 0; DataFinal : TDate = 0): TList<TPedidoRelatorio>;
  end;

implementation

end.

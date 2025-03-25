unit interface_pedido;

interface

uses
  entity_pedido, entity_pedido_produto, System.Generics.Collections;

type
  IPedidoRepository = interface
    function Adicionar(Pedido: TPedido): Integer;
    function Remover(Id: Integer): Boolean;
    function InserirProdutoNoPedido(PedidoProduto: TPedidoProduto): Boolean;
    function ListarTodos(tipo: String = ''; search: String = ''): TList<TPedido>;
  end;

implementation
end.

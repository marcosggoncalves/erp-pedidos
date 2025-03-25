unit interface_produto;

interface

uses
  entity_produto, System.Generics.Collections;

type
  IProdutoRepository = interface
    function Adicionar(AProduto: TProduto): Boolean;
    function Atualizar(AProduto: TProduto): Boolean;
    function AlterarEstoque(AId: Integer; AQuantidadeDescontar: Integer; Descontar: Boolean = False): Boolean;
    function Remover(AId:Integer): Boolean;
    function ListarTodos(Search: string = ''): TList<TProduto>;
  end;

implementation

end.

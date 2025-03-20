unit interface_cliente;

interface

uses
  entity_cliente, System.Generics.Collections;

type
  IClienteRepository = interface
    function Adicionar(ACliente: TCliente): Boolean;
    function Atualizar(ACliente: TCliente): Boolean;
    function Remover(AId: Integer): Boolean;
    function ListarTodos(tipo: String  = ''; search: String = ''): TList<TCliente>;
  end;

implementation
end.

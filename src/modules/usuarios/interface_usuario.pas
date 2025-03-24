unit interface_usuario;

interface

uses
  entity_usuario, System.Generics.Collections;

type
  IUsuarioRepository = interface
    function Adicionar(Usuario: TUsuario): Boolean;
    function Atualizar(Usuario: TUsuario): Boolean;
    function Remover(Id: Integer): Boolean;
    function ListarTodos(tipo: String  = ''; search: String = ''): TList<TUsuario>;
  end;

implementation
end.

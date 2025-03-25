unit factory_pedido;

interface

uses
  entity_pedido;

type
  TPedidoFactory = class
  public
    class function CriarPedido(Id: Integer; ClienteId: Integer; UsuarioId: Integer; DataPedido: TDate; Total: Currency): TPedido;
  end;

implementation

class function TPedidoFactory.CriarPedido(Id: Integer; ClienteId: Integer; UsuarioId: Integer; DataPedido: TDate; Total: Currency): TPedido;
begin
  Result := TPedido.Create;
  Result.Id := Id;
  Result.ClienteId := ClienteId;
  Result.UsuarioId := UsuarioId;
  Result.DataPedido := DataPedido;
  Result.Total := Total;
end;

end.

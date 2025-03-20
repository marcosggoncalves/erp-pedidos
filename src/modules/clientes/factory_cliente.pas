unit factory_cliente;

interface

uses
  entity_cliente;

type
  TClienteFactory = class
  public
    class function CriarCliente(AId: Integer; ANome, ACpfCnpj: string): TCliente;
  end;

implementation

class function TClienteFactory.CriarCliente(AId: Integer; ANome, ACpfCnpj: string): TCliente;
begin
  Result := TCliente.Create;
  Result.Id := AId;
  Result.Nome := ANome;
  Result.CpfCnpj := ACpfCnpj;
end;

end.

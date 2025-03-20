unit factory_cliente;

interface

uses
  entity_cliente;

type
  TClienteFactory = class
  public
    class function CriarCliente(ANome, ACpfCnpj: string): TCliente;
  end;

implementation

class function TClienteFactory.CriarCliente(ANome, ACpfCnpj: string): TCliente;
begin
  Result := TCliente.Create;
  Result.Nome := ANome;
  Result.CpfCnpj := ACpfCnpj;
end;

end.

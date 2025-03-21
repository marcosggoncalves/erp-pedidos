unit entity_cliente;

interface

type
  TCliente = class
  private
    FId: Integer;
    FNome: string;
    FCpfCnpj: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property CpfCnpj: string read FCpfCnpj write FCpfCnpj;
  end;

implementation

end.

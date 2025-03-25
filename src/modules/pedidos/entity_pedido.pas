unit entity_pedido;

interface

type
  TPedido = class
  private
    FId: Integer;
    FClienteId: Integer;
    FUsuarioId: Integer;
    FDataPedido: TDate;
    FTotal: Currency;
  public
    property Id: Integer read FId write FId;
    property ClienteId: Integer read FClienteId write FClienteId;
    property UsuarioId: Integer read FUsuarioId write FUsuarioId;
    property DataPedido: TDate read FDataPedido write FDataPedido;
    property Total: Currency read FTotal write FTotal;
  end;

implementation

end.

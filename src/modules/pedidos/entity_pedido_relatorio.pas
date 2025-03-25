unit entity_pedido_relatorio;

interface

type
  TPedidoRelatorio = class
  private
    FID: Integer;
    FDataPedido: TDateTime;
    FTotal: Currency;
    FCliente: string;
    FVeendedor: string;
  public
    property ID: Integer read FID write FID;
    property DataPedido: TDateTime read FDataPedido write FDataPedido;
    property Total: Currency read FTotal write FTotal;
    property Cliente: string read FCliente write FCliente;
    property Vendedor: string read FVeendedor write FVeendedor;
  end;

implementation

end.


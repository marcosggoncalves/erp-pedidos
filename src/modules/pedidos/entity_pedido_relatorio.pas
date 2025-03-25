unit entity_pedido_relatorio;

interface

type
  TPedidoRelatorio = class
  private
    FNome: string;
    FValorGasto: Currency;
    FQuantidadePedidos: Integer;
  public
    property Nome: string read FNome write FNome;
    property ValorGasto: Currency read FValorGasto write FValorGasto;
    property QuantidadePedidos: Integer read FQuantidadePedidos write FQuantidadePedidos;
  end;

implementation

end.


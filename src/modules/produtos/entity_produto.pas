unit entity_produto;

interface

type
  TProduto = class
  private
    FId: Integer;
    FNome: string;
    FPrecoUnit: Currency;
    FQuantidadeEstoque: Integer;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property PrecoUnit: Currency read FPrecoUnit write FPrecoUnit;
    property QuantidadeEstoque: Integer read FQuantidadeEstoque write FQuantidadeEstoque;
  end;

implementation

end.

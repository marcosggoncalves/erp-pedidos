unit factory_produto;

interface

uses
  entity_produto;

type
  TProdutoFactory = class
  public
    class function CriarProduto(AId: Integer; ANome: string; APrecoUnit: Currency; AQuantidadeEstoque: Integer): TProduto;
  end;

implementation

class function TProdutoFactory.CriarProduto(AId: Integer; ANome: string; APrecoUnit: Currency; AQuantidadeEstoque: Integer): TProduto;
begin
  Result := TProduto.Create;
  Result.Id := AId;
  Result.Nome := ANome;
  Result.PrecoUnit := APrecoUnit;
  Result.QuantidadeEstoque := AQuantidadeEstoque;
end;

end.

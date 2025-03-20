unit repository_produto;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.Stan.Def,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.Option, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, entity_produto, interface_produto, conexao;

type
  TProdutoRepository = class(TInterfacedObject, IProdutoRepository)
  private
    function CriarQuery: TFDQuery;
  public
    constructor Create;
    function Adicionar(AProduto: TProduto): Boolean;
    function Atualizar(AProduto: TProduto): Boolean;
    function Remover(AId: Integer): Boolean;
    function ListarTodos(tipo: String = ''; search: String = ''): TList<TProduto>;
  end;

implementation

constructor TProdutoRepository.Create;
begin
  inherited Create;
end;

function TProdutoRepository.CriarQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := conexao.dm.FDConexao;
end;

function TProdutoRepository.Adicionar(AProduto: TProduto): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := CriarQuery;
  try
    Qry.SQL.Text := 'INSERT INTO produto (nome, preco_unit, quantidade_estoque) ' + 
                    'VALUES (:nome, :preco_unit, :quantidade_estoque)';
    Qry.ParamByName('nome').AsString := AProduto.Nome;
    Qry.ParamByName('preco_unit').AsCurrency := AProduto.PrecoUnit;
    Qry.ParamByName('quantidade_estoque').AsInteger := AProduto.QuantidadeEstoque;

    try
      Qry.ExecSQL;
      Result := Qry.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao adicionar produto: ' + E.Message);
    end;
  finally
    Qry.Free;
  end;
end;

function TProdutoRepository.Atualizar(AProduto: TProduto): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := CriarQuery;
  try
    Qry.SQL.Text := 'UPDATE produto SET nome = :nome, preco_unit = :preco_unit, ' +
                    'quantidade_estoque = :quantidade_estoque WHERE id = :id';
    Qry.ParamByName('nome').AsString := AProduto.Nome;
    Qry.ParamByName('preco_unit').AsCurrency := AProduto.PrecoUnit;
    Qry.ParamByName('quantidade_estoque').AsInteger := AProduto.QuantidadeEstoque;
    Qry.ParamByName('id').AsInteger := AProduto.Id;

    try
      Qry.ExecSQL;
      Result := Qry.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao atualizar produto: ' + E.Message);
    end;
  finally
    Qry.Free;
  end;
end;

function TProdutoRepository.Remover(AId: Integer): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := CriarQuery;
  try
    Qry.SQL.Text := 'DELETE FROM produto WHERE id = :id';
    Qry.ParamByName('id').AsInteger := AId;

    try
      Qry.ExecSQL;
      Result := Qry.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao remover produto: ' + E.Message);
    end;
  finally
    Qry.Free;
  end;
end;

function TProdutoRepository.ListarTodos(tipo: String = ''; search: String = ''): TList<TProduto>;
var
  Qry: TFDQuery;
  Produto: TProduto;
  SQLQuery: String;
begin
  Result := TList<TProduto>.Create;
  Qry := CriarQuery;

  try
    SQLQuery := 'SELECT * FROM produto';

    if (tipo = 'NOME') then
    begin
      SQLQuery := SQLQuery + ' WHERE ' + tipo + ' LIKE :Tipo';
    end;

    SQLQuery := SQLQuery + ' ORDER BY nome';

    Qry.SQL.Text := SQLQuery;

    if (tipo = 'NOME')   then
    begin
      Qry.ParamByName('Tipo').AsString := '%' + search + '%';
    end;

    Qry.Open;

    while not Qry.Eof do
    begin
      Produto := TProduto.Create;
      Produto.Id := Qry.FieldByName('id').AsInteger;
      Produto.Nome := Qry.FieldByName('nome').AsString;
      Produto.PrecoUnit := Qry.FieldByName('preco_unit').AsCurrency;
      Produto.QuantidadeEstoque := Qry.FieldByName('quantidade_estoque').AsInteger;
      Result.Add(Produto);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

end.

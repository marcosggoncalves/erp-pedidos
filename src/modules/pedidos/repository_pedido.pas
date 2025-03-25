unit repository_pedido;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, Vcl.Dialogs, FireDAC.Stan.Def,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.Option, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, entity_pedido, entity_pedido_produto, entity_pedido_relatorio, interface_pedido, conexao;

type
  TPedidoRepository = class(TInterfacedObject, IPedidoRepository)
  private
    function CriarQuery: TFDQuery;
  public
    constructor Create;
    function AbrirPedido(Pedido: TPedido): Integer;
    function InserirProdutoNoPedido(PedidoProduto: TPedidoProduto): Boolean;
    function ListarRelatorio(DataInicial : TDate = 0; DataFinal : TDate = 0) : TList<TPedidoRelatorio>;
  end;

implementation

constructor TPedidoRepository.Create;
begin
  inherited Create;
end;

function TPedidoRepository.CriarQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := conexao.dm.FDConexao;
end;

function TPedidoRepository.AbrirPedido(Pedido: TPedido): Integer;
var
  TQuerySQL: TFDQuery;
begin
  Result := 0;
  TQuerySQL := CriarQuery;
  try
    TQuerySQL.SQL.Text := 'INSERT INTO PEDIDO (cliente_id, usuario_id, data_pedido, total ) VALUES (:cliente_id, :usuario_id, :data_pedido, :total)  RETURNING  id';
    TQuerySQL.ParamByName('cliente_id').AsInteger := Pedido.ClienteId;
    TQuerySQL.ParamByName('usuario_id').AsInteger := Pedido.UsuarioId;
    TQuerySQL.ParamByName('data_pedido').AsDateTime := Pedido.DataPedido;
    TQuerySQL.ParamByName('total').AsCurrency := Pedido.Total;

    try
      TQuerySQL.Open;
      Result := TQuerySQL.FieldByName('id').AsInteger;
    except
      on E: Exception do
        raise Exception.Create('Erro ao adicionar Pedido: ' + E.Message);
    end;
  finally
    TQuerySQL.Free;
  end;
end;

function TPedidoRepository.InserirProdutoNoPedido(PedidoProduto: TPedidoProduto): Boolean;
var
  TQuerySQL: TFDQuery;
begin
  Result := False;
  TQuerySQL := CriarQuery;
  try
    TQuerySQL.SQL.Text := 'INSERT INTO PEDIDO_PRODUTO (pedido_id, produto_id, quantidade) VALUES (:pedido_id, :produto_id, :quantidade)';
    TQuerySQL.ParamByName('pedido_id').AsInteger := PedidoProduto.PedidoId;
    TQuerySQL.ParamByName('produto_id').AsInteger := PedidoProduto.ProdutoId;
    TQuerySQL.ParamByName('quantidade').AsInteger := PedidoProduto.Quantidade;

    try
      TQuerySQL.ExecSQL;
      Result := TQuerySQL.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao inserir Produto no Pedido: ' + E.Message);
    end;
  finally
    TQuerySQL.Free;
  end;
end;

function TPedidoRepository.ListarRelatorio(DataInicial : TDate = 0; DataFinal : TDate =0): TList<TPedidoRelatorio>;
var
  TQuerySQL: TFDQuery;
  Pedido: TPedidoRelatorio;
  SQLQuery: String;
begin
  Result := TList<TPedidoRelatorio>.Create;
  TQuerySQL := CriarQuery;

  try
     SQLQuery := 'SELECT C.NOME, SUM(P.TOTAL) AS VALOR_GASTO, COUNT(P.ID) AS QUANTIDADE_PEDIDOS ' +
                'FROM PEDIDO P ' +
                'INNER JOIN CLIENTE C ON C.ID = P.CLIENTE_ID';

    if (DataInicial <> 0) and (DataFinal <> 0) then
    begin
      SQLQuery := SQLQuery + ' WHERE P.DATA_PEDIDO BETWEEN :DTINI AND :DTFINAL';
    end;

    SQLQuery := SQLQuery + ' GROUP BY C.ID, C.NOME';

    TQuerySQL.SQL.Text := SQLQuery;

    if (DataInicial <> 0) and (DataFinal <> 0)  then
    begin
      TQuerySQL.ParamByName('DTINI').AsDate := DataInicial;
      TQuerySQL.ParamByName('DTFINAL').AsDate := DataFinal;
    end;

    TQuerySQL.Open;

    while not TQuerySQL.Eof do
    begin
      Pedido := TPedidoRelatorio.Create;
      Pedido.Nome := TQuerySQL.FieldByName('NOME').AsString;
      Pedido.ValorGasto := TQuerySQL.FieldByName('VALOR_GASTO').AsCurrency;
      Pedido.QuantidadePedidos := TQuerySQL.FieldByName('QUANTIDADE_PEDIDOS').AsInteger;
      Result.Add(Pedido);
      TQuerySQL.Next;
    end;
  finally
    TQuerySQL.Free;
  end;
end;

end.

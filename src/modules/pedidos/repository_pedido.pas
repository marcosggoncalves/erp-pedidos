unit repository_pedido;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, Vcl.Dialogs, FireDAC.Stan.Def,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.Option, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, entity_pedido, entity_pedido_produto, interface_pedido, conexao;

type
  TPedidoRepository = class(TInterfacedObject, IPedidoRepository)
  private
    function CriarQuery: TFDQuery;
  public
    constructor Create;
    function Adicionar(Pedido: TPedido): Integer;
    function Remover(Id: Integer): Boolean;
    function InserirProdutoNoPedido(PedidoProduto: TPedidoProduto): Boolean;
    function ListarTodos(tipo: String = ''; search: String = ''): TList<TPedido>;
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

function TPedidoRepository.Adicionar(Pedido: TPedido): Integer;
var
  TQuerySQL: TFDQuery;
begin
  Result := 0;
  TQuerySQL := CriarQuery;
  try
    TQuerySQL.SQL.Text := 'INSERT INTO PEDIDO (cliente_id, usuario_id, data_pedido) VALUES (:cliente_id, :usuario_id, :data_pedido)  RETURNING  id';
    TQuerySQL.ParamByName('cliente_id').AsInteger := Pedido.ClienteId;
    TQuerySQL.ParamByName('usuario_id').AsInteger := Pedido.UsuarioId;
    TQuerySQL.ParamByName('data_pedido').AsDateTime := Pedido.DataPedido;

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

function TPedidoRepository.Remover(Id: Integer): Boolean;
var
  TQuerySQL: TFDQuery;
begin
  Result := False;
  TQuerySQL := CriarQuery;
  try
    TQuerySQL.SQL.Text := 'DELETE FROM PEDIDO WHERE id = :id';
    TQuerySQL.ParamByName('id').AsInteger := Id;

    try
      TQuerySQL.ExecSQL;
      Result := TQuerySQL.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao remover Pedido: ' + E.Message);
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

function TPedidoRepository.ListarTodos(tipo: String = ''; search: String = ''): TList<TPedido>;
var
  TQuerySQL: TFDQuery;
  Pedido: TPedido;
  SQLQuery: String;
begin
  Result := TList<TPedido>.Create;
  TQuerySQL := CriarQuery;

  try
    SQLQuery := 'SELECT * FROM PEDIDO';

    if (tipo = 'CLIENTE') or (tipo = 'USUARIO') then
    begin
      SQLQuery := SQLQuery + ' WHERE ' + tipo + ' LIKE :Tipo';
    end;

    SQLQuery := SQLQuery + ' ORDER BY data_pedido DESC';

    TQuerySQL.SQL.Text := SQLQuery;

    if (tipo = 'CLIENTE') or (tipo = 'USUARIO') then
    begin
      TQuerySQL.ParamByName('Tipo').AsString := '%' + search + '%';
    end;

    TQuerySQL.Open;

    while not TQuerySQL.Eof do
    begin
      Pedido := TPedido.Create;
      Pedido.Id := TQuerySQL.FieldByName('id').AsInteger;
      Pedido.ClienteId := TQuerySQL.FieldByName('cliente_id').AsInteger;
      Pedido.UsuarioId := TQuerySQL.FieldByName('usuario_id').AsInteger;
      Pedido.DataPedido := TQuerySQL.FieldByName('data_pedido').AsDateTime;
      Result.Add(Pedido);
      TQuerySQL.Next;
    end;
  finally
    TQuerySQL.Free;
  end;
end;

end.

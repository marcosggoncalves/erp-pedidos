unit repository_cliente;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.Stan.Def,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.Option, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, entity_cliente, interface_cliente, conexao;

type
  TClienteRepository = class(TInterfacedObject, IClienteRepository)
  private
    function CriarQuery: TFDQuery;
  public
    constructor Create;
    function Adicionar(ACliente: TCliente): Boolean;
    function Atualizar(ACliente: TCliente): Boolean;
    function Remover(AId: Integer): Boolean;
    function ListarTodos(tipo: String = ''; search: String = '')
      : TList<TCliente>;
  end;

implementation

constructor TClienteRepository.Create;
begin
  inherited Create;
end;

function TClienteRepository.CriarQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := conexao.dm.FDConexao;
end;

function TClienteRepository.Adicionar(ACliente: TCliente): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := CriarQuery;
  try
    Qry.SQL.Text :=
      'INSERT INTO cliente (nome, cpf_cnpj) VALUES (:nome, :cpf_cnpj)';
    Qry.ParamByName('nome').AsString := ACliente.Nome;
    Qry.ParamByName('cpf_cnpj').AsString := ACliente.CpfCnpj;

    try
      Qry.ExecSQL;
      Result := Qry.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao adicionar cliente: ' + E.Message);
    end;
  finally
    Qry.Free;
  end;
end;

function TClienteRepository.Atualizar(ACliente: TCliente): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := CriarQuery;
  try
    Qry.SQL.Text :=
      'UPDATE cliente SET nome = :nome, cpf_cnpj = :cpf_cnpj WHERE id = :id';
    Qry.ParamByName('nome').AsString := ACliente.Nome;
    Qry.ParamByName('cpf_cnpj').AsString := ACliente.CpfCnpj;
    Qry.ParamByName('id').AsInteger := ACliente.Id;

    try
      Qry.ExecSQL;
      Result := Qry.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao atualizar cliente: ' + E.Message);
    end;
  finally
    Qry.Free;
  end;
end;

function TClienteRepository.Remover(AId: Integer): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := CriarQuery;
  try
    Qry.SQL.Text := 'DELETE FROM cliente WHERE id = :id';
    Qry.ParamByName('id').AsInteger := AId;

    try
      Qry.ExecSQL;
      Result := Qry.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao remover cliente: ' + E.Message);
    end;
  finally
    Qry.Free;
  end;
end;

function TClienteRepository.ListarTodos(tipo: String = ''; search: String = '')
  : TList<TCliente>;
var
  Qry: TFDQuery;
  Cliente: TCliente;
  SQLQuery: String;
begin
  Result := TList<TCliente>.Create;
  Qry := CriarQuery;

  try
    SQLQuery := 'SELECT * FROM cliente';

    if (tipo = 'NOME') or (tipo = 'CPF_CNPJ') then
    begin
      SQLQuery := SQLQuery + ' WHERE ' + tipo + ' LIKE :Tipo';
    end;

    SQLQuery := SQLQuery + ' ORDER BY nome';

    Qry.SQL.Text := SQLQuery;

    if (tipo = 'NOME') or (tipo = 'CPF_CNPJ') then
    begin
      Qry.ParamByName('Tipo').AsString := '%' + search + '%';
    end;

    Qry.Open;

    while not Qry.Eof do
    begin
      Cliente := TCliente.Create;
      Cliente.Id := Qry.FieldByName('id').AsInteger;
      Cliente.Nome := Qry.FieldByName('nome').AsString;
      Cliente.CpfCnpj := Qry.FieldByName('cpf_cnpj').AsString;
      Result.Add(Cliente);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

end.

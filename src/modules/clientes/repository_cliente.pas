unit repository_cliente;

interface

uses
  entity_cliente, interface_cliente, System.Generics.Collections, FireDAC.Comp.Client, Data.DB, System.SysUtils;

type
  TClienteRepository = class(TInterfacedObject, IClienteRepository)
  private
    FConexao: TFDConnection;
  public
    constructor Create(AConexao: TFDConnection);
    function Adicionar(ACliente: TCliente): Boolean;
    function Atualizar(ACliente: TCliente): Boolean;
    function Remover(AId: Integer): Boolean;
    function BuscarPorId(AId: Integer): TCliente;
    function ListarTodos: TList<TCliente>;
  end;

implementation

constructor TClienteRepository.Create(AConexao: TFDConnection);
begin
  FConexao := AConexao;
end;

function TClienteRepository.Adicionar(ACliente: TCliente): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConexao;
    Qry.SQL.Text := 'INSERT INTO cliente (nome, cpf_cnpj) VALUES (:nome, :cpf_cnpj)';
    Qry.ParamByName('nome').AsString := ACliente.Nome;
    Qry.ParamByName('cpf_cnpj').AsString := ACliente.CpfCnpj;
    Qry.ExecSQL;
    Result := Qry.RowsAffected > 0;
  finally
    Qry.Free;
  end;
end;

function TClienteRepository.Atualizar(ACliente: TCliente): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConexao;
    Qry.SQL.Text := 'UPDATE cliente SET nome = :nome, cpf_cnpj = :cpf_cnpj WHERE id = :id';
    Qry.ParamByName('nome').AsString := ACliente.Nome;
    Qry.ParamByName('cpf_cnpj').AsString := ACliente.CpfCnpj;
    Qry.ParamByName('id').AsInteger := ACliente.Id;
    Qry.ExecSQL;
    Result := Qry.RowsAffected > 0;
  finally
    Qry.Free;
  end;
end;

function TClienteRepository.Remover(AId: Integer): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConexao;
    Qry.SQL.Text := 'DELETE FROM cliente WHERE id = :id';
    Qry.ParamByName('id').AsInteger := AId;
    Qry.ExecSQL;
    Result := Qry.RowsAffected > 0;
  finally
    Qry.Free;
  end;
end;

function TClienteRepository.BuscarPorId(AId: Integer): TCliente;
var
  Qry: TFDQuery;
begin
  Result := nil;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConexao;
    Qry.SQL.Text := 'SELECT * FROM cliente WHERE id = :id';
    Qry.ParamByName('id').AsInteger := AId;
    Qry.Open;
    if not Qry.IsEmpty then
    begin
      Result := TCliente.Create;
      Result.Id := Qry.FieldByName('id').AsInteger;
      Result.Nome := Qry.FieldByName('nome').AsString;
      Result.CpfCnpj := Qry.FieldByName('cpf_cnpj').AsString;
    end;
  finally
    Qry.Free;
  end;
end;

function TClienteRepository.ListarTodos: TList<TCliente>;
var
  Qry: TFDQuery;
  Cliente: TCliente;
begin
  Result := TList<TCliente>.Create;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConexao;
    Qry.SQL.Text := 'SELECT * FROM cliente ORDER BY nome';
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

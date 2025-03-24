unit repository_usuario;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,  Vcl.Dialogs, FireDAC.Stan.Def,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.Option, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, entity_usuario, interface_usuario, conexao;

type
  TUsuarioRepository = class(TInterfacedObject, IUsuarioRepository)
  private
    function CriarQuery: TFDQuery;
  public
    constructor Create;
    function Adicionar(body: TUsuario): Boolean;
    function Atualizar(body: TUsuario): Boolean;
    function Remover(Id: Integer): Boolean;
    function Login(body: TUsuario): TUsuario;
    function ListarTodos(tipo: String = ''; search: String = '') : TList<TUsuario>;
  end;

implementation

constructor TUsuarioRepository.Create;
begin
  inherited Create;
end;

function TUsuarioRepository.CriarQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := conexao.dm.FDConexao;
end;

function TUsuarioRepository.Adicionar(body: TUsuario): Boolean;
var
  TQuerySQL: TFDQuery;
begin
  Result := False;
  TQuerySQL := CriarQuery;
  try
    TQuerySQL.SQL.Text := 'INSERT INTO USUARIO (cpf, usuario, senha) VALUES (:cpf, :usuario, :senha)';
    TQuerySQL.ParamByName('cpf').AsString := body.CPF;
    TQuerySQL.ParamByName('usuario').AsString := body.Usuario;
    TQuerySQL.ParamByName('senha').AsString := body.Senha;

    try
      TQuerySQL.ExecSQL;
      Result := TQuerySQL.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao adicionar Usuario: ' + E.Message);
    end;
  finally
    TQuerySQL.Free;
  end;
end;

function TUsuarioRepository.Atualizar(body: TUsuario): Boolean;
var
  TQuerySQL: TFDQuery;
begin
  Result := False;
  TQuerySQL := CriarQuery;
  try
    TQuerySQL.SQL.Text := 'UPDATE USUARIO SET usuario = :usuario, cpf = :cpf, senha = :senha WHERE id = :id';
    TQuerySQL.ParamByName('usuario').AsString := body.Usuario;
    TQuerySQL.ParamByName('cpf').AsString := body.CPF;
    TQuerySQL.ParamByName('senha').AsString := body.Senha;
    TQuerySQL.ParamByName('id').AsInteger := body.Id;

    try
      TQuerySQL.ExecSQL;
      Result := TQuerySQL.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao atualizar produto: ' + E.Message);
    end;
  finally
    TQuerySQL.Free;
  end;
end;

function TUsuarioRepository.Remover(Id: Integer): Boolean;
var
  TQuerySQL: TFDQuery;
begin
  Result := False;
  TQuerySQL := CriarQuery;
  try
    TQuerySQL.SQL.Text := 'DELETE FROM USUARIO WHERE id = :id';
    TQuerySQL.ParamByName('id').AsInteger := Id;

    try
      TQuerySQL.ExecSQL;
      Result := TQuerySQL.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao remover Usuario: ' + E.Message);
    end;
  finally
    TQuerySQL.Free;
  end;
end;

function TUsuarioRepository.Login(body: TUsuario): TUsuario;
var
  TQuerySQL: TFDQuery;
begin
  Result := nil;
  TQuerySQL := CriarQuery;

  try
    TQuerySQL.SQL.Text := 'SELECT * FROM USUARIO WHERE cpf = :cpf AND senha = :senha';
    TQuerySQL.ParamByName('cpf').AsString := body.CPF;
    TQuerySQL.ParamByName('senha').AsString := body.Senha;

    TQuerySQL.Open;

    if not TQuerySQL.IsEmpty then
    begin
      Result := TUsuario.Create;
      Result.Id := TQuerySQL.FieldByName('id').AsInteger;
      Result.CPF := TQuerySQL.FieldByName('cpf').AsString;
      Result.Usuario := TQuerySQL.FieldByName('usuario').AsString;
    end;
  finally
    TQuerySQL.Free;
  end;
end;

function TUsuarioRepository.ListarTodos(tipo: String = ''; search: String = '') : TList<TUsuario>;
var
  TQuerySQL: TFDQuery;
  Usuario: TUsuario;
  SQLQuery: String;
begin
  Result := TList<TUsuario>.Create;
  TQuerySQL := CriarQuery;

  try
    SQLQuery := 'SELECT * FROM USUARIO';

    if (tipo = 'USUARIO') or (tipo = 'CPF') then
    begin
      SQLQuery := SQLQuery + ' WHERE ' + tipo + ' LIKE :Tipo';
    end;

    SQLQuery := SQLQuery + ' ORDER BY usuario';

    TQuerySQL.SQL.Text := SQLQuery;

    if (tipo = 'USUARIO') or (tipo = 'CPF') then
    begin
      TQuerySQL.ParamByName('Tipo').AsString := '%' + search + '%';
    end;

    TQuerySQL.Open;

    while not TQuerySQL.Eof do
    begin
      Usuario := TUsuario.Create;
      Usuario.Id := TQuerySQL.FieldByName('id').AsInteger;
      Usuario.CPF := TQuerySQL.FieldByName('cpf').AsString;
      Usuario.Usuario := TQuerySQL.FieldByName('usuario').AsString;
      Result.Add(Usuario);
      TQuerySQL.Next;
    end;
  finally
    TQuerySQL.Free;
  end;
end;

end.

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
  Qry: TFDQuery;
begin
  Result := False;
  Qry := CriarQuery;
  try
    Qry.SQL.Text := 'INSERT INTO USUARIO (cpf, usuario, senha) VALUES (:cpf, :usuario, :senha)';
    Qry.ParamByName('cpf').AsString := body.CPF;
    Qry.ParamByName('usuario').AsString := body.Usuario;
    Qry.ParamByName('senha').AsString := body.Senha;

    try
      Qry.ExecSQL;
      Result := Qry.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao adicionar Usuario: ' + E.Message);
    end;
  finally
    Qry.Free;
  end;
end;

function TUsuarioRepository.Atualizar(body: TUsuario): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := CriarQuery;
  try
    Qry.SQL.Text := 'UPDATE USUARIO SET usuario = :usuario, cpf = :cpf, senha = :senha WHERE id = :id';
    Qry.ParamByName('usuario').AsString := body.Usuario;
    Qry.ParamByName('cpf').AsString := body.CPF;
    Qry.ParamByName('senha').AsString := body.Senha;
    Qry.ParamByName('id').AsInteger := body.Id;

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

function TUsuarioRepository.Remover(Id: Integer): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := CriarQuery;
  try
    Qry.SQL.Text := 'DELETE FROM USUARIO WHERE id = :id';
    Qry.ParamByName('id').AsInteger := Id;

    try
      Qry.ExecSQL;
      Result := Qry.RowsAffected > 0;
    except
      on E: Exception do
        raise Exception.Create('Erro ao remover Usuario: ' + E.Message);
    end;
  finally
    Qry.Free;
  end;
end;

function TUsuarioRepository.ListarTodos(tipo: String = ''; search: String = '') : TList<TUsuario>;
var
  Qry: TFDQuery;
  Usuario: TUsuario;
  SQLQuery: String;
begin
  Result := TList<TUsuario>.Create;
  Qry := CriarQuery;

  try
    SQLQuery := 'SELECT * FROM USUARIO';

    if (tipo = 'USUARIO') or (tipo = 'CPF') then
    begin
      SQLQuery := SQLQuery + ' WHERE ' + tipo + ' LIKE :Tipo';
    end;

    SQLQuery := SQLQuery + ' ORDER BY usuario';

    Qry.SQL.Text := SQLQuery;

    if (tipo = 'USUARIO') or (tipo = 'CPF') then
    begin
      Qry.ParamByName('Tipo').AsString := '%' + search + '%';
    end;

    Qry.Open;

    while not Qry.Eof do
    begin
      Usuario := TUsuario.Create;
      Usuario.Id := Qry.FieldByName('id').AsInteger;
      Usuario.CPF := Qry.FieldByName('cpf').AsString;
      Usuario.Usuario := Qry.FieldByName('usuario').AsString;
      Result.Add(Usuario);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

end.

unit factory_usuario;

interface

uses
  entity_usuario;

type
  TUsuarioFactory = class
  public
    class function CriarUsuario(Id: Integer; Usuario: String; CPF: String; Senha: String): TUsuario;
  end;

implementation

class function TUsuarioFactory.CriarUsuario(Id: Integer; Usuario: String; CPF: String; Senha: String): TUsuario;
begin
  Result := TUsuario.Create;
  Result.Id := Id;
  Result.Usuario := Usuario;
  Result.CPF := CPF;
  Result.Senha := Senha;
end;

end.

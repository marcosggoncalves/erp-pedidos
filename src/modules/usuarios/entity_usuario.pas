unit entity_usuario;

interface

type
  TUsuario = class
  private
    FId: Integer;
    FUsuario: string;
    FCPF: string;
    FSenha: string;
  public
    property Id: Integer read FId write FId;
    property Usuario: string read FUsuario write FUsuario;
    property CPF: string read FCPF write FCPF;
    property Senha: string read FSenha write FSenha;
  end;

implementation

end.

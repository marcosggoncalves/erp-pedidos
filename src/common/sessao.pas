unit sessao;

interface

uses
  System.SysUtils, System.Classes, entity_usuario;

type
  TDataModule1 = class(TDataModule)
  private
    { Private declarations }
  public
    logado: TUsuario;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}


{$R *.dfm}

end.

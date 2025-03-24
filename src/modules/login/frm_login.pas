unit frm_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TTfrm_login = class(TForm)
    label_login_cpf: TLabel;
    edit_login_usuario: TEdit;
    label_login_senha: TLabel;
    edit_login_senha: TEdit;
    btn_entrar: TBitBtn;
    btn_cancelar: TBitBtn;
    panel_login: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tfrm_login: TTfrm_login;

implementation

{$R *.dfm}

end.

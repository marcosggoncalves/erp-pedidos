unit frm_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  validation, mascaras, repository_usuario, entity_usuario,
  factory_usuario, constants, frm_home;

type
  TTfrm_login = class(TForm)
    label_login_cpf: TLabel;
    edit_login_cpf: TEdit;
    label_login_senha: TLabel;
    edit_login_senha: TEdit;
    btn_fechar: TBitBtn;
    btn_entrar: TBitBtn;
    panel_login: TPanel;
    procedure edit_login_cpf_mascara(Sender: TObject);
    procedure btn_fechar_click(Sender: TObject);
    procedure btn_entrar_click(Sender: TObject);
  private
    UsuarioRepository: TUsuarioRepository;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tfrm_login: TTfrm_login;

implementation

{$R *.dfm}

uses sessao;

procedure TTfrm_login.btn_entrar_click(Sender: TObject);
var
  Usuario: TUsuario;
  FrmHome: TTfrm_home;
begin
  if not ValidarFields([edit_login_cpf, edit_login_senha]) then Exit;

  Usuario := TUsuarioFactory.CriarUsuario(0, '', edit_login_cpf.Text, edit_login_senha.Text);

  try
    Usuario := UsuarioRepository.Login(Usuario);

    if Assigned(Usuario) then
    begin
      /// Atribuir dados do usuario logado a DM global
      DataModule1.logado  := Usuario;
      /// Abrir Tela Inicial - HOME
      FrmHome :=  TTfrm_home.Create(Self);
      FrmHome.ShowModal;
      FrmHome := nil;

      Self.Close;  
    end
    else
      Messagedlg(constants.MsgLoginInvalido, MtInformation, [mbOk], 0);
  finally
    Usuario.Free;
  end;
end;

procedure TTfrm_login.edit_login_cpf_mascara(Sender: TObject);
begin
  AplicarMascaraCPFCNPJ(edit_login_cpf, 'CPF');
end;

procedure TTfrm_login.btn_fechar_click(Sender: TObject);
begin
  if Messagedlg('Deseja fechar o sistema?', mtConfirmation, [mbOk, mbCancel], 0)
    = mrOk then
  begin
    Close;
  end;
end;

end.

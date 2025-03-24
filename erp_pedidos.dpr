program erp_pedidos;

uses
  Vcl.Forms,
  frm_cliente in 'src\modules\clientes\frm_cliente.pas' {Tfrm_cliente},
  entity_cliente in 'src\modules\clientes\entity_cliente.pas',
  factory_cliente in 'src\modules\clientes\factory_cliente.pas',
  interface_cliente in 'src\modules\clientes\interface_cliente.pas',
  repository_cliente in 'src\modules\clientes\repository_cliente.pas',
  conexao in 'src\common\conexao.pas' {dm: TDataModule},
  entity_produto in 'src\modules\produtos\entity_produto.pas',
  factory_produto in 'src\modules\produtos\factory_produto.pas',
  interface_produto in 'src\modules\produtos\interface_produto.pas',
  repository_produto in 'src\modules\produtos\repository_produto.pas',
  frm_produto in 'src\modules\produtos\frm_produto.pas' {Tfrm_produto},
  Vcl.Themes,
  Vcl.Styles,
  validation in 'src\utils\validation.pas',
  constants in 'src\utils\constants.pas',
  entity_usuario in 'src\modules\usuarios\entity_usuario.pas',
  factory_usuario in 'src\modules\usuarios\factory_usuario.pas',
  frm_usuario in 'src\modules\usuarios\frm_usuario.pas' {Tfrm_usuario},
  interface_usuario in 'src\modules\usuarios\interface_usuario.pas',
  repository_usuario in 'src\modules\usuarios\repository_usuario.pas',
  frm_home in 'src\modules\home\frm_home.pas' {Tfrm_home},
  mascara_cnpj_cpf in 'src\utils\mascara_cnpj_cpf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TTfrm_home, Tfrm_home);
  Application.Run;
end.

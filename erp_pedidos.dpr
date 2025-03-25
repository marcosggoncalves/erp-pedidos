program erp_pedidos;

uses
  Vcl.Forms,
  entity_cliente in 'src\modules\clientes\entity_cliente.pas',
  factory_cliente in 'src\modules\clientes\factory_cliente.pas',
  interface_cliente in 'src\modules\clientes\interface_cliente.pas',
  repository_cliente in 'src\modules\clientes\repository_cliente.pas',
  conexao in 'src\common\conexao.pas' {dm: TDataModule},
  entity_produto in 'src\modules\produtos\entity_produto.pas',
  factory_produto in 'src\modules\produtos\factory_produto.pas',
  interface_produto in 'src\modules\produtos\interface_produto.pas',
  repository_produto in 'src\modules\produtos\repository_produto.pas',
  validation in 'src\utils\validation.pas',
  constants in 'src\utils\constants.pas',
  entity_usuario in 'src\modules\usuarios\entity_usuario.pas',
  factory_usuario in 'src\modules\usuarios\factory_usuario.pas',
  interface_usuario in 'src\modules\usuarios\interface_usuario.pas',
  repository_usuario in 'src\modules\usuarios\repository_usuario.pas',
  frm_home in 'src\forms\home\frm_home.pas' {Tfrm_home},
  frm_login in 'src\forms\login\frm_login.pas' {Tfrm_login},
  sessao in 'src\common\sessao.pas' {DataModule1: TDataModule},
  frm_cliente in 'src\forms\cliente\frm_cliente.pas' {Tfrm_cliente},
  frm_usuario in 'src\forms\usuario\frm_usuario.pas' {Tfrm_usuario},
  frm_pedido in 'src\forms\pedido\frm_pedido.pas' {TFrm_lancar_pedido},
  frm_pedidos_vendas in 'src\forms\pedido\frm_pedidos_vendas.pas' {Tfrm_pedidos_vendas},
  frm_produto in 'src\forms\produto\frm_produto.pas' {Tfrm_produto},
  mascaras in 'src\utils\mascaras.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TTfrm_login, Tfrm_login);
  Application.Run;
end.

program erp_pedidos;

uses
  Vcl.Forms,
  frm_cliente in 'src\modules\clientes\frm_cliente.pas' {Tfrm_cliente},
  entity_cliente in 'src\modules\clientes\entity_cliente.pas',
  factory_cliente in 'src\modules\clientes\factory_cliente.pas',
  interface_cliente in 'src\modules\clientes\interface_cliente.pas',
  repository_cliente in 'src\modules\clientes\repository_cliente.pas',
  conexao in 'src\common\conexao.pas' {dm: TDataModule},
  frm_home in 'src\modules\home\frm_home.pas' {Tfrm_home},
  entity_produto in 'src\modules\produtos\entity_produto.pas',
  factory_produto in 'src\modules\produtos\factory_produto.pas',
  interface_produto in 'src\modules\produtos\interface_produto.pas',
  repository_produto in 'src\modules\produtos\repository_produto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTfrm_home, Tfrm_home);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.

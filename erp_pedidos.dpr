program erp_pedidos;

uses
  Vcl.Forms,
  frm_cliente in 'src\modules\clientes\frm_cliente.pas' {Tfrm_cliente},
  entity_cliente in 'src\modules\clientes\entity_cliente.pas',
  factory_cliente in 'src\modules\clientes\factory_cliente.pas',
  interface_cliente in 'src\modules\clientes\interface_cliente.pas',
  repository_cliente in 'src\modules\clientes\repository_cliente.pas',
  conexao in 'src\common\conexao.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTfrm_cliente, Tfrm_cliente);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.

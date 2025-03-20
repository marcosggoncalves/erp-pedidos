program erp_pedidos;

uses
  Vcl.Forms,
  frm_cliente in 'src\modules\clientes\frm_cliente.pas' {Form1},
  entity_cliente in 'src\modules\clientes\entity_cliente.pas',
  factory_cliente in 'src\modules\clientes\factory_cliente.pas',
  interface_cliente in 'src\modules\clientes\interface_cliente.pas',
  repository_cliente in 'src\modules\clientes\repository_cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

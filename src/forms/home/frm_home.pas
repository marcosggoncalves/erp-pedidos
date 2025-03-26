unit frm_home;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, frm_cliente,frm_produto, frm_usuario, sessao,
  frm_pedido, frm_pedidos_vendas;

type
  TTfrm_home = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Pedidos1: TMenuItem;
    Usuarios1: TMenuItem;
    Produtos1: TMenuItem;
    Clientes1: TMenuItem;
    NovoPedido1: TMenuItem;
    NovoPedido2: TMenuItem;
    Sair1: TMenuItem;
    FinalizarSistema1: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Image1: TImage;
    Relatrios1: TMenuItem;
    Vendasporcliente1: TMenuItem;
    Produtosforadoestoque1: TMenuItem;
    Produtosmaisvendidos1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure FinalizarSistema1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure NovoPedido2Click(Sender: TObject);
    procedure NovoPedido1Click(Sender: TObject);
    procedure Vendasporcliente1Click(Sender: TObject);
    procedure Produtosforadoestoque1Click(Sender: TObject);
    procedure Produtosmaisvendidos1Click(Sender: TObject);
  end;

var
  Tfrm_home: TTfrm_home;

implementation

{$R *.dfm}

uses conexao;

procedure TTfrm_home.Clientes1Click(Sender: TObject);
var
  FrmCliente: TTfrm_cliente;
begin
  FrmCliente := TTfrm_cliente.Create(Self);

  try
    FrmCliente.ShowModal;
  finally
    FrmCliente.Free;
    FrmCliente := nil;
  end;
end;

procedure TTfrm_home.FinalizarSistema1Click(Sender: TObject);
begin
    if MessageDlg('Deseja finalizar sessão no sistema?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
    begin
       close;
    end;
end;

procedure TTfrm_home.NovoPedido1Click(Sender: TObject);
var
   FrmPedidosVendas : TTfrm_pedidos_vendas;
begin
   FrmPedidosVendas := TTfrm_pedidos_vendas.Create(Self);
    try
       FrmPedidosVendas.ShowModal;
    finally
      FrmPedidosVendas.Free;
      FrmPedidosVendas := nil;
    end;
end;

procedure TTfrm_home.NovoPedido2Click(Sender: TObject);
var
  FrmPedidoLancar : TTFrm_lancar_pedido;
begin
    FrmPedidoLancar := TTFrm_lancar_pedido.Create(Self);
    try
       FrmPedidoLancar.ShowModal;
    finally
      FrmPedidoLancar.Free;
      FrmPedidoLancar := nil;
    end;
end;

procedure TTfrm_home.Produtos1Click(Sender: TObject);
var
  FrmProduto: TTfrm_produto;
begin
  FrmProduto := TTfrm_produto.Create(Self);
  try
    FrmProduto.ShowModal;
  finally
    FrmProduto.Free;
    FrmProduto := nil;
  end;
end;

procedure TTfrm_home.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := Datetostr(now);
  StatusBar1.Panels[1].Text := TimeToStr(now);
  StatusBar1.Panels[2].Text := 'Seja bem vindo, ' + DataModule1.logado.Usuario;
  StatusBar1.Panels[3].Text := DataModule1.logado.CPF;
end;

procedure TTfrm_home.Usuarios1Click(Sender: TObject);
var
  FrmUsuario: TTfrm_usuario;
begin
  FrmUsuario := TTfrm_usuario.Create(Self);

  try
    FrmUsuario.ShowModal;
  finally
    FrmUsuario.Free;
    FrmUsuario := nil;
  end;
end;

procedure TTfrm_home.Vendasporcliente1Click(Sender: TObject);
begin
  // Verificar se o dataset está aberto antes do refresh
  if not dm.QryVendasRelatorio.Active then
    dm.QryVendasRelatorio.Open;

  // Abrir relatório
  dm.QryVendasRelatorio.Refresh;
  dm.RelatorioVendas.ShowReport();
end;

procedure TTfrm_home.Produtosforadoestoque1Click(Sender: TObject);
begin
  if not dm.QryEstoqueBaixo.Active then
    dm.QryEstoqueBaixo.Open;

  dm.QryEstoqueBaixo.Refresh;
  dm.RelatorioEstoqueBaixo.ShowReport();
end;

procedure TTfrm_home.Produtosmaisvendidos1Click(Sender: TObject);
begin
  if not dm.QueryProdutosMaisVendidos.Active then
    dm.QueryProdutosMaisVendidos.Open;

  dm.QueryProdutosMaisVendidos.Refresh;
  dm.RelatorioProdutosMaisVendidos.ShowReport();
end;

end.

unit frm_home;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, frm_cliente,frm_produto, frm_usuario;

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
    procedure Timer1Timer(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure FinalizarSistema1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
  end;

var
  Tfrm_home: TTfrm_home;

implementation

{$R *.dfm}

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
  StatusBar1.Panels[2].Text := 'Seja bem vindo, Marcos Lopes';
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

end.

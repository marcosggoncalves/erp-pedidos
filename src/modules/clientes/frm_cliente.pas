unit frm_cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TTfrm_cliente = class(TForm)
    abas_navegacao: TPageControl;
    aba_cadastro: TTabSheet;
    aba_pesquisa: TTabSheet;
    aba_lancar_pedido: TTabSheet;
    panel_btns: TPanel;
    btn_salvar: TBitBtn;
    btn_limpar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_pesquisar: TBitBtn;
    Label1: TLabel;
    label_cadastro: TLabel;
    label_id_cliente: TLabel;
    edit_id_cliente: TEdit;
    label_cpf_cnpj_cliente: TLabel;
    edit_documento_cliente: TEdit;
    label_nome_razao: TLabel;
    edit_nome_cliente: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tfrm_cliente: TTfrm_cliente;

implementation

{$R *.dfm}

end.

unit frm_produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TTfrm_produto = class(TForm)
    abas_produtos: TPageControl;
    aba_produto_cadastro: TTabSheet;
    aba_produto_pesquisa: TTabSheet;
    panel_btns_produto: TPanel;
    btn_excluir: TBitBtn;
    btn_limpar: TBitBtn;
    btn_salvar: TBitBtn;
    titulo_aba_cadastro: TLabel;
    label_cadastro: TLabel;
    edit_id_cliente: TEdit;
    edit_produto_nome: TEdit;
    label_id_cliente: TLabel;
    label_produto_descricao: TLabel;
    label_produto_valor: TLabel;
    label_produto_quantidade: TLabel;
    edit_produto_quantidade: TEdit;
    edit_produto_valor: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tfrm_produto: TTfrm_produto;

implementation

{$R *.dfm}

end.

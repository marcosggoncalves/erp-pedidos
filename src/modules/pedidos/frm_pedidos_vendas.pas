unit frm_pedidos_vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TTfrm_pedidos_vendas = class(TForm)
    abas_vendas: TPageControl;
    aba_vendas: TTabSheet;
    panel_btns_pesquisa: TPanel;
    label_opcoes: TLabel;
    btn_produto_pesquisar: TBitBtn;
    btn_produto_limpar: TBitBtn;
    label_data_inicial: TLabel;
    label_data_final: TLabel;
    date_inicial: TDateTimePicker;
    date_final: TDateTimePicker;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tfrm_pedidos_vendas: TTfrm_pedidos_vendas;

implementation

{$R *.dfm}

end.

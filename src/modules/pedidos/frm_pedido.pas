unit frm_pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, sessao, conexao, Vcl.DBCtrls;

type
  TTFrm_lancar_pedido = class(TForm)
    panel_info_pedido: TPanel;
    label_pedido_usuario: TLabel;
    edit_pedido_usuario: TEdit;
    label_pedido_data: TLabel;
    date_time_pedido: TDateTimePicker;
    DBGrid1: TDBGrid;
    label_cliente: TLabel;
    panel_total_itens: TPanel;
    panel_total: TPanel;
    labe_escrita_unidades: TLabel;
    label_qtd_total: TLabel;
    label_total: TLabel;
    label_escrita_total: TLabel;
    btn_finalizar: TBitBtn;
    ComboBox1: TComboBox;
    label_selecionar_produto: TLabel;
    label_produto_quantidade: TLabel;
    edit_produto_quantidade: TEdit;
    db_combobox_cliente: TDBComboBox;
    btn_adicionar: TButton;
    label_listagem_produtos: TLabel;
    btn_finalizar_: TBitBtn;
    btn_cancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btn_cancela_click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TFrm_lancar_pedido: TTFrm_lancar_pedido;

implementation

{$R *.dfm}

procedure TTFrm_lancar_pedido.btn_cancela_click(Sender: TObject);
begin
 TFrm_lancar_pedido.Close;
 TFrm_lancar_pedido.Free;
end;

procedure TTFrm_lancar_pedido.FormCreate(Sender: TObject);
begin
    edit_pedido_usuario.Text := DataModule1.logado.Usuario;
end;

end.

unit unit_Historico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  THistoricoComp = class(TForm)
    Panel14: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Image1: TImage;
    Label18: TLabel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    cmp_Filtro: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    cmp_confirma: TImage;
    camp_Cancela: TImage;
    procedure cmp_FiltroChange(Sender: TObject);
    procedure cmp_confirmaClick(Sender: TObject);
    procedure camp_CancelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HistoricoComp: THistoricoComp;


implementation

{$R *.dfm}

uses UnitDataModule;

procedure THistoricoComp.camp_CancelaClick(Sender: TObject);
begin
  // Limpar os filtros nos campos TDBLookupComboBox
  DBLookupComboBox1.KeyValue := Null;
  DBLookupComboBox2.KeyValue := Null;
  DBLookupComboBox3.KeyValue := Null;

  // Reabrir a consulta sem filtros para exibir todos os dados
  with DM.FDQueryFornecimento do
  begin
    // Fechar a consulta atual
    Close;

    // Montar a consulta sem filtros (toda a tabela)
    SQL.Clear;
    SQL.Add('SELECT ' +
            'fornecedor.nome AS Fornecedor, ' +
            'produto.nome AS Produto, ' +
            'comprafornecedor.Quantidade AS Quantidade, ' +
            'CONCAT(''R$ '', FORMAT((produto.preco * comprafornecedor.Quantidade), 2, ''pt_BR'')) AS Valor, ' +
            'comprafornecedor.Data AS Data, ' +
            'funcionario.nome AS Usuario ' +
            'FROM comprafornecedor ' +
            'LEFT JOIN fornecedor ON comprafornecedor.idFornecedor1 = fornecedor.idFornecedor ' +
            'LEFT JOIN produto ON comprafornecedor.idProduto3 = produto.idProduto ' +
            'LEFT JOIN funcionario ON comprafornecedor.idFuncionario4 = funcionario.idFuncionario');

    // Abrir a consulta novamente para exibir todos os dados
    Open;
  end;
end;

procedure THistoricoComp.cmp_confirmaClick(Sender: TObject);
 var
  FornecedorID, ProdutoID, UsuarioID: Variant;

begin
  FornecedorID := DBLookupComboBox1.KeyValue;
  ProdutoID := DBLookupComboBox2.KeyValue;
  UsuarioID := DBLookupComboBox3.KeyValue;

  with DM.FDQueryFornecimento do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ' +
            'fornecedor.nome AS Fornecedor, ' +
            'produto.nome AS Produto, ' +
            'comprafornecedor.Quantidade AS Quantidade, ' +
            'CONCAT(''R$ '', FORMAT((produto.preco * comprafornecedor.Quantidade), 2, ''pt_BR'')) AS Valor, ' +
            'comprafornecedor.Data AS Data, ' +
            'funcionario.nome AS Usuario ' +
            'FROM comprafornecedor ' +
            'LEFT JOIN fornecedor ON comprafornecedor.idFornecedor1 = fornecedor.idFornecedor ' +
            'LEFT JOIN produto ON comprafornecedor.idProduto3 = produto.idProduto ' +
            'LEFT JOIN funcionario ON comprafornecedor.idFuncionario4 = funcionario.idFuncionario ' +
            'WHERE 1=1');

    if not VarIsNull(FornecedorID) then
    begin
      SQL.Add(' AND comprafornecedor.idFornecedor1 = :FornecedorID');
      ParamByName('FornecedorID').AsInteger := FornecedorID;
    end;

    if not VarIsNull(ProdutoID) then
    begin
      SQL.Add(' AND comprafornecedor.idProduto3 = :ProdutoID');
      ParamByName('ProdutoID').AsInteger := ProdutoID;
    end;

    if not VarIsNull(UsuarioID) then
    begin
      SQL.Add(' AND comprafornecedor.idFuncionario4 = :UsuarioID');
      ParamByName('UsuarioID').AsInteger := UsuarioID;
    end;

    Open;
  end;
end;


procedure THistoricoComp.cmp_FiltroChange(Sender: TObject);
begin
  // Verificar se o valor selecionado é "Sim"
  if cmp_Filtro.Text = 'Sim' then
  begin
    // Ativar os campos
    DBLookupComboBox1.Enabled := True;
    DBLookupComboBox2.Enabled := True;
    DBLookupComboBox3.Enabled := True;

    ShowMessage('Campos habilitados para filtro');
  end
  else
  begin
    // Desativar os campos
    DBLookupComboBox1.Enabled := False;
    DBLookupComboBox2.Enabled := False;
    DBLookupComboBox3.Enabled := False;

    ShowMessage('Campos desabilitados para filtro');
  end;
end;
end.

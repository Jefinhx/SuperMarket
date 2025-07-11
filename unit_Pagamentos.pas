unit unit_Pagamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TPagamentos = class(TForm)
    Panel14: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Image1: TImage;
    Label13: TLabel;
    Label14: TLabel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Panel2: TPanel;
    cmp_Senha: TButtonedEdit;
    Image10: TImage;
    cmp_Libera: TPanel;
    Label2: TLabel;
    procedure cmp_LiberaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pagamentos: TPagamentos;
  qryUpdate: TFDQuery;  // Usando FireDAC para execu��o do comando SQL

implementation

{$R *.dfm}

uses
  UnitDataModule;  // Aqui voc� precisa colocar a unit onde sua conex�o com o banco de dados � configurada.

procedure TPagamentos.cmp_LiberaClick(Sender: TObject);
begin
  // Verifica se o valor digitado em cmp_Senha � 'teste123'
  if cmp_Senha.Text = 'teste123' then
  begin
    // Cria o objeto de consulta (TFDQuery) para executar o comando SQL
    qryUpdate := TFDQuery.Create(nil);
    try
      // Configura a conex�o com o banco de dados (verifique sua conex�o em UnitDataModule)
      qryUpdate.Connection := DM.FDConnection1;  // Conex�o FireDAC correta

      // Prepara o comando SQL de atualiza��o
      qryUpdate.SQL.Text :=
        'UPDATE funcionario ' +
        'SET statusPagamento = :status, ' +
        '    dataPagamento = :data';

      // Define os par�metros para o comando SQL
      qryUpdate.ParamByName('status').AsString := 'Liberado';  // Define status como 'Liberado'
      qryUpdate.ParamByName('data').AsDateTime := Now;  // Define data e hora atuais

      // Executa a consulta
      qryUpdate.ExecSQL;

      // Atualiza a consulta FDQuerySalario vinculada ao DBGrid1
      DM.FDQuerySalario.Close;  // Fecha a consulta existente
      DM.FDQuerySalario.Open;   // Reabre a consulta para refletir as altera��es

      // Exibe uma mensagem de sucesso
      ShowMessage('Pagamento liberado e atualizado com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao liberar pagamento: ' + E.Message);  // Exibe mensagem de erro em caso de falha
    end;
    qryUpdate.Free;  // Libera o objeto de consulta ap�s o uso
  end
  else
  begin
    // Se a senha for incorreta, exibe mensagem de erro
    ShowMessage('Senha incorreta.');
  end;
end;

end.


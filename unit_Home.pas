unit unit_Home;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus, unit_Cad_Cliente, unit_Cad_Fornecedor, unit_Cad_Produto,
  unit_Cad_Tranportador, unit_Cad_Caixas, unit_Caixas, unit_Faturamento, unit_MelhorCliente, unit_Pagamentos,
  unit_Compras, unit_Historico, unit_Lancamentos;

type
  TTela_Principal = class(TForm)
    Image1: TImage;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Financeiro1: TMenuItem;
    AbrirCaixa1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    Fornecedores1: TMenuItem;
    Transportadoras1: TMenuItem;
    Faturamento1: TMenuItem;
    MelhoresClientes1: TMenuItem;
    Pagamentos1: TMenuItem;
    For1: TMenuItem;
    Funcionrios1: TMenuItem;
    Abrir1: TMenuItem;
    HistoricoComp: TMenuItem;
    Lanamentos1: TMenuItem;
    Caixa1: TMenuItem;
    Compras1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Transportadoras1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Faturamento1Click(Sender: TObject);
    procedure MelhoresClientes1Click(Sender: TObject);
    procedure Pagamentos1Click(Sender: TObject);
    procedure Compras1Click(Sender: TObject);
    procedure HistoricoCompClick(Sender: TObject);
    procedure Lanamentos1Click(Sender: TObject);
  private
    FHoraLogin: TDateTime;
    CadastroCliente: TCadastroCliente;
    CadastroFornecedor: TCadastroFornecedor;
    CadastroProduto: TCadastroProduto;
    CadastroTransportador: TCadastroTransportador;
    Faturamento: TFaturamento;
    MelhoresClientes: TMelhoresClientes;
    Pagamentos: TPagamentos;
    ComprasFornece: TComprasFornece;
    Historico: THistoricoComp;
    Lancamentos: TLancamentos;
  public
  end;

var

  Tela_Principal: TTela_Principal;
  NomeUsuario: string;

implementation

{$R *.dfm}

uses UnitDataModule, unit_Global;

procedure TTela_Principal.Abrir1Click(Sender: TObject);
begin
    if not Assigned(Caixas) then
    Caixas := TCaixas.Create(Self);

    Caixas.Position := poOwnerFormCenter;
    Caixas.Show;
end;

procedure TTela_Principal.Caixa1Click(Sender: TObject);
begin
    if not Assigned(CadastroCaixa) then
    CadastroCaixa := TCadastroCaixa.Create(Self);

    CadastroCaixa.Position := poOwnerFormCenter;
    CadastroCaixa.Show;
end;

procedure TTela_Principal.Clientes1Click(Sender: TObject);
begin
  if not Assigned(CadastroCliente) then
    CadastroCliente := TCadastroCliente.Create(Self);

  CadastroCliente.Position := poOwnerFormCenter;
  CadastroCliente.Show;
end;

procedure TTela_Principal.Compras1Click(Sender: TObject);
begin
    if not Assigned(ComprasFornece) then
    ComprasFornece := TComprasFornece.Create(Self);

    ComprasFornece.Position := poOwnerFormCenter;
    ComprasFornece.Show;
end;

procedure TTela_Principal.Faturamento1Click(Sender: TObject);
begin
  if not Assigned(Faturamento) then
  begin
    Faturamento := TFaturamento.Create(Self);
  end;

  Faturamento.Position := poScreenCenter;

  Faturamento.Show;
end;

procedure TTela_Principal.FormShow(Sender: TObject);
begin
  FHoraLogin := Now;
  StatusBar1.Panels[0].Text := 'Usuário(a): ' + userName;
  StatusBar1.Panels[1].Text:='Hora Login: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', FHoraLogin);
end;

procedure TTela_Principal.Fornecedores1Click(Sender: TObject);
begin
  if not Assigned(CadastroFornecedor) then
    CadastroFornecedor := TCadastroFornecedor.Create(Self);

  CadastroFornecedor.Position := poOwnerFormCenter;
  CadastroFornecedor.Show;
end;

procedure TTela_Principal.HistoricoCompClick(Sender: TObject);
begin
   if not Assigned(Historico) then
   Historico := THistoricoComp.Create(Self);

   Historico.Position := poOwnerFormCenter;
   Historico.Show;
end;

procedure TTela_Principal.Lanamentos1Click(Sender: TObject);
begin
   if not Assigned(Lancamentos) then
    Lancamentos := TLancamentos.Create(Self);

    Lancamentos.Position := poOwnerFormCenter;
    Lancamentos.Show;
end;

procedure TTela_Principal.MelhoresClientes1Click(Sender: TObject);
begin
  if not Assigned(CadastroProduto) then
    MelhoresClientes := TMelhoresClientes.Create(Self);

  MelhoresClientes.Position := poOwnerFormCenter;
  MelhoresClientes.Show;
end;

procedure TTela_Principal.Pagamentos1Click(Sender: TObject);
begin
    if not Assigned(Pagamentos) then
  begin
    Pagamentos := TPagamentos.Create(Self);
  end;

  Pagamentos.Position := poScreenCenter;

  Pagamentos.Show;
end;

procedure TTela_Principal.Produtos1Click(Sender: TObject);
begin
  if not Assigned(CadastroProduto) then
    CadastroProduto := TCadastroProduto.Create(Self);

  Cadastroproduto.Position := poOwnerFormCenter;
  CadastroProduto.Show;
end;

procedure TTela_Principal.Timer1Timer(Sender: TObject);
var
  TempoLogado: TDateTime;
  Horas, Minutos, Segundos: Integer;
  TempoLogadoTexto: string;
begin
  // Calcula a diferença entre a hora atual e o tempo de login
  TempoLogado := Now - FHoraLogin;

  // Converte a diferença para horas, minutos e segundos
  Horas := Trunc(TempoLogado * 24); // Hora (parte inteira dos dias convertidos em horas)
  Minutos := Trunc(Frac(TempoLogado) * 24 * 60); // Minutos (parte decimal do tempo convertido para minutos)
  Segundos := Trunc(Frac(Frac(TempoLogado) * 24 * 60) * 60); // Segundos (parte decimal dos minutos convertida para segundos)

  // Determina a palavra correta para hora, minuto e segundo (singular ou plural)
  if Horas = 1 then
    TempoLogadoTexto := Format('Tempo logado: %d hora, ', [Horas])
  else
    TempoLogadoTexto := Format('Tempo logado: %d horas, ', [Horas]);

  if Minutos = 1 then
    TempoLogadoTexto := TempoLogadoTexto + Format('%d minuto e ', [Minutos])
  else
    TempoLogadoTexto := TempoLogadoTexto + Format('%d minutos e ', [Minutos]);

  if Segundos = 1 then
    TempoLogadoTexto := TempoLogadoTexto + Format('%d segundo', [Segundos])
  else
    TempoLogadoTexto := TempoLogadoTexto + Format('%d segundos', [Segundos]);

  // Atualiza o StatusBar com a mensagem formatada
  StatusBar1.Panels[2].Text := TempoLogadoTexto;
end;

procedure TTela_Principal.Transportadoras1Click(Sender: TObject);
begin
  if not Assigned(CadastroTransportador) then
    CadastroTransportador := TCadastroTransportador.Create(Self);

  CadastroTransportador.Position := poOwnerFormCenter;
  CadastroTransportador.Show;
end;

end.


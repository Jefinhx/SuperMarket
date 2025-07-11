unit unit_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Mask, Vcl.WinXCalendars, Vcl.Grids,
  Vcl.Samples.Calendar, FireDAC.Comp.Client,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TLogin = class(TForm)
    pnl_principal: TPanel;
    pnl_imagem: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Image2: TImage;
    Image3: TImage;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Panel6: TPanel;
    Image4: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Label14: TLabel;
    Label4: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBGenero: TDBComboBox;
    btn_Criar: TPanel;
    Panel3: TPanel;
    cmp_Email: TButtonedEdit;
    cmp_Senha: TButtonedEdit;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    btn_data: TCalendarPicker;
    Label23: TLabel;
    Panel9: TPanel;
    Image11: TImage;
    DBEdit4: TDBEdit;
    Panel10: TPanel;
    DBEdit1: TDBEdit;
    Panel11: TPanel;
    DBEdit2: TDBEdit;
    Panel12: TPanel;
    DBEdit3: TDBEdit;
    Label24: TLabel;
    Panel8: TPanel;
    Label25: TLabel;
    DBEdit5: TDBEdit;
    procedure btn_CriarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn_CriarMouseLeave(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseLeave(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure btn_CriarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login: TLogin;

implementation

{$R *.dfm}

uses UnitDataModule, unit_Global, unit_Home;

procedure TLogin.btn_CriarClick(Sender: TObject);
begin
  DM.FDTableFuncionario.FieldByName('nascimento').AsDateTime := btn_data.Date;
  DM.FDTableFuncionario.Post;
  ShowMessage('Funcionário cadastrado com sucesso.');
  DM.FDTableFuncionario.Insert;
end;

procedure TLogin.btn_CriarMouseLeave(Sender: TObject);
begin
  btn_Criar.Color := clLime;
end;

procedure TLogin.btn_CriarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  btn_Criar.Color := clGreen;
end;

procedure TLogin.FormShow(Sender: TObject);
begin
  DM.FDTableFuncionario.Insert;
end;

procedure TLogin.Image11Click(Sender: TObject);
begin
  // Verifica o estado atual do campo PasswordChar
  if (DBEdit4.PasswordChar = '*') AND (cmp_Senha.PasswordChar = '*') then
  begin
    // Se o PasswordChar é '*', mostra o texto real
    cmp_Senha.PasswordChar := #0;
    DBEdit4.PasswordChar := #0; // #0 remove a máscara e exibe os caracteres reais
  end
  else
  begin
    // Caso contrário, volta para a máscara com '*'
    DBEdit4.PasswordChar := '*';
    cmp_Senha.PasswordChar := '*';
  end;
end;

procedure TLogin.Panel1Click(Sender: TObject);
begin
// Valida se os campos de e-mail e senha não estão vazios
  if (cmp_Email.Text = '') and (cmp_Senha.Text = '') then
  begin
    ShowMessage('Por favor, preencha todos os campos.');
    Exit;
  end;

  // Atribui os valores dos campos de texto aos parâmetros da consulta
  DM.FDQueryLogin.ParamByName('email').AsString := cmp_Email.Text;
  DM.FDQueryLogin.ParamByName('senha').AsString := cmp_Senha.Text;

  // Executa a consulta no banco de dados
  DM.FDQueryLogin.Open;

  // Verifica se a consulta retornou um registro
  if DM.FDQueryLogin.RecordCount > 0 then
  begin
    userName := DM.FDQueryLogin.FieldByName('nome').AsString;
    idUser := DM.FDQueryLogin.FieldByName('idFuncionario').AsInteger;
    Tela_Principal.Show;
    ShowMessage('Bem-vindo, ' + userName + '!');
  end
  else
  begin
    // E-mail ou senha incorretos
    ShowMessage('E-mail ou senha incorretos!');
  end;

  // Fecha a consulta após a execução
  DM.FDQueryLogin.Close;
end;

procedure TLogin.Panel1MouseLeave(Sender: TObject);
begin
  Panel1.Color := clLime;
end;

procedure TLogin.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Panel1.Color := clGreen;
end;

end.


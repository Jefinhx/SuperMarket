unit unit_Lancamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TLancamentos = class(TForm)
    Panel14: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Image1: TImage;
    Label18: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    cmp_confirma: TImage;
    camp_Cancela: TImage;
    ComboBox1: TComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBEdit8: TDBEdit;
    DBGrid1: TDBGrid;
    procedure cmp_confirmaClick(Sender: TObject);
    procedure camp_CancelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Lancamentos: TLancamentos;

implementation

{$R *.dfm}

uses UnitDataModule;

procedure TLancamentos.camp_CancelaClick(Sender: TObject);
begin
   DBLookupComboBox1.KeyValue := 'Selecione';
   ComboBox1.Text := 'Selecione o tipo';
   DateTimePicker1.DateTime := Now;
   DateTimePicker2.DateTime := Now;
end;

procedure TLancamentos.cmp_confirmaClick(Sender: TObject);
begin
   DM.FDTableLancamentos.Insert;

   DM.FDTableLancamentos.FieldByName('idFuncionario6').AsInteger := StrToInt(DBEdit8.Text);
   DM.FDTableLancamentos.FieldByName('Tipo').AsString := ComboBox1.Text;
   DM.FDTableLancamentos.FieldByName('DataInicio').AsDateTime := DateTimePicker1.DateTime;
   DM.FDTableLancamentos.FieldByName('DataFim').AsDateTime := DateTimePicker2.DateTime;

   DM.FDTableLancamentos.Post;

   if ComboBox1.Text = 'Férias' then
     ShowMessage('Férias lançadas com sucesso.')
   else if ComboBox1.Text = 'Atestado' then
     ShowMessage('Atestado cadastrado com sucesso.')
   else if ComboBox1.Text = 'Folga' then
     ShowMessage('Folga lançada com sucesso.');


   DBLookupComboBox1.KeyValue := 'Selecione';
   ComboBox1.Text := 'Selecione o tipo';
   DateTimePicker1.DateTime := Now;
   DateTimePicker2.DateTime := Now;
end;

end.

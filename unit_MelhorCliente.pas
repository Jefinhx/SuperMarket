unit unit_MelhorCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Mask, Vcl.DBCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TMelhoresClientes = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Panel3: TPanel;
    Label17: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Panel7: TPanel;
    Label6: TLabel;
    Panel8: TPanel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Panel9: TPanel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Panel10: TPanel;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    Image3: TImage;
    Label11: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    Image4: TImage;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel11: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MelhoresClientes: TMelhoresClientes;

implementation

{$R *.dfm}

end.

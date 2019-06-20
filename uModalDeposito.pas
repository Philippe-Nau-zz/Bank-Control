unit uModalDeposito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmModalDeposito = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    spFechaModal: TSpeedButton;
    procedure spFechaModalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModalDeposito: TfrmModalDeposito;

implementation

{$R *.dfm}

procedure TfrmModalDeposito.spFechaModalClick(Sender: TObject);
begin
  frmModalDeposito.Close;
end;

end.

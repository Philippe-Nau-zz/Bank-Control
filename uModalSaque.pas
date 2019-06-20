unit uModalSaque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmModalSaque = class(TForm)
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
  frmModalSaque: TfrmModalSaque;

implementation

{$R *.dfm}

procedure TfrmModalSaque.spFechaModalClick(Sender: TObject);
begin
  frmModalSaque.Close;
end;

end.

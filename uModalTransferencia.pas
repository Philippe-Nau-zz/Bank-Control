unit uModalTransferencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmModalTransferencia = class(TForm)
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
  frmModalTransferencia: TfrmModalTransferencia;

implementation

{$R *.dfm}

procedure TfrmModalTransferencia.spFechaModalClick(Sender: TObject);
begin
  frmModalTransferencia.Close;
end;

end.

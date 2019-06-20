unit uSaque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Buttons, StdCtrls, ExtCtrls, pngimage;

type
  TfrmSaque = class(TFrame)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    edtValorSaque: TEdit;
    Label2: TLabel;
    btnRealizaSaque: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDeposito, uExtrato, uLogin, uPrincipal, uSaldo, uTranferencia;

{$R *.dfm}

end.

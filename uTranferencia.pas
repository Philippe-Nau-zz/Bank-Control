unit uTranferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, pngimage, ExtCtrls, StdCtrls, Buttons;

type
  TfrmTransferencia = class(TFrame)
    btnRealizaTransferencia: TSpeedButton;
    edtValorTransferencia: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    edtContaTransferencia: TEdit;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDeposito, uExtrato, uLogin, uPrincipal, uSaldo, uSaque;

{$R *.dfm}

end.

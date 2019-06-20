unit uDeposito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, pngimage, Buttons;

type
  TfrmDeposito = class(TFrame)
    btnRealizaDeposito: TSpeedButton;
    edtValorDeposito: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    rgOpacaoDeposito: TRadioGroup;
    procedure btnRealizaDepositoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  vprg_Deposito : Real;
implementation

uses uExtrato, uLogin, uPrincipal, uSaldo, uSaque, uTranferencia;

{$R *.dfm}

procedure TfrmDeposito.btnRealizaDepositoClick(Sender: TObject);
begin
  if Trim(edtValorDeposito.Text) <> '0' then
    begin
      vprg_Deposito := StrToFloat(edtValorDeposito.Text);
      edtValorDeposito.Clear;
      edtValorDeposito.SetFocus;
    end
  else
    ShowMessage('Digite um valor para fazer o depósito!');
end;

end.

unit uSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, pngimage;

type
  TfrmSaldo = class(TFrame)
    Label1: TLabel;
    lbValorSaldo: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    procedure lbValorSaldoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDeposito, uExtrato, uLogin, uPrincipal, uSaque, uTranferencia;

{$R *.dfm}

procedure TfrmSaldo.lbValorSaldoClick(Sender: TObject);
begin
  if vprg_Saldo = 0.0 then
    lbValorSaldo.Caption := 'R$0,00';
  vprg_Saldo:= vprg_Saldo + vprg_Deposito;
  lbValorSaldo.Caption := 'R$' + FloatToStr(vprg_Saldo);
  vprg_Deposito := 0;
end;

end.


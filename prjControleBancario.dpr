program prjControleBancario;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uLogin in 'uLogin.pas' {frmLogin},
  uModalDeposito in 'uModalDeposito.pas' {frmModalDeposito},
  uModalSaque in 'uModalSaque.pas' {frmModalSaque},
  uModalTransferencia in 'uModalTransferencia.pas' {frmModalTransferencia};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmModalDeposito, frmModalDeposito);
  Application.CreateForm(TfrmModalSaque, frmModalSaque);
  Application.CreateForm(TfrmModalTransferencia, frmModalTransferencia);
  Application.Run;
end.

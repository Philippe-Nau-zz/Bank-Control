unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, uSaldo, uSaque, uExtrato, uDeposito,
  uTranferencia, Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    lbNome: TLabel;
    lbConta: TLabel;
    lbData: TLabel;
    Timer1: TTimer;
    spSaldo: TSpeedButton;
    spSaque: TSpeedButton;
    spTransferencia: TSpeedButton;
    spDeposito: TSpeedButton;
    spExtrato: TSpeedButton;
    Panel2: TPanel;
    lbSair: TLabel;
    PageControl1: TPageControl;
    tbsSaldo: TTabSheet;
    tbsSaque: TTabSheet;
    tbsTransferencia: TTabSheet;
    tbsDeposito: TTabSheet;
    tbsExtrato: TTabSheet;
    Panel3: TPanel;
    Image1: TImage;
    Panel5: TPanel;
    Image2: TImage;
    Panel7: TPanel;
    Image3: TImage;
    Panel9: TPanel;
    Image4: TImage;
    Panel11: TPanel;
    Image5: TImage;
    Panel4: TPanel;
    Label1: TLabel;
    Panel13: TPanel;
    lbValorSaldo: TLabel;
    Panel6: TPanel;
    spRealizaSaque: TSpeedButton;
    edtValorSaque: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Panel14: TPanel;
    Panel8: TPanel;
    spRealizaTransferencia: TSpeedButton;
    edtContaTransferencia: TEdit;
    edtValorTransferencia: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel15: TPanel;
    Panel10: TPanel;
    spRealizaDeposito: TSpeedButton;
    edtValorDeposito: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Panel16: TPanel;
    rgOpacaoDeposito: TRadioGroup;
    Panel12: TPanel;
    Label9: TLabel;
    Panel17: TPanel;
    mmExtrato: TMemo;
    procedure Label4Click(Sender: TObject);
    procedure lbSairClick(Sender: TObject);
    procedure spSaldoClick(Sender: TObject);
    procedure spSaqueClick(Sender: TObject);
    procedure spTransferenciaClick(Sender: TObject);
    procedure spDepositoClick(Sender: TObject);
    procedure spExtratoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure spRealizaDepositoClick(Sender: TObject);
    procedure spRealizaTransferenciaClick(Sender: TObject);
    procedure spRealizaSaqueClick(Sender: TObject);
    procedure edtValorTransferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorSaqueKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorDepositoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgOpacaoDepositoClick(Sender: TObject);
    procedure edtValorSaqueKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorDepositoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorTransferenciaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  vprg_Saldo         : Real;
  vprg_Deposito      : Real;
  vprg_Transferencia : Real;
  vprg_Saque         : Real;
  vprg_TipoDeposito  : String;
implementation

uses uLogin, uModalDeposito, uModalSaque, uModalTransferencia;

{$R *.dfm}

procedure TfrmPrincipal.spRealizaDepositoClick(Sender: TObject);
begin
  if (rgOpacaoDeposito.ItemIndex = -1) or (Trim(edtValorDeposito.Text) = '') then
    Application.MessageBox('Todos os campos devem ser preenchidos!','Atenção', MB_OK + MB_ICONEXCLAMATION)
  else
    begin
      vprg_Deposito := StrToFloat(edtValorDeposito.Text);
      vprg_Saldo    := vprg_Saldo + vprg_Deposito;
      lbValorSaldo.Caption := 'R$' + FormatFloat('0.00',vprg_Saldo);
      edtValorDeposito.Clear;
      edtValorDeposito.SetFocus;
      rgOpacaoDeposito.ItemIndex := -1;

      AssignFile(vprg_Extrato, ExtractFilePath(Application.ExeName) + (frmLogin.edtUsuario.Text + '\') + FormatDateTime('ddmmyy', now) + '.txt');
      Append(vprg_Extrato);
      Writeln(vprg_Extrato,'Depósito: ' + vprg_TipoDeposito + '.............................. R$' + FormatFloat('0.00',vprg_Deposito));
      CloseFile(vprg_Extrato);

      frmModalDeposito.ShowModal;
      spSaldoClick(self);
    end;

end;

procedure TfrmPrincipal.spRealizaSaqueClick(Sender: TObject);
begin
  if (Trim(edtValorSaque.Text) = '') then
    begin
      Application.MessageBox('Insira o valor a ser sacado!','Atenção', MB_OK + MB_ICONEXCLAMATION);
      edtValorSaque.SetFocus;
    end
  else
    begin
      if StrToFloat(edtValorSaque.Text) <= vprg_Saldo then
        begin
          vprg_Saque := StrToFloat(edtValorSaque.Text);
          vprg_Saldo := vprg_Saldo - vprg_Saque;
          lbValorSaldo.Caption := 'R$' + FormatFloat('0.00',vprg_Saldo);
          edtValorSaque.Clear;
          edtValorSaque.SetFocus;

          AssignFile(vprg_Extrato, ExtractFilePath(Application.ExeName) + (frmLogin.edtUsuario.Text + '\') + FormatDateTime('ddmmyy', now) + '.txt');
          Append(vprg_Extrato);
          Writeln(vprg_Extrato,'Saque: ....................................... R$' + FormatFloat('0.00',vprg_Saque));
          CloseFile(vprg_Extrato);

          frmModalSaque.ShowModal;
          spSaldoClick(self);
        end
      else
        begin
          Application.MessageBox('Saldo insuficiente para saque','Atenção', MB_OK + MB_ICONEXCLAMATION);
          edtValorSaque.Clear;

          spSaldoClick(self);
        end;
    end;
end;

procedure TfrmPrincipal.spRealizaTransferenciaClick(Sender: TObject);
begin
  if (Trim(edtContaTransferencia.Text) = '') or (Trim(edtValorTransferencia.Text) = '') then
    Application.MessageBox('Todos os campos devem ser preenchidos!','Atenção', MB_OK + MB_ICONEXCLAMATION)
  else
    begin
      if StrToFloat(edtValorTransferencia.Text) <= vprg_Saldo then
        begin
          vprg_Transferencia := StrToFloat(edtValorTransferencia.Text);
          vprg_Saldo := vprg_Saldo - vprg_Transferencia;
          lbValorSaldo.Caption := 'R$' + FormatFloat('0.00',vprg_Saldo);
          edtContaTransferencia.Clear;
          edtValorTransferencia.Clear;
          edtContaTransferencia.SetFocus;

          AssignFile(vprg_Extrato, ExtractFilePath(Application.ExeName) + (frmLogin.edtUsuario.Text + '\') + FormatDateTime('ddmmyy', now) + '.txt');
          Append(vprg_Extrato);
          Writeln(vprg_Extrato,'Transferência: ............................... R$' + FormatFloat('0.00',vprg_Transferencia));
          CloseFile(vprg_Extrato);

          frmModalTransferencia.ShowModal;
          spSaldoClick(self);
        end
      else
        begin
          Application.MessageBox('Saldo insuficiente para transferência','Atenção', MB_OK + MB_ICONEXCLAMATION);
          edtContaTransferencia.Clear;
          edtValorTransferencia.Clear;

          spSaldoClick(self);
        end;
    end;
end;

procedure TfrmPrincipal.edtValorDepositoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9',',',#8]) then
    key := #0;
end;

procedure TfrmPrincipal.edtValorDepositoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    spRealizaDepositoClick(self);
end;

procedure TfrmPrincipal.edtValorSaqueKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9',',',#8]) then
    key := #0;
end;

procedure TfrmPrincipal.edtValorSaqueKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    spRealizaSaqueClick(self);
end;

procedure TfrmPrincipal.edtValorTransferenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9',',',#8]) then
    key := #0;
end;

procedure TfrmPrincipal.edtValorTransferenciaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    spRealizaTransferenciaClick(self);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  tbsSaldo.TabVisible := True;
  lbData.Caption      := 'Data: ' + FormatDateTime('dd/mm/yyyy', now);
  lbValorSaldo.Caption := 'R$' + FormatFloat('0.00', vprg_Saldo);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PageControl1.TabIndex := 1;
  tbsSaldo.TabVisible         := True;
  tbsSaque.TabVisible         := False;
  tbsTransferencia.TabVisible := False;
  tbsDeposito.TabVisible      := False;
  tbsExtrato.TabVisible       := False;

  vprg_Saldo := 0;
  DeleteFile(ExtractFilePath(Application.ExeName) + (frmLogin.edtUsuario.Text + '\') + FormatDateTime('ddmmyy', now) + '.txt');
  frmLogin.Show;
  frmLogin.edtUsuario.Clear;
  frmLogin.edtSenha.Clear;
  frmLogin.edtUsuario.SetFocus;

end;

procedure TfrmPrincipal.Label4Click(Sender: TObject);
begin
  frmPrincipal.Close;
end;

procedure TfrmPrincipal.lbSairClick(Sender: TObject);
begin
  frmPrincipal.Close;
end;

procedure TfrmPrincipal.rgOpacaoDepositoClick(Sender: TObject);
begin
  vprg_TipoDeposito := rgOpacaoDeposito.Items[rgOpacaoDeposito.ItemIndex];
end;

procedure TfrmPrincipal.spDepositoClick(Sender: TObject);

begin
  PageControl1.ActivePageIndex := 3;
  tbsSaldo.TabVisible         := False;
  tbsSaque.TabVisible         := False;
  tbsTransferencia.TabVisible := False;
  tbsDeposito.TabVisible      := True;
  tbsExtrato.TabVisible       := False;

  vprg_Deposito := 0;
  edtValorDeposito.Clear;
  edtValorDeposito.SetFocus;
end;

procedure TfrmPrincipal.spExtratoClick(Sender: TObject);
var
  vloc_Linha: String;
begin
  PageControl1.ActivePageIndex := 4;
  tbsSaldo.TabVisible         := False;
  tbsSaque.TabVisible         := False;
  tbsTransferencia.TabVisible := False;
  tbsDeposito.TabVisible      := False;
  tbsExtrato.TabVisible       := True;

  mmExtrato.Clear;
  AssignFile(vprg_Extrato, ExtractFilePath(Application.ExeName) + (frmLogin.edtUsuario.Text + '\') + FormatDateTime('ddmmyy', now) + '.txt');
  Reset(vprg_Extrato);
  while not(Eof(vprg_Extrato)) do
    begin
      Readln(vprg_Extrato, vloc_Linha);
      mmExtrato.Lines.Add(vloc_Linha);
    end;
  CloseFile(vprg_Extrato);

end;

procedure TfrmPrincipal.spSaldoClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  tbsSaldo.TabVisible         := True;
  tbsSaque.TabVisible         := False;
  tbsTransferencia.TabVisible := False;
  tbsDeposito.TabVisible      := False;
  tbsExtrato.TabVisible       := False;

  if vprg_Saldo >= 100000 then
    lbValorSaldo.Font.Size := 40;
end;

procedure TfrmPrincipal.spSaqueClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  tbsSaldo.TabVisible         := False;
  tbsSaque.TabVisible         := True;
  tbsTransferencia.TabVisible := False;
  tbsDeposito.TabVisible      := False;
  tbsExtrato.TabVisible       := False;

  edtValorSaque.Clear;
  edtValorSaque.SetFocus;
end;

procedure TfrmPrincipal.spTransferenciaClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 2;
  tbsSaldo.TabVisible         := False;
  tbsSaque.TabVisible         := False;
  tbsTransferencia.TabVisible := True;
  tbsDeposito.TabVisible      := False;
  tbsExtrato.TabVisible       := False;

  vprg_Saque := 0;
  edtContaTransferencia.Clear;
  edtValorTransferencia.Clear;
  edtContaTransferencia.SetFocus;
end;

end.

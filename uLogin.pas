unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, pngimage;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    spEntrar: TSpeedButton;
    Image1: TImage;
    procedure spEntrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtSenhaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  vprg_Extrato: TextFile;
implementation

uses uPrincipal;

{$R *.dfm}

procedure TfrmLogin.edtSenhaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
      spEntrarClick(self);
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  edtUsuario.SetFocus;
end;

procedure TfrmLogin.spEntrarClick(Sender: TObject);
begin
  if (edtUsuario.Text = 'admin') and (edtSenha.Text = 'admin') then
    begin
      frmPrincipal.Show;
      if not(DirectoryExists(ExtractFilePath(Application.ExeName) + frmLogin.edtUsuario.Text)) then
        ForceDirectories(ExtractFilePath(Application.ExeName) + frmLogin.edtUsuario.Text);

      if not(FileExists(ExtractFilePath(Application.ExeName) + frmLogin.edtUsuario.Text +'\' + FormatDateTime('ddmmyy', now) + '.txt')) then
        begin
          AssignFile(vprg_Extrato, ExtractFilePath(Application.ExeName) + (frmLogin.edtUsuario.Text + '\') + FormatDateTime('ddmmyy', now) + '.txt');
          Rewrite(vprg_Extrato);
          CloseFile(vprg_Extrato);

          AssignFile(vprg_Extrato, ExtractFilePath(Application.ExeName) + (frmLogin.edtUsuario.Text + '\') + FormatDateTime('ddmmyy', now) + '.txt');
          Append(vprg_Extrato);
          Writeln(vprg_Extrato, '-------------------------- ' + FormatDateTime('dd/mm/yyyy', now) + ' --------------------------');
          CloseFile(vprg_Extrato);
        end;
    end
  else
    begin
      Application.MessageBox('Usuário/Senha Inválido.', 'Login Inválido', MB_OK + MB_ICONWARNING);
      edtUsuario.Clear;
      edtSenha.Clear;
      edtUsuario.SetFocus;
    end;
end;

end.

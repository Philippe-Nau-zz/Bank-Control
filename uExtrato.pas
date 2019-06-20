unit uExtrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, pngimage, ExtCtrls;

type
  TfrmExtrato = class(TFrame)
    Label1: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    mmExtrato: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDeposito, uLogin, uPrincipal, uSaldo, uSaque, uTranferencia;

{$R *.dfm}

end.

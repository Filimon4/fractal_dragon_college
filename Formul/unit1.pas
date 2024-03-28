unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label3: TLabel;
    Number2: TEdit;
    Ok: TButton;
    Number: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Result: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure OkClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Result1Click(Sender: TObject);
    procedure ResultClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Result1Click(Sender: TObject);
begin

end;

procedure TForm1.ResultClick(Sender: TObject);
begin

end;

procedure TForm1.OkClick(Sender: TObject);
var
   x, y, a, b, c: LongInt;
   f:Extended;
begin
  y := StrToInt(Number2.Text);
  x := StrToInt(Number.Text);
  if x <= 1 then begin
      Result.Caption := 'x не может быть меньше или равен 1';
  end
  else begin
    f := ((x+1) / (x-1));
    a := 1;
    while a <= x do begin
      f := f * f;
      a := a+1;
    end;
    f := f + (18*x*(y*y));
    Result.Caption := FloatToStr(f);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.


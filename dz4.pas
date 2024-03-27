unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i,j,a,b,h,sum: Integer;
  values: Array of Integer;
  steps, v, n: Integer;
begin
  a := StrToInt(Edit1.Text);
  b := StrToInt(Edit2.Text);
  h := StrToInt(Edit3.Text);
  i := a;
  j := 1;
  steps := 0;
  v := a;
  while v <= b do begin
     steps := steps + 1;
     v := v + h;
  end;
  SetLength(values, steps);
  Memo1.Lines.add('в диапазоне от '+IntToStr(a)+' до '+IntToStr(b)+' с шагом '+IntToStr(h));
  while i <= b do begin
    values[j] := i * i;
    i := i + h;
    Memo1.Lines.add(IntToStr(values[j]));
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

end.


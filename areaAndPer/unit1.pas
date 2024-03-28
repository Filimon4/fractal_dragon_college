unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormula }

  TFormula = class(TForm)
    Ax: TEdit;
    Ay: TEdit;
    Ok: TButton;
    Cx: TEdit;
    Cy: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Area: TStaticText;
    Per: TStaticText;
    procedure AxChange(Sender: TObject);
    procedure CxChange(Sender: TObject);
    procedure OkClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure AreaClick(Sender: TObject);
  private

  public

  end;

var
  Formula: TFormula;

implementation

{$R *.lfm}

{ TFormula }

procedure TFormula.Edit1Change(Sender: TObject);
begin

end;

procedure TFormula.AxChange(Sender: TObject);
begin

end;

procedure TFormula.CxChange(Sender: TObject);
begin

end;

procedure TFormula.OkClick(Sender: TObject);
var
   x1,y1,x2,y2, h, w, perCubic, areaCubic: Integer;
begin
     x1 := StrToInt(Ax.Text);
     y1 := StrToInt(Ay.Text);
     x2 := StrToInt(Cx.Text);
     y2 := StrToInt(Cy.Text);

     w := x2 - x1;
     if w < 0 then
        w := w * (-1);
     h := y2 - y1;
     if h < 0 then
        h := h * (-1);
     perCubic := (w * 2) + (h * 2);
     areaCubic := w * h;
     Area.Caption := IntToStr(areaCubic);
     Per.Caption := IntToStr(perCubic);
end;

procedure TFormula.FormCreate(Sender: TObject);
begin

end;

procedure TFormula.Label1Click(Sender: TObject);
begin

end;

procedure TFormula.Label3Click(Sender: TObject);
begin

end;

procedure TFormula.Memo1Change(Sender: TObject);
begin

end;

procedure TFormula.AreaClick(Sender: TObject);
begin

end;

end.


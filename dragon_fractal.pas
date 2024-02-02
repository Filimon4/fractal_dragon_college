Uses GraphABC, draw_module;
var 
  Z: integer; {Glubina Fraktala}
  x,y, s:integer;
 
procedure text;
begin
  textout(10, 100, 'Left - влево');
  textout(10, 120, 'Right - вправо');
  textout(10, 140, 'Up - вверх');
  textout(10, 160, 'Down - вниз');
  textout(10, 180, 'd - crop-in');
  textout(10, 200, 's - crop-out');
  textout(10, 220, 'g - depth +');
  textout(10, 240, 'f - depth -');
end;

procedure KeyDown(key: integer);//Движ
begin
  case key of
    VK_Up: begin y := y + 50 end;
    VK_Down: begin y := y - 50 end;
    VK_Left: begin x := x + 50 end;
    VK_Right: begin x := x - 50 end;
    VK_S: begin if s>0 then s:= s-25 end;
    VK_D: begin if s<700 then s:= s+25 end;
    VK_G:
      begin
        if z <=12 then
          Z:= Z+1;
      end;
    VK_F:
      begin
        if z > 0 then
          Z:= Z-1;
      end;
  end; 
  Window.Clear;
  text;
  draw(200+x-s,300+y,500+x+s,300+y,Z);
  redraw;
end;

Begin
     SetWindowCaption('Фракталы: Кривая Дракона');
     SetWindowSize(700,512);

     ClearWindow;
     LockDrawing;
     Z:=1;
     x:=0;
     y:=0;
     draw(200+x,300+y,500+x,300+y,Z);
     text;
     redraw;
     onKeyDown += keydown;
End.
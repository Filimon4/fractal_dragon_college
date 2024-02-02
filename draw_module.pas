Unit draw_module;
Uses GraphABC;
Procedure draw(x1,y1,x2,y2,k:integer);
Var xn,yn:integer;
Begin
     If k>0 Then
     Begin
          xn := (x1+x2) div 2 + (y2-y1) div 2;
          yn := (y1+y2) div 2 - (x2-x1) div 2;

          draw(x1,y1,xn,yn,k-1);
          draw(x2,y2,xn,yn,k-1)
     End
     Else
          line(x1,y1,x2,y2)
 
End;

begin
  
end.
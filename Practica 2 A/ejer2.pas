program alcance2;{IMPRIME 3, 3 Y 1, SIGUE IMPRIMIENDO EL 3 PORQUE LO TOMA 
COMO B SIEMPRE LA PRINCIPAL VARIABLE PARA TODOS}
var a,b: integer;
procedure uno;
begin
 b := 3;
 writeln(b);
end;
begin
 a:= 1;
 b:= 2;
 uno;
 writeln(b, a);
 READLN();
end.

program Ejercicio3;
 procedure suma(var num1: integer; var num2:integer);
 	begin
 		num2 := num1 + num2;
 		num1 := 0;
 	end;
var
 	i, x : integer;
begin
 readln(x); { leo la variable x }
 for i:= 1 to 5 do
 	suma(i,x);
 writeln(x); { imprimo las variable x }
 readln();
end.

{10= 11, 13, 16, 20, 25}
{10= 10 siempre}
{10= da error porque modifica 1 y sale de la escala}

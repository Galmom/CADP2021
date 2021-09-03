program Ejercicio1_ad;
 procedure intercambio(var num1,num2 : integer);{intercambia num1 a num2, y , num2 con num1}
	 var
	 	aux : integer;
	 begin
	 	aux := num1;
	 	num1 := num2;
	 	num2 := aux;
	 end;
 procedure sumar(num1 : integer; var num2 : integer); {suma i como num1 con num2 que es num1, y lo devuelve como num2 }
	 begin
	 	num2 := num1 + num2;
	 end;
var
 	i, num1, num2 : integer;
begin
	 read(num1);
	 read(num2);
		 for i := 1 to 3 do begin
		 	intercambio(num1,num2);
		 	sumar(i,num1);
		 end;
	 writeln(num1);{primero da 11 y depues 16}
	 readln();
end.

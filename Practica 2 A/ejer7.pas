program alcanceYFunciones;
var
 suma, cant : integer;
 function calcularPromedio: real;
 	var
 		prom:real;
 	begin
 		if (cant = 0) then {cambio <> por =}
 			prom := -1
		else
 			prom := suma / cant;
 		calcularPromedio:=prom;	{se le agrega esto}
 	end;
var
	p:real;	
begin { programa principal }
	readln(suma); 
	readln(cant); 
	p:=calcularPromedio;{es mas efectivo que la funcion se llame una ves que dos ves, por eso la copiamos en una nueva variable}
if (p <> -1) then begin{usa datos globales, no se necesita ponerle los parametros}
	cant := 0;{no lo usa, es para que se rompa el programa}
	writeln('El promedio es: ' , p:3:3);
end
else
	writeln('Dividir por cero no parece ser una buena idea');
	readln();
end.
{
	1- error
	2-8
	3-8
}
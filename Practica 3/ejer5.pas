{5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.
}
program ejer;
type
	string20=string[20];

	auto=record
		marca:string20;
		modelo:string20;
		precio:real;
	end;
	procedure carga(var c:auto);
		begin
		 	writeln('Ingrese marca, modelo y precio del auto');
		 	readln(c.marca);
			 if (c.marca <> 'zzz') then begin
			 	readln(c.modelo);
			 	readln(c.precio);
			 end;
		end;

	function promedios(suma_precio:real; cant:integer):real;
		begin
			promedios:=suma_precio/cant;
		end;
		
	procedure maximo(c:auto; var max:real; var marca1, modelo1:string20);
		begin
			if (c.precio > max) then begin
				max:=c.precio;
				writeln('actualiza max ',max:4:4);
				marca1:=c.marca;
				modelo1:=c.modelo;
			end;	
		end;

var
	car:auto;
	actual, marca1, modelo1:string20;
	suma_precio, max:real;
	cant:integer;
begin
	max:=0;
	carga(car);
	actual:=car.marca;
	while (car.marca <>'zzz') and (car.marca = actual) do begin
		maximo(car, max, marca1, modelo1);
		cant:=cant+1;
		suma_precio:=suma_precio+car.precio;
		carga(car);
		if (car.marca <> actual) then begin
			writeln('El precio promedio por marca es ', promedios(suma_precio,cant):4:4);
			actual:=car.marca;
		end;
		cant:=0;
		suma_precio:=0;
	end;	
	writeln('Marca y modelo del auto mas caro es ', marca1,' y ',modelo1);
	readln();
	end.
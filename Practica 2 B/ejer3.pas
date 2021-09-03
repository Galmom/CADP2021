program ejercicio5;{ suma los números entre a y b, y retorna el resultado en c }
	procedure sumar(a, b, c : integer);
		var
		suma : integer;
		begin {i no se identifico}
		for i := a to b do { si el valor no es de menor a mayo da error}
			suma := suma + i;
			c := c + suma;
	end;
var
	result : integer;
begin
	result := 0;
	readln(a); readln(b);{a y b no se designan} 
	sumar(a, b, 0);
	write('La suma total es ',result);{ averigua si el resultado final estuvo entre 10 y 30}
	ok := (result >= 10) or (result <= 30); {falta que se hace con result o siempre es 0}
	if (not ok) then{tendria que el proceso devolver algo o result o modificar un resultado}
		write ('La suma no quedo entre 10 y 30');
	}
end.

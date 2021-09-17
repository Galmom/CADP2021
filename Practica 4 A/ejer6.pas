{6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones.
}
program ejer;
const
	max_rango=100;
type
	rango=1..max_rango;
	vector=array[rango] of integer;

	procedure carga(var v:vector; var diml:integer);
		var
			numero:integer;
		begin
			diml:=0;
			writeln('Ingrese un numero');
			readln(numero);
			while (numero <> 0) and (diml < max_rango) do begin
				diml:=diml+1;
				v[diml]:=numero;
				writeln('Ingrese un numero');
				readln(numero);
			end;
		end;

	procedure intercambiaron(v:vector; diml:integer);
		var
			i, aux:integer;
			max, min, posi_max, posi_min:integer;
		begin
			aux:=0;
			posi_min:=0;
			posi_max:=0;
			max:=-1;
			min:=999;
			for i:=1 to diml do begin
				if (v[i] > max) then begin
					max:=v[i];
					posi_max:=i;
				end;	
				if (v[i]) < min then begin
					min:=v[i];
					posi_min:=i;
				end;	
			end;	
				aux:=v[posi_max];
				v[posi_max]:=v[posi_min];
				v[posi_min]:=aux;
				write('El elemento maximo ',max,' que se encontraba en la posicion ', posi_max);
				writeln(' fue intercambiado con el elemento minimo ',min,' que se encontraba en la posicion ',posi_min);
				write('El elemento maximo ',v[posi_max],' que se encontraba en la posicion ', posi_max);
				writeln(' fue intercambiado con el elemento minimo ',v[posi_min],' que se encontraba en la posicion ',posi_min);
		end;	

	var
		v:vector;
		diml:integer;
	begin
		carga(v, diml);
		intercambiaron(v, diml);
		readln();
	end.
{5. Utilizando los módulos implementados en el ejercicio 3, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.}

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

	procedure elementoMaximo(v:vector; var max, posi_max:integer);
		var
			i:integer;
		begin
			for i:=1 to max_rango do begin
				if (v[i] > max) then begin
					max:=v[i];
					posi_max:=i;
				end;	
			end;
		end;
		
	procedure elementoMinimo(v:vector; var min1, posi_min:integer);
		var
			i:integer;
		begin
			for i:=1 to max_rango do begin
				if (v[i] < min1) then begin
					min1:=v[i];
					posi_min:=i;
				end;	
			end;
		end;	

	procedure intercambiaron(var v:vector; diml:integer);
		var
			i, aux:integer;
			min,posi_min, posi_max, max:integer;
		begin
			posi_max:=0;
			posi_min:=0;
			aux:=0;
			max:=-1;
			min:=999;
			elementoMinimo(v, min, posi_min);
			writeln(min, posi_min);
			elementoMaximo(v, max, posi_max);
			aux:=posi_max;
			posi_max:=posi_min;
			posi_min:=aux;
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

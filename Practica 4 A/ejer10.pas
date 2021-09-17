{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program eje;
const
	max300=5;
	incremento=1.15;
type
	rango=1..max300;
	vector_salario=array [rango] of real;

	procedure carga(var e:vector_salario; var dmil:integer);
		begin
			writeln('Ingrese el salario de los empleados');
			readln(e[dmil]);
			while ( e[dmil] <> 0) and (dmil < max300) do begin
				dmil:=dmil+1;
				writeln('Ingrese el salario de los empleados');
				readln(e[dmil]);				
			end;
		end;

	procedure imprimir(a:vector_salario);
		var
			i:integer;
		begin
			for i:=1 to max300 do begin
				writeln('salario ',i,' ',a[i]:4:2);
				end;
		end;

	procedure incremento_salario(var v:vector_salario; dmil:integer);
		var
			i:integer;
		begin
			i:=0;
			for i:=1 to dmil do begin
				v[i]:=v[i]*incremento;
			end;
		end;

	procedure promedio(a:vector_salario; dmil:integer; var max_promedio:real);
		var
			i:integer;
			suma:real;
		begin
			suma:=0;
			i:=0;
			for i:=1 to dmil do begin
				suma:=suma+a[i];
			end;
			max_promedio:=suma/dmil;
		end;		

	var
		empleados:vector_salario;
		dmil:integer;
		max_promedio:real;
	begin
		max_promedio:=0;
		dmil:=1;
		carga(empleados, dmil);
		incremento_salario(empleados, dmil);
		//imprimir(empleados);
		promedio(empleados, dmil, max_promedio);
		writeln('El sueldo promedio de los empleados de la empresa es, ',max_promedio:4:3);
		readln();
	end.

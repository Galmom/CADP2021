{2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.
}
program ejer;
const
	max_500=500;
type
	string20=string[20];
	rango=1..max_500;
	vector_nombre=array[rango] of string20;

procedure cargar(var vn:vector_nombre; var diml:integer);
	var
		nombre:string20;
	begin
		writeln('Ingrese el nombre del alumno');
		readln(nombre);
		while (nombre <> 'zzz') and (diml < max_500) do begin
			diml:=diml+1;
			vn[diml]:=nombre;
			writeln('Ingrese el nombre del alumno');
			readln(nombre);
		end;
	end;

	function buscar(vn:vector_nombre; diml:integer; nombre:string):integer;
		var
			i:integer;
		begin
			i:=1;
			while ( i <= diml) and (nombre <> vn[i]) do 
				i:=i+1;
				writeln(i);
			if (i > diml) then
				i:=0;
			buscar:=i;
		end;
	procedure eliminar(var vn:vector_nombre; var diml:integer; aux:integer);
		var
			i:integer;
		begin
			for i:=aux to diml do
				vn[i]:=vn[i+1];
			diml:=diml-1;	
		end;
		
	procedure insertar(var vn:vector_nombre; var diml:integer; pos:integer; nombre:string; var exito:boolean);
		var
			i:integer;
		begin
			i:=0;
			if (diml < max_500) and ((pos >= 1) and (pos <=diml)) then begin
				exito:=true;
				for i:=diml downto pos do
					vn[i+1]:=vn[i];
				vn[pos]:=nombre;
				diml:=diml+1;	
			end
			else
				exito:=false;
		end;

	procedure agregar_final(var vn:vector_nombre; var diml:integer; nombre:string);
		begin
			if (diml < max_500) then begin
				diml:=diml+1;
				vn[diml]:=nombre;
				writeln('Se ingreso correctamente');
			end
			else
				writeln('No se ingreso');	
		end;			

	var
		v_nombre:vector_nombre;
		diml, pos, aux, i:integer;
		nombre:string20;
		exito:boolean;
	begin
		aux:=0;
		diml:=1;
		pos:=0;
		cargar(v_nombre, diml);
		writeln('nombre a eliminar');
		readln(nombre);
		aux:=buscar(v_nombre,diml, nombre);
		if (aux <> 0 ) then begin
			eliminar(v_nombre, diml, aux);
			writeln('El nombre se elimino');
		end	
		else begin
			writeln('El nombre no se encontro');	
		end;
		writeln('Ingrese el nombre del alumno y la posiscion');
		readln(nombre);
		readln(pos);
		insertar(v_nombre, diml, pos, nombre, exito);
		if (exito) then
			writeln('Se ingreso bien')
		else
			writeln('No se ingreso el nombre');
		writeln('Ingrese el nombre del alumno');
		readln(nombre);	
		agregar_final(v_nombre, diml, nombre);
		// for i:=1 to diml do begin
		// 	writeln(v_nombre[i]);
		// end;
		readln();
	end.
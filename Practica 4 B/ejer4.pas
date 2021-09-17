{4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de 
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por 
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El 
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine. 
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con 
datos leídos de teclado.}

program ejer;
const
	max_1000=1000;
type
	rango=1..max_1000;
	string20=string[20];

	alumno=record
		nro_alumno:integer;
		apellido:string20;
		nombnre:string20;
		asistencia:integer;
	end;

		alu_vector=array[rango] of alumno;
{===========AAAAAAAAAAA=============================================================
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El 
alumno seguro existe.}
	procedure buscar_alumno(av:alu_vector; diml, num:integer; var pos:integer);
		var
			primero, ultimo, medio:integer;
		begin
			primero:=1;
			ultimo:=diml;
			medio:=0;
			medio:=(primero+ultimo) div 2;
			while (primero <= ultimo) and (num <> av[medio]) do begin
				if (num < av[medio]) then
					ultimo:=medio-1
				else
					ultimo:=medio+1;
				medio:=(primero+ultimo) div 2;	
			end;
			if (primero <= ultimo) then
				pos:=medio
			else
				pos:=0;	
		end;
{=================FIN DE A=========================================================}
{b. Un módulo que reciba un alumno y lo inserte en el vector.}		
	Function busca_posicion (alumno:integer; al:alu_vector; diml:integer): integer;
Var
  pos: integer;
Begin
     pos:=1;
     While (pos <=diml) AND (alumno > al[pos].nro_alumno) do begin
         pos:= pos + 1;
     end;
     busca_posicion:= pos;
End;


Procedure insertar (VAR al:alu_vector; VAR diml:integer; pos:integer; alu_nuevo:alumno);
Var
   j:integer;
Begin
     For j:= diml downto pos do begin
         al[j+1]:= al[j];
     end;
     al[pos]:= alu_nuevo;
     diml:= diml + 1;
End;


Procedure carga_nuev_alu (var info:alu_vector; var diml:integer; alu_nuevo:alumno; var  exito:boolean);
	VAR  
	  pos:integer;
	Begin  
	     If (diml < max_1000) then begin
	         pos:= busca_posicion(alu_nuevo.nro_alumno, info, diml);
	         insertar (info, diml, pos, alu_nuevo);
	         exito:=true;
	     end
	     else
	     	exito:=false;
	End;				
{==================FIN DE B=================================================================}
{c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine. }
procedure eliminar(var info:alu_vector; var diml:integer; pos:integer);
	var
		j:integer;
	begin
		j:=0;
			for j:=pos to diml-1 do
				info[j]:=info[j+1];
		diml:=diml-1;
	end;

{==================FIN DE C=================================================================}
{//e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0. }
Function busca_posicion_cero (0:integer; al:alu_vector; diml:integer): integer;
Var
  pos: integer;
Begin
     pos:=1;
     While (pos <=diml) AND (0 <> al[pos].asistencia) do begin
         pos:= pos + 1;
     end;
     busca_posicion:= pos;
End;

procedure borrar_elemento_cero(var al:alu_vector; var diml:integer; pos:integer);
	var
		j:integer;
	begin
		for j:=pos to diml-1 do
			al[j]:=al[j-1];
		diml:=diml-1;	
	end;

procedure borrar_elemento(var al:alu_vector; var diml:integer; 0:integer; var exito:boolean);
		for i:=1 to diml do begin
			pos:busca_posicion_cero(0, info, diml);
			if (pos <> 0) then begin
				borrar_elemento_cero(al, diml, pos);
				exito:=true;
				end
				else
				exito:=false;
			end;
		end;

	var
		info:alu_vector;
		actual, i, num, pos:integer;
		alu_nuevo:alumno;
		exito:boolean;
	begin
		boolean:=false;
		actual:=0;
		pos:=0;
		i:=0;
		num:=0;
		carga(info, diml)//SE DISPONE
		while (diml < max_1000) do begin
			actual:=alu_vector[diml].nro_alumno;
			while (diml < max_1000) and (alu_vector[diml].nro_alumno = actual)  do begin
				carga(info, diml)//SE DISPONE
			end;
		end;
		writeln('Ingrese el nro del alumno');
		readln(num);
		buscar_alumno(info, diml, num, pos);//Un módulo que retorne la posición del alumno con un 
		//nro de alumno recibido por parámetro. El alumno seguro existe.
		writeln('Ingrese el nuevo alumno');
		leer(alu_nuevo);
		carga_nuev_alu(info, diml, alu_nuevo, exito);// b. Un módulo que reciba un alumno y lo inserte en el vector.
		writeln('Ingrese el nro del alumno a elimina');
		readln(num);
		buscar_alumno(info, diml, num, pos)	//c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine. 
		if (pos <> 0) then begin
			eliminar(info, diml, pos);
			writeln('Se elimino correctamente');
		end
		else	
			writeln('NO SE ENCONTRO');
		borrar_elemento(info, diml, 0, exito);//e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
		if (exito) then
			writeln('SE BORRO')
		else
			writeln('NO SE BORRO');	
	end.
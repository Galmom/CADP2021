{15. La cátedra de CADP está organizando la cursada para el año 2019. Para ello, dispone de una lista con todos 
los alumnos que cursaron EPA. De cada alumno se conoce su DNI, apellido, nombre y la nota obtenida. Escribir 
un programa que procese la información de alumnos disponible y los distribuya en turnos utilizando los 
siguientes criterios:
- Los alumnos que obtuvieron al menos 8 en EPA deberán ir a los turnos 1 ó 4.
- Los alumnos que obtuvieron entre 5 y 8 deberán ir a los turnos 2, 3 ó 5.
- Los alumnos que no alcanzaron la nota 5 no se les asignará turno en CADP.
Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno.
Nota: La distribución de alumnos debe ser lo más equitativa posible.
}
program ejer;
type
	string20=string[20];

	alumno=record
		dni:integer;
		apellido:string20;
		nombre:string20;
		nota_obte:integer;
		end;
	lista=^nodo;
	
	nodo=record
		dato:alumno;
		sig:lista;
		end;	

	vector_final=array[1..6] of lista;

	vector_turno=array[1..6] of integer;

	procedure cargo_vturno(var vt:vector_turno);
		var
			i:integer;
		begin
			for i:=1 to 6 do
				vt[i]:=0;
		end;

	procedure cargo_vfinal(var vf:vector_final);
		var
			i:integer;
		begin
			for i:=1 to 6 do
				vf[i]:=nil;
		end;		

	procedure guardaradelante(var l:lista; alu:alumno);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=alu;
			nue^.sig:=l;
			l:=nue;
		end;

	procedure recorrerlista(l:lista; var vt:vector_turno; var vf:vector_final);
		var
			posicion:integer;
		begin
			posicion:=0;
			while (l <> nil) do begin
				if (l^.dato.nota_obte > 8) then begin
					if (vt[1] > vt[4]) then begin
						vt[4]:=vt[4]+1;
						posicion:=4;
						guardaradelante(vf[4], l^.dato);//MANDO EL LUGAR A LA LISTA Y EL DATO QUE ES ALUMNO
					end	
					else begin
						vt[1]:=vt[1]+1;
						posicion:=1;
						guardaradelante(vf[1], l^.dato);
					end;	
				end;
				if (l^.dato.nota_obte >= 5) and (l^.dato.nota_obte <= 8) then begin
					if (vt[2] >= vt[3]) then begin
						vt[3]:=vt[3]+1;
						posicion:=3;
						guardaradelante(vf[3], l^.dato);
					end
					else
					if (vt[2] >= vt[5]) then begin
						vt[5]:=vt[5]+1;
						posicion:=5;
						guardaradelante(vf[5], l^.dato);
					end
					else
					if (vt[3] >= vt[2]) then begin
						vt[2]:=vt[2]+1;
						posicion:=2;
						guardaradelante(vf[2], l^.dato);
					end
					else
					if (vt[3] >= vt[5]) then begin
						vt[5]:=vt[5]+1;
						posicion:=5;
						guardaradelante(vf[5], l^.dato);
					end
					else
					if (vt[5] >= vt[2]) then begin
						vt[2]:=vt[2]+1;
						posicion:=2;
						guardaradelante(vf[2], l^.dato);
					end
					else
					if (vt[5] >= vt[3]) then begin
						vt[3]:=vt[3]+1;
						posicion:=3;
						guardaradelante(vf[3], l^.dato);
					end;
				// if (l^.dato.nota_obte < 5) then	ESTO ESTA POR SI HAY QUE GUARDAR LOS QUE NO ALCANZAN
				// 	guardaradelante(vf[6], l^.dato);
				end;
				l:=l^.sig;
			end;
		end;
	procedure imprimirlistafinal(vf:vector_final);
		var
			i:integer;
		begin
			for i:=1 to 5 do begin //seria 6 si mando la lista que no alcanzan
				while (vf[i] <> nil) do begin
					writeln('la lista de alumnos es : Turno ',i,' ',vf[i]^.dato.apellido,', ',vf[i]^.dato.nombre);
					//ENTRO AL VECTOR, INDICO POSISION, Y EL TIPO DATO.
				end;
			end;
		end;

	var
		l:lista;
		vt:vector_turno;
		vf:vector_final;
	begin
		l:=nil;
		cargo_vfinal(vf);
		cargo_vturno(vt);
		//cargarlista(l); SE DISPONE IGUAL HACER LOS MODULOS??
		recorrerlista(l, vt, vf);
		imprimirlistafinal(l, vf);
		readln();
	end.
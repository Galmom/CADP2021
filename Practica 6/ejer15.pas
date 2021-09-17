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
		nota:integer;
		end;

	lista=^nodo;	

	nodo=record
		dato:alumno;
		sig:lista;
		end;

turno_vector=array[1..6] of integer;

procedure limpiarvector(var tv:turno_vector);
	var
		i:integer;
	begin
		for i:=1 to 6 do
			tv[i]:=0;
	end;

procedure insertarordenado(var t:lista; al:alumno);
	var
		ant, act, nue:lista;
	begin
		new(nue);
		nue^.dato:=al;
		act:=t;
		ant:=t;
		while (act <> nil) and (act^.dato.nota > al.nota) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (ant = act) then
			t:=nue
		else
			ant^.sig:=nue;
		nue^.sig:=act;		
	end;

procedure turno1y4(l:lista; var t1, t4:lista; var tv:turno_vector; al:alumno);
	begin
		if (tv[1] > tv[4]) then begin
					tv[4]:=tv[4]+1;
					t4^.dato:=l^.dato;
					insertarordenado(t4, al);
				end
				else
					tv[1]:=tv[1]+1;
					t1^.dato:=l^.dato;
					insertarordenado(t1, al);
	end;

procedure turno23y5(l:lista; var t2, t3, t5:lista; var tv:turno_vector; al:alumno);
		begin
			if (tv[2] > tv[3] ) then begin
					tv[3]:=tv[3]+1;
					t3^.dato:=l^.dato;
					insertarordenado(t3, al);
				end	
				else
					if (tv[2] > tv[5]) then begin
						tv[5]:=tv[5]+1;
						t5^.dato:=l^.dato;
						insertarordenado(t5, al);
					end;
					if (tv[3] > tv[2] ) then begin
					tv[2]:=tv[2]+1;
					t2^.dato:=l^.dato;
					insertarordenado(t2, al);
				end	
				else
					if (tv[3] > tv[5]) then begin
						tv[5]:=tv[5]+1;
						t5^.dato:=l^.dato;
						insertarordenado(t5, al);
					end;
					if (tv[5] > tv[3] ) then begin
					tv[3]:=tv[3]+1;
					t3^.dato:=l^.dato;
					insertarordenado(t3, al);
				end	
				else
					if (tv[5] > tv[2]) then begin
						tv[2]:=tv[2]+1;
						t5^.dato:=l^.dato;	
						insertarordenado(t5, al);					
				end
				else
					if (tv[2] = tv[5]) or (tv[3] = tv[5]) or (tv[3] = tv[2]) then begin
						tv[2]:=tv[2]+1;
						t2^.dato:=l^.dato;
						insertarordenado(t2, al);
					end;	
		end;

procedure recorrerlista(var l, t1, t2, t3, t4, t5, t6:lista; var tv:turno_vector; al:alumno);
	begin
		while (l <> nil) do begin
			if (l^.dato.nota > 8) then
				turno1y4(l, t1, t4, tv, al);
			if (l^.dato.nota >=5) and (l^.dato.nota <=8) then
				turno23y5(l, t2, t3, t5, tv, al);		
			if (l^.dato.nota < 5) then begin
				t6^.dato:=l^.dato;
				insertarordenado(t6, al);
			end;	
			l:=l^.sig;	
		end;	
	end;
	procedure imprimir(l:lista; i:integer);
		begin
			while (l <> nil) do begin
				writeln('El turno ',i,' ',l^.dato.apellido);
			end;
		end;

	var
		l,t1, t2, t3, t4, t5, t6:lista;
		tv:turno_vector;
		al:alumno;
		i:integer;
	begin
		//cargar(l); SE DISPONE
		limpiarvector(tv);
		recorrerlista(l, t1, t2, t3, t4, t5, t6, tv,al);
		for i:=1 to 6 do begin
		 if (i = 1) then
		 	imprimir(t1, i);
		 if (i = 2) then
		 	imprimir(t2, i);
		 if (i = 3) then
		 	imprimir(t3, i);
		 if (i = 4) then
		 	imprimir(t4, i);
		 if (i = 5) then
		 	imprimir(t5, i);
		 if (i = 6) then
		 	imprimir(t6, i);		
		end;
		readln();
	end.
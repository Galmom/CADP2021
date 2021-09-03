program ejer;
		function vocales(A:char):boolean;
			begin
				{vocales:= ((A='a') or (A='e') or (A='i') or (A='o') or (A='u')); otra opcion que no me sirve aca}
				if (A ='a') or (A ='e') or (A ='i') or (A ='o') or (A ='u') then
					vocales:=true
				else
					vocales:=false;	
			end;
		// function no_vocales(B:char):boolean;
		// 	begin
		// 		if (B <> 'a') or (B <> 'e') or (B <> 'i') or (B <> 'o') or (B <> 'u') then
		// 			no_vocales:=false
		// 		else
		// 			no_vocales:=true;//PORQUE NO FUNCIONA ASI? ABAJO ESTA EN TRUE *
		// 		if (B ='a') or (B ='e') or (B ='i') or (B ='o') or (B ='u') then
		// 			no_vocales:=false
		// 		else
		// 			no_vocales:=true;	
		// 	end;	
	procedure secuencia_1(var ok:boolean; var A:char);
		begin
			ok:=false;
			writeln('Ingrese solo una vocal');
			readln(A);
			ok:=vocales(A);
			while (ok = true) do begin
				writeln('Ingrese solo una vocal');
				readln(A);
				if (A = '$') then begin
					writeln('Termino la secuencia A por $, sigue la otra secuencia B');
					ok:=false;
				end
				else if (A <> '$') and (vocales(A) = false) then begin 
					writeln('Fallo la secuencia, es una no vocal');
					ok:=false;
				end;	
			end;
		end;{fin pro se1}

	procedure secuencia_2(ok:boolean);
		var
			B:char;
		begin
			writeln('Ingrese solo NO vocales');
			readln(B);
			ok:=not vocales(B);
			while (ok = true) do begin
				writeln('Ingrese solo una NO vocal');
				readln(B);
				if (B = '#') then begin
					writeln('Se completo la secuencia, finalizo con #');
					ok:=false;
				end
				else if (B <> '#') and (not vocales(B) = false) then begin	//TRUE*
					writeln('Fallo la secuencia, es UNA vocal');
					ok:=false;
				end;	
			end;	
		end;

	var
		ok:boolean;
		A:char;
	begin
		ok:=false;
		secuencia_1(ok, A);
		if (A = '$') then
			secuencia_2(ok);			
		readln();
	end.
program ejer;

function peso(A:char):boolean;
	var
		ok:boolean;
	begin
		if (A <> '$') then
			ok:=true
		else
			ok:=false;
		peso:=ok;	
	end;

procedure secuencia_1(var verifica:boolean; var cant:integer);
	var
		A:char;
	begin
		writeln('Ingrese un caracter');
		readln(A);
		while (A <> '%') and (verifica) do begin
			cant:=cant+1;
			writeln('Ingrese un caracter');
			readln(A);
		end;	
	end;

procedure secuencia_2(cant:integer; var B:char);
	var
		cant2, arroa:integer;
	begin
		arroa:=0;
		cant2:=0;
		writeln('Ingrese un caracter');
		readln(B);
		while (B <> '*') and (cant2 <= cant) and (arroa <= 3) do begin
			cant2:=cant2+1;
			if (B = '@') then	
				arroa:=arroa+1;	
			writeln('Ingrese un caracter');
			readln(B);
		end;
	end;

var
	verifica:boolean;
	cant:integer;
	B:char;
begin
	cant:=0;
	verifica:=true;
	secuencia_1(verifica, cant);
	writeln(cant);
	if (verifica) then begin
		secuencia_2(cant, B);
		if (B = '*') then
			writeln('La secuencia se cumplio')
		else
			writeln('B no cumplio');
	end	
	else
		writeln('A no cumplio');	
	readln();
	end.
{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.}
	procedure imprime_vector(var v:vector; var dimL:integer);
		var
			i:integer;
		begin
			i:=0;
			for i=dimL to dimF do begin
				dimL:=dimL+1;
				writeln(v[i]);
			end;
		end;

{b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.}
	procedure imprime_inverso(var v:vector; var dimL:integer);
		var
			i:integer;
		begin
			i:=dimF;
			for i=dimF downto 1 do begin
				writeln(v[i]);
			end;
		end;

{c) Realizar un módulo que imprima el vector desde la mitad () hacia la primera posición, y
desde la mitad más uno hacia la última posición.}
	procedure imprime_mitad(var v:vector; var dimL:integer);
		var
			i:integer;
		begin
			dimL:=dimL DIV 2;
			i:=dim;
			for i=dimL downto 1 do begin
				writeln(v[i]);
			end;
			for i=dimL+1 to dimF do begin
				writeln(v[i]);
			end;
		end;

{d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.}
	procedure posicion(var v:vector; x,y:integer);
		var
			i:integer;
		begin
			i:=0;
			if (y<=x) and x<=dimL then begin
				for i:=x downto y do begin
					writeln(v[i]);
				end;
			end
			else begin
				for i:=x to y do begin
					writeln(v[i]);
				end;
			end;
		end;


e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.




//OPCION 2 - recorre la lista tambien hasta encontrar el ultimo elemento (no usa variable anterior)

procedure agregarAtrasVersion2(var L: lista; v: integer);  //recorre toda la lista IZQUIERDA
var
        NUE, act : lista;
begin
        new(NUE);
        NUE^.num := v;
        NUE^.sig := nil;
        if (l <> nil) then begin
            act:=l;
            while (act^.sig <> nil) do
                act:=act^.sig;
            act^.sig:=NUE;
        end
        else
            l:=NUE;
end;


// OPCION 3 - con puntero al ultimo elemento
ESTA ESTA EN LA PRACTICA
procedure agregarAtras(var l: lista; var ult: lista; dato: integer);
var
    nue:lista;
begin
	new(nue);
	nue^.dato := dato;
	nue^.sig := nil;
	if (l <> nil) then
		ult^.sig := nue;
	else
		l := nue;		
	ult := nue;	
end;


// AGREGAR AL FINAL EN UNA LISTA

// OPCION 1 - recorre la lista para encontrar el ultimo elemento

procedure agregarAtras(var l:lista; dato: integer);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.dato := dato;
	ant := l;
	act := l;
	while (act <> nil) do begin
		ant := act;
		act := act^.sig;
	end;
	if (ant = act) then
		l := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;

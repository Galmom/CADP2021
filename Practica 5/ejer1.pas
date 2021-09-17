program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena;
begin
	writeln(sizeof(pc), ' bytes'); //4 a la direccion
	new(pc);
	writeln(sizeof(pc), ' bytes'); //4 +51 a la direccion
	pc^:= 'un nuevo nombre';
	writeln(sizeof(pc), ' bytes');//4 +51 a la direccion
	writeln(sizeof(pc^), ' bytes');//51 el contenido de esa direccion
	pc^:= 'otro nuevo nombre distinto al anterior';
	writeln(sizeof(pc^), ' bytes');//51 el contenido de esa direccion
	readln();
end.

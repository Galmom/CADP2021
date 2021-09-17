{5) De acuerdo a los valores de la tabla que indica la cantidad de bytes que ocupa la representación
interna de cada tipo de dato en Pascal, calcular el tamaño de memoria en los puntos señalados a partir
de(I), suponiendo que las variables del programa ya están declaradas y se cuenta con 400.000 bytes
libres. Justificar mediante prueba de escritorio.}
Program Alocacion_Dinamica;
Type
TEmpleado = record
sucursal: char;
apellido: string[25];
correoElectrónico: string[40];
sueldo: real;
end;
Str50 = string[50];
Var
alguien: TEmpleado; 72
PtrEmpleado: ^TEmpleado; 4
Begin 72 + 4 - 400000 = 399.924 
{Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}
Readln( alguien.apellido ); no modifica nada
{Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)}
New( PtrEmpleado ); 399.924 -72 = 399.852 por los 72 que se crea en m.dinamica
{¿Cuánta memoria disponible hay ahora? (III)} no modifica nada
Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );
Readln( PtrEmpleado^.correoElectrónico, PtrEmpleado^.sueldo );
{¿Cuánta memoria disponible hay ahora? (IV)}
Dispose( PtrEmpleado );399.852 +72 = 399.924 libera 72 del new 
{¿Cuánta memoria disponible hay ahora? (V)}
end.
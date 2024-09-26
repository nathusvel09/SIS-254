% Definir la matriz mal condicionada A
A = [1.0001, 0.9999, 1.0000;
     0.9999, 1.0001, 1.0000;
     1.0000, 1.0000, 0.9999];

% Definir el vector b
b = [3; 3; 3];

% Mostrar la matriz A
disp('Matriz mal condicionada A:');
disp(A);

% Mostrar el vector b
disp('Vector b:');
disp(b);

% Calcular el determinante de A
det_A = det(A);
disp('Determinante de A:');
disp(det_A);

% Calcular la matriz inversa de A
inv_A = inv(A)*b;
disp('Inversa de A:');
disp(inv_A);

% Calcular el número de condición de A
cond_A = cond(A);
disp('Número de condición de A:');
disp(cond_A);

disp('----------------------------------');
% Realizar un pequeño cambio en un elemento de la matriz
A_cambiada = [1.0001, 0.9999, 1.0000;
              0.9999, 1.0000, 1.0001;%cambios en el tercer numero
              1.0000, 1.0001, 0.9999];%cambios en el segundo numero
disp('Matriz A cambiada:');
disp(A_cambiada);

% Calcular el determinante de la matriz cambiada
det_A_cambiada = det(A_cambiada);
disp('Determinante de la matriz A cambiada:');
disp(det_A_cambiada);

% Calcular la matriz inversa de A
inv_A_cambiada = inv(A_cambiada)*b;
disp('Inversa de A:');
disp(inv_A_cambiada);

% Calcular el número de condición de la matriz cambiada
cond_A_cambiada = cond(A_cambiada);
disp('Número de condición de A cambiada:');
disp(cond_A_cambiada);




% Definir la matriz (A)
a = [  0.52, 0.20, 0.25; 0.30, 0.50, 0.20; 0.18, 0.30, 0.55];
% Definir el vector de las cantidades requeridas (b)
b = [4800; 5810; 5690];
% Resolver el sistema de ecuaciones
x = inv(a)*b;
x1 = a \ b;


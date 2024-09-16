% Método de Jacobi
% llenado de matriz
A = [0.52, 0.20, 0.25;
     0.30, 0.50, 0.20;
     0.18, 0.30, 0.55];

% Vector de resultados (arena, grano fino y grano grueso)
b = [4800;
     5810;
     5690];

% Inicialización de los vectores de soluciones
x = zeros(3, 1);
prevX = x;

% Parámetros de convergencia
tolerance = 1e-5;
maxIterations = 1000;

% Método de Jacobi
for iter = 1:maxIterations
    prevX = x;
    x(1) = (b(1) - A(1,2) * prevX(2) - A(1,3) * prevX(3)) / A(1,1);
    x(2) = (b(2) - A(2,1) * prevX(1) - A(2,3) * prevX(3)) / A(2,2);
    x(3) = (b(3) - A(3,1) * prevX(1) - A(3,2) * prevX(2)) / A(3,3);
    if max(abs(x - prevX)) < tolerance
        break;
    end
end



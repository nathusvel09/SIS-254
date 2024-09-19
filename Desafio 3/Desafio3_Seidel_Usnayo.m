% Matriz de coeficientes
A = [0.52 0.20 0.25; 0.30 0.50 0.20; 0.18 0.30 0.55];
% Vector de términos independientes
b = [4800; 5810; 5690];
% Parámetros
tolerancia = 1e-6;
max_iter = 100;
% Inicializar las variables (solución inicial)
x1 = 0; x2 = 0; x3 = 0;
x1_prev = x1; x2_prev = x2; x3_prev = x3; % Para comparar el error
for k = 1:max_iter   % Iniciar el ciclo iterativo de Gauss-Seidel
    % Actualización de cada variable según Gauss-Seidel
    x1 = (b(1) - A(1,2)*x2 - A(1,3)*x3) / A(1,1);
    x2 = (b(2) - A(2,1)*x1 - A(2,3)*x3) / A(2,2);
    x3 = (b(3) - A(3,1)*x1 - A(3,2)*x2) / A(3,3);
    % Calcular el error (diferencia máxima entre iteraciones consecutivas)
    error = max([abs(x1 - x1_prev), abs(x2 - x2_prev), abs(x3 - x3_prev)]);
    % Actualizar los valores anteriores
    x1_prev = x1; x2_prev = x2; x3_prev = x3;
    % Verificar la convergencia
    if error < tolerancia
        disp(['Convergencia alcanzada en iteración: ', num2str(k)]);
        break;
    end
end
% Mostrar el resultado final
disp('La cantidad de metros cúbicos a transportar desde cada cantera es:');
disp(['Cantera 1: ', num2str(x1)]);
disp(['Cantera 2: ', num2str(x2)]);
disp(['Cantera 3: ', num2str(x3)]);


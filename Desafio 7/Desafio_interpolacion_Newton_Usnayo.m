% Datos de altitudes en pies y temperaturas en grados Fahrenheit
h = [-1000, 0, 3000, 8000, 15000, 22000, 28000]; % Altitudes en pies
T = [213.9, 212, 206.2, 196.2, 184.4, 172.6, 163.1]; % Temperaturas de ebullición

% Definir el número de puntos de interpolación
n = length(h);
function div_diffs = diferencias_divididas(h, T)
  n = length(h);
  div_diffs = zeros(n, n);  % Crear matriz de diferencias divididas
  div_diffs(:,1) = T(:);    % Primera columna son los valores de T

  for j = 2:n
    for i = 1:(n-j+1)
      div_diffs(i,j) = (div_diffs(i+1,j-1) - div_diffs(i,j-1)) / (h(i+j-1) - h(i));
    end
  end
end
function P = newton_interpol(h, T, x)
  n = length(h);
  div_diffs = diferencias_divididas(h, T);  % Obtener las diferencias divididas

  % Calcular el polinomio de Newton
  P = div_diffs(1,1);  % Primer término
  producto = 1;        % Inicializar el producto acumulado

  for i = 2:n
    producto = producto * (x - h(i-1));  % Producto (x - h_0)(x - h_1)...(x - h_(i-1))
    P = P + div_diffs(1,i) * producto;   % Agregar siguiente término del polinomio
  end
end
% Altitudes en pies de La Paz y El Alto
h_lapaz = 11942,84; % La Paz en pies
h_elalto = 13615,15; % El Alto en pies

% Calcular la temperatura de ebullición usando interpolación de Newton
T_lapaz = newton_interpol(h, T, h_lapaz);
T_elalto = newton_interpol(h, T, h_elalto);

% Mostrar los resultados
printf("La temperatura de ebullición en La Paz es: %.2f °F\n", T_lapaz);
printf("La temperatura de ebullición en El Alto es: %.2f °F\n", T_elalto);


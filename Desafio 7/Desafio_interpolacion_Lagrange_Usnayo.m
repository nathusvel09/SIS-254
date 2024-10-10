% Datos de altitudes en pies y temperaturas en grados Fahrenheit
h = [-1000, 0, 3000, 8000, 15000, 22000, 28000]; % Altitudes en pies
T = [213.9, 212, 206.2, 196.2, 184.4, 172.6, 163.1]; % Temperaturas de ebullición

% Definir el número de puntos de interpolación
n = length(h);

function P = lagrange_interpol(h, T, x)
  n = length(h);
  P = 0;
  for i = 1:n
    L = 1;
    for j = 1:n
      if i != j
        L = L * (x - h(j)) / (h(i) - h(j));
      end
    end
    P = P + T(i) * L;
  end
end

% Altitudes en pies de La Paz y El Alto
h_lapaz = 11942,84; % La Paz en pies
h_elalto = 13615,15; % El Alto en pies

% Calcular la temperatura de ebullición usando interpolación de Lagrange
T_lapaz = lagrange_interpol(h, T, h_lapaz);
T_elalto = lagrange_interpol(h, T, h_elalto);

% Mostrar los resultados
printf("La temperatura de ebullición en La Paz es: %.2f °F\n", T_lapaz);
printf("La temperatura de ebullición en El Alto es: %.2f °F\n", T_elalto);


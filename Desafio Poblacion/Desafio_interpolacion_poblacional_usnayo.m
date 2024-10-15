% Datos de la población
anios = [1990, 2000, 2010, 2015, 2018, 2020, 2023];
poblacion = [5.3, 6.0, 6.7, 7.0, 7.4, 7.8, 8.0];
function coef = diferencias_divididas(x, y)
    n = length(y);
    coef = y;
    for j = 2:n
        for i = n:-1:j
            coef(i) = (coef(i) - coef(i-1)) / (x(i) - x(i-j+1));
        end
    end
end

function p = polinomio_newton(coef, x_data, x)
    n = length(coef);
    p = coef(n);
    for k = n-1:-1:1
        p = coef(k) + (x - x_data(k)) * p;
    end
end

% Calcular coeficientes de diferencias divididas
coef_newton = diferencias_divididas(anios, poblacion);

% Estimar la población para el año 2024
estimacion_newton = polinomio_newton(coef_newton, anios, 2024);
fprintf('Estimación de Newton para 2024: %.2f millones\n', estimacion_newton);
%----------------------------------------------------------------------------------------
function L = lagrange_interpolacion(x_data, y_data, x)
    n = length(x_data);
    L = 0;
    for i = 1:n
        term = y_data(i);
        for j = 1:n
            if j != i
                term = term * (x - x_data(j)) / (x_data(i) - x_data(j));
            end
        end
        L = L + term;
    end
end

% Estimar la población para el año 2024
estimacion_lagrange = lagrange_interpolacion(anios, poblacion, 2024);
fprintf('Estimación de Lagrange para 2024: %.2f millones\n', estimacion_lagrange);
%----------------------------------------------------------------------------------------
% Datos del INE para 2024
dato_ine_2024 = 8.2;

% Calcular errores relativos
error_newton = abs(estimacion_newton - dato_ine_2024) / dato_ine_2024 * 100;
error_lagrange = abs(estimacion_lagrange - dato_ine_2024) / dato_ine_2024 * 100;

fprintf('Error relativo de Newton: %.2f%%\n', error_newton);
fprintf('Error relativo de Lagrange: %.2f%%\n', error_lagrange);



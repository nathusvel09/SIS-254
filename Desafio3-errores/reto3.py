import math

def taylor_series_exponential(x, n_terms):
    taylor_sum = 0
    for n in range(n_terms):
        taylor_sum += x**n / math.factorial(n)
    return taylor_sum

def error_lagrange(x, n_terms):
    # Supongamos el peor caso donde c = x
    c = x
    error = (math.exp(c) * x**(n_terms+1)) / math.factorial(n_terms+1)
    return error


x = 1  
n_terms = 3  

approximation = taylor_series_exponential(x, n_terms)
exact_value = math.exp(x)
error = error_lagrange(x, n_terms)

print(f"Aproximación usando la serie de Taylor: {approximation}")
print(f"Valor exacto usando math.exp(): {exact_value}")
print(f"Error estimado usando el término de Lagrange: {error}")
print(f"Error real: {abs(approximation - exact_value)}")
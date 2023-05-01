f = @(x)exp(-(x.^2/2));
a = 0;
b = 0.212;
eps = 0.001;
digits = get_fract_digits(eps);
I_prev = calc_I(f, a, b, 2);
I = calc_I(f, a, b, 4);
n = 4;
while abs(I - I_prev) / 15 > eps
    I_prev = I;
    n = n + 2;
    I = calc_I(f, a, b, n);
end
disp(round(I, digits));
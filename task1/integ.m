f = gather_func('Введите подынтегральную функцию: ', 'x');
[a, b] = get_int_limits();
% a = 0;
% b = 0.212;
while true
    eps = get_double('Введите точность интегрирования: ');
    if eps <= 0
        disp('Точность должна быть натуральным числом');
    else
        break
    end
end
% eps = 0.001;
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
x = linspace(a - (b - a) / 10, b + (b - a) / 10);
hold on
plot(x, f(x));
plot(xline(a));
plot(xline(b));
hold off
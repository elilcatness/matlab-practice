function I = calc_I(f, a, b, n)
h = (b - a) / n;
x = a:h:b;
sum_even = 0;
sum_odd = 0;
for i = 3:2:length(x) - 2
    sum_even = sum_even + f(x(i));
end
for i = 2:2:length(x) - 1
    sum_odd = sum_odd + f(x(i));
end
I = h / 3 * (f(x(1)) + f(x(length(x))) + 2 * sum_even + 4 * sum_odd);
function digits = get_fract_digits(num)
digits = 0;
while num < 1
    num = num * 10;
    digits = digits + 1;
end
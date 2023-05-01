function coefs = get_poly_coefs(args, vals)
coefs = zeros(1, length(args));
coefs(1) = vals(1);
for i = 2:length(args)
    prod = 1;
    sum = coefs(1);
    for j = 1:i - 2
        prod = prod * (args(i) - args(j));
        sum = sum + coefs(j + 1) * prod;
    end
    coefs(i) = (vals(i) - sum) / (prod * (args(i) - args(i - 1)));
end
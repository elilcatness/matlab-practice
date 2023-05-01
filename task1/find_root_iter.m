function t1 = find_root_iter(phi, dphi, a, b, eps)
if dphi(a) < 1
    t0 = a;
elseif dphi(b) < 1
    t0 = b;
else
    return
end
dif = Inf;
while dif > eps
   t1 = phi(t0);
   dif = abs(t1 - t0);
   t0 = t1;
end
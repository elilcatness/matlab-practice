function [phi, phi_coefs] = get_phi_func(coefs, x_str)
phi_coefs = coefs(:);
d = coefs(length(coefs) - 1);
phi_str = '';
for i = 1:length(coefs)
   if i == length(coefs) - 1
       phi_coefs(i) = 0;
       continue
   end
   phi_coefs(i) = -coefs(i) / d;
   if phi_coefs(i) > 0
       phi_str = [phi_str '+' num2str(phi_coefs(i)) '*' x_str '^' num2str(length(coefs) - i)];
   elseif phi_coefs(i) < 0
       phi_str = [phi_str num2str(phi_coefs(i)) '*' x_str '^' num2str(length(coefs) - i)];
   end
end
phi = eval(['@(' x_str ')' phi_str]);
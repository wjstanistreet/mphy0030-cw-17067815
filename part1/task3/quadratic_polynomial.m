function qpOut = quadratic_polynomial(a, x)
% 
% quadratic_polynomial computes a 2nd degree multivariate polynomial.
% 
% --- Inputs ---
% 
% a         -  Input parameter vector
%              𝐚 = [𝑎0,𝑎1,𝑎2,𝑎3,𝑎4,𝑎5,𝑎6,𝑎7,𝑎8,𝑎9]𝑇
% x         -  Variable vector
%              𝐱 = [𝑥1,𝑥2,𝑥3]𝑇
% --- Output ---
% 
% qpOut     - Scalar quadratic polynomial output
%             𝑓(𝐱)=𝑎1𝑥1^2+𝑎2𝑥2^2+𝑎3𝑥3^2+𝑎4𝑥1𝑥2+𝑎5𝑥1𝑥3+𝑎6𝑥2𝑥3+𝑎7𝑥1+𝑎8𝑥2+𝑎9𝑥3+𝑎0
%
% As Matlab indexes at 1, the first value of a, a0, is indexed as a(1)
qpOut = a(2)*x(1)^2+ a(3)*x(2)^2+ a(4)*x(3)^3+ a(5)*x(1)*x(2)+...
        a(6)*x(1)*x(3)+ a(7)*x(2)*x(3)+ a(8)*x(1)+ a(9)*x(2)+...
        a(10)*x(3)+ a(1);

end
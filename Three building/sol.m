function point = sol(planefunction,P4,P5)

syms t
line = P4 + t*(P5-P4);

syms x y z
P = [x,y,z];

newfunction = subs(planefunction, P, line);
t0 = solve(newfunction);
point = subs(line, t, t0);



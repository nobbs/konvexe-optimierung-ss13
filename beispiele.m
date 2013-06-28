g = @(x) 1/4 * ((2*x(1) + 2*x(2) - 2)^2 + (x(2) - x(1) + 1)^2);
dg = @(x) 1/4 * [
	4*(2*x(1) + 2*x(2) - 2) - 2*(x(2) - x(1) + 1);
	4*(2*x(1) + 2*x(2) - 2) + 2*(x(2) - x(1) + 1)
];
ddg = @(x) 1/4 * [ 10, 6; 6, 10];

h = @(x) 100*(x(2)-x(1)^2)^2+(1-x(1))^2;
dh = @(x) [
	2*(200*x(1)^3-200*x(1)*x(2)+x(1)-1);
	200*(x(2)-x(1)^2)
];
ddh = @(x) [
    1200*x(1)^2-400*x(2)+2, -400*x(1);
    -400*x(1), 200
];
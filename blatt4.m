%%% Quadratische Funktion
%% gegeben
f = @(x) 1/4 * ((2*x(1) + 2*x(2) - 2)^2 + (x(2) - x(1) + 1)^2);
gradf = @(x) 1/4 * [
	4*(2*x(1) + 2*x(2) - 2) - 2*(x(2) - x(1) + 1);
	4*(2*x(1) + 2*x(2) - 2) + 2*(x(2) - x(1) + 1)
];
sigma_   = 1e-4;
beta_    = 1/2;
eps_ = 1e-4;
x0      = [0; 0];

%% Gradientenverfahren ausführen
[Xk, tk] = gradientenverfahren(f, gradf, x0, sigma_, beta_, eps_);

%% Plots erstellen
T = [-2:0.1:2];
[X, Y] = meshgrid(T, T);
Z = arrayfun(@(x1, x2) f([x1,x2]), X, Y);

%% 1) Höhenlinienplot mit Punkten
figure();
contour(X,Y,Z,20);
hold on;
plot(Xk(1,:), Xk(2,:), '-rx');
title('Quadratische Funktion - Höhenlinien und Iterationspfad');
xlabel('x1');
ylabel('x2');
hold off;

%% 2) Fehlerplot
figure();
norms = zeros(1, size(Xk,2));
for k = 1:size(Xk,2)
	norms(k) = norm(Xk(:,k) - [1;0], 2);
end
semilogy(norms);
title('Quadratische Funktion - Fehlerplot');
xlabel('k');
ylabel('Fehler');

%% 3) Funktionalfehler
figure();
ferrors = arrayfun(@(x1, x2) f([x1,x2]), Xk(1,:), Xk(2,:)) - repmat(f([1;0]), 1, size(Xk,2));
semilogy(ferrors);
title('Quadratische Funktion - Funktionalfehler')
xlabel('k');
ylabel('Fehler');

%% 4) Schrittweiten
figure();
semilogy(tk);
title('Quadratische Funktion - Schrittweiten')
xlabel('k');
ylabel('Schrittweite');


%%% Rosenbrock Funktion
clear;
%% gegeben
f = @(x) 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;

gradf = @(x) [
	2*(200*x(1)^3 - 200 * x(1)* x(2) + x(1) - 1);
	200*(x(2) - x(1)^2)
];

sigma_ = 1e-4;
beta_ = 1/2;
eps_ = 1e-4;
x0 = [0; 0];

%% Gradientenverfahren ausführen
[Xk, tk] = gradientenverfahren(f, gradf, x0, sigma_, beta_, eps_);

%% Plots erstellen
T = [-2:0.1:2];
[X, Y] = meshgrid(T, T);
Z = arrayfun(@(x1, x2) f([x1,x2]), X, Y);

%% 1) Höhenlinienplot mit Punkten
figure();
contour(X,Y,Z,20);
hold on;
plot(Xk(1,:), Xk(2,:), '-rx');
title('Rosenbrock - Höhenlinien und Iterationspfad');
xlabel('x1');
ylabel('x2');
hold off;

%% 2) Fehlerplot
figure();
norms = zeros(1, size(Xk,2));
for k = 1:size(Xk,2)
	norms(k) = norm(Xk(:,k) - [1;1], 2);
end
semilogy(norms);
title('Rosenbrock - Fehlerplot');
xlabel('k');
ylabel('Fehler');

%% 3) Funktionalfehler
figure();
ferrors = arrayfun(@(x1, x2) f([x1,x2]), Xk(1,:), Xk(2,:)) - repmat(f([1;1]), 1, size(Xk,2));
semilogy(ferrors);
title('Rosenbrock - Funktionalfehler')
xlabel('k');
ylabel('Fehler');

%% 4) Schrittweiten
figure();
semilogy(tk);
title('Rosenbrock - Schrittweiten')
xlabel('k');
ylabel('Schrittweite');

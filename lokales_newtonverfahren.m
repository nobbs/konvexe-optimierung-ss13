function [outputs] = lokales_newtonverfahren(f, df, ddf, x0)
	% Genauigkeit
	eps_ = 1e-8;

	x = [x0];
	xk = x(:, end);

	% Newton-Verfahren wiederholt ausführen
	while (norm(df(xk)) > eps_)
		xk = x(:, end);
		d = - ddf(xk) \ df(xk);
		x(:, end + 1) = xk + d;
	end

	outputs = x;
end

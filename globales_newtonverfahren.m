function [outputs] = globales_newtownverfahren(f, df, ddf, x0)
    % Genauigkeit
    eps_ = 1e-6;

    % Konstanten
    rho_ = 1;           % > 0
    beta_ = 0.85;       % 0 < beta_ < 1
    sigma_ = 0.25;      % 0 < sigma_ < 1, gut: < 1/2
    p = 3;              % > 1, gut: > 2

    x = [x0];
    xk = x(:, end);

    while (norm(df(xk)) > eps_)
        % vorberechnen und speichern
        xk = x(:, end);
        dfx = df(xk);
        ddfx = ddf(xk);

        % Abstiegsrichtung mittels Newton-Verfahren oder steilsten Abstieg
        if det(ddfx) == 0 or dot(dfx, dk) > - rho_ * norm(dk,2)^p
            dk = - dfx;
        else
            dk = - ddfx \ dfx;
        end

        % Nächste Schrittweite bestimmen mittels Armijo-Regel
        tl = 1;
        while f(xk + tl * dk) > f(xk) + sigma_ * tl * dot(df(xk), dk)
           tl = tl*beta_;
        end

        % Schritt durchführen
        x(:, end + 1) = xk + tl * dk;
    end

    outputs = x;
end

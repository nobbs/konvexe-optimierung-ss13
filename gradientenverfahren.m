function [ x, t ] = gradientenverfahren( f, gradf, x0, sigma_, beta_, eps_ )
    % Gradientenverfahren wie in Algorithmus 4.21 beschrieben.
    x = [x0];
    t = [];
    xk = x(:, end);

    % Abbruchbedingung
    while (norm(gradf(xk), 2) > eps_)
        xk = x(:, end);
        dk = -gradf(xk);

        % Nächste Schrittweite bestimmen mittels Armijo-Regel
        l = 0;
        tl = 1;
        while ( f(xk + tl * dk) > f(xk) - sigma_ * tl * norm(gradf(xk),2)^2 )
           l = l+1;
           tl = beta_^l;
        end

        % Schritt durchführen
        x(:, end + 1) = xk +  tl * dk;
        t(end + 1) =  tl;
    end
end


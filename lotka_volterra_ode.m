function dydt = lotka_volterra_ode(t, y, alpha, betta, c, d)
  dydt = zeros(2, 1);
  dydt(1) = (alpha - c * y(2)) * y(1);
  dydt(2) = (-betta + d * y(1)) * y(2);
end

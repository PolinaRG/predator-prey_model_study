alpha = 5;
betta = 0.5;
c = 0.5;
d = 0.01;
y0 = [betta / d * 0.8, alpha / c * 1.2];

study_lotka_volterra_model(alpha, betta, c, d, 30, y0)

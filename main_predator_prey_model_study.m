alpha = 5;
betta = 0.5;
c = 0.5;
d = 0.01;
y0 = [betta / d * 0.8, alpha / c * 1.2];

study_lotka_volterra_model(alpha, betta, c, d, 30, y0)
plot_phase_space_for_lv_model(alpha, betta, c, d, round([betta / d, alpha / c] * 0.1), 30, 5)

% numerical experiment with parameters proposed on https://en.wikipedia.org/wiki/Lotka-Volterra_equations
##alpha = 1.1;
##betta = 0.4;
##c = 0.4;
##d = 0.1;
##
##study_lotka_volterra_model(alpha, betta, c, d, 100, [10, 10])

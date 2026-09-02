alpha = 5;
betta = 0.5;
c = 0.5;
d = 0.01;

n_years = 30;

steady_state = [betta / d, alpha / c];

y0 = steady_state .* [0.8, 1.2];

study_lotka_volterra_model(alpha, betta, c, d, n_years, y0)
plot_phase_space_for_lv_model(alpha, betta, c, d, round(steady_state * 0.1), n_years, 5)

% numerical experiment with parameters proposed on https://en.wikipedia.org/wiki/Lotka-Volterra_equations
##alpha = 1.1;
##betta = 0.4;
##c = 0.4;
##d = 0.1;
##
##study_lotka_volterra_model(alpha, betta, c, d, 100, [10, 10])

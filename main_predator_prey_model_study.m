model.alpha = 5;
model.betta = 0.5;
model.c = 0.5;
model.d = 0.005;

n_years = 30;

steady_state = [model.betta / model.d, model.alpha / model.c];

y0 = steady_state .* [0.8, 1.2];

palette = containers.Map({'prey', 'predator', 'prey_steady_state', 'predator_steady_state'}, {'#2BB735', '#0135E7', '#FEAB12', '#FF0000'});

study_lotka_volterra_model(model, n_years, y0, palette)
plot_phase_space_for_lv_model(model, [10, 5], n_years, 5)

% numerical experiment with parameters proposed on https://en.wikipedia.org/wiki/Lotka-Volterra_equations
##alpha = 1.1;
##betta = 0.4;
##c = 0.4;
##d = 0.1;
##
##study_lotka_volterra_model(alpha, betta, c, d, 100, [10, 10])
##plot_phase_space_for_lv_model(alpha, betta, c, d, [2, 2], 100, 5)

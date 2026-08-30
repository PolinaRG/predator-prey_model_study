alpha = 5;      % alpha is prey birth rate: d(N_prey)/dt ~ alpha * N_prey
betta = 0.5;    % betta is predator death rate: d(N_predator) / dt ~ -betta * N_predator
c = 0.5;        % c shows how predator population affects the growth of prey population (negative effect)
d = 0.01;      % d shows how prey population affects the growth of predator population (positive effect)

steady_state_prey = betta / d;
steady_state_predator = alpha / c;

tspan = [0, 30];
y0 = [0.8 * prey_number_stable, 1.2 * predator_number_stable];
[t, y] = ode45(@(t, y) lotka_volterra_ode(t, y, alpha, betta, c, d), tspan, y0);

figure;
plot(t, y(:, 1), 'Color', '#2BB735', 'LineWidth', 2, t, y(:, 2), 'Color', '#FF0000', 'LineWidth', 2)
xlabel('time, years')
ylabel('population')
grid on
hold on

y0_steady_state = [steady_state_prey, steady_state_predator];
[t_steady_sate, y_steady_state] = ode45(@(t, y) lotka_volterra_ode(t, y, alpha, betta, c, d), tspan, y0_steady_state);
plot(t_steady_sate, y_steady_state(:, 1), 'Color', '#FEAB12', t_steady_sate, y_steady_state(:, 2), 'Color', '#0135E7')
legend('prey (rabbits)', 'predator (foxes)', 'steady state: prey', 'steady state: predator')

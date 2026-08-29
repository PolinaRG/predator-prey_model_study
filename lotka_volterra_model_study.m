alpha = 5;      % alpha is prey birth rate: d(N_prey)/dt ~ alpha * N_prey
betta = 0.5;    % betta is predator death rate: d(N_predator) / dt ~ -betta * N_predator
c = 0.5;        % c shows how predator population affects the growth of prey population (negative effect)
d = 0.01;      % d shows how prey population affects the growth of predator population (positive effect)

prey_number_stable = betta / d;
predator_number_stable = alpha / c;

tspan = [0, 30];
y0 = [0.8 * prey_number_stable, 1.2 * predator_number_stable];
[t, y] = ode45(@(t, y) lotka_volterra_ode(t, y, alpha, betta, c, d), tspan, y0);

plot(t, y(:, 1), '-.', t, y(:, 2), '-.')
xlabel('time, years')
ylabel('population')
legend('prey (rabbits)', 'predator (foxes)')
grid on

% alpha is prey birth rate: d(N_prey)/dt ~ alpha * N_prey
% betta is predator death rate: d(N_predator) / dt ~ -betta * N_predator
% c shows how predator population affects the growth of prey population (negative effect)
% d shows how prey population affects the growth of predator population (positive effect)
function study_lotka_volterra_model(alpha, betta, c, d, tspan_years, y0, palette)
  steady_state_prey = betta / d;
  steady_state_predator = alpha / c;

  tspan = 0:0.05:tspan_years;
  [t, y] = ode45(@(t, y) lotka_volterra_ode(t, y, alpha, betta, c, d), tspan, y0);

  y0_steady_state = [steady_state_prey, steady_state_predator];
  [t_steady_sate, y_steady_state] = ode45(@(t, y) lotka_volterra_ode(t, y, alpha, betta, c, d), tspan, y0_steady_state);

  plot_in_common_axes(t, y, t_steady_sate, y_steady_state, palette)
  plot_in_subplots(t, y, t_steady_sate, y_steady_state, palette)
  plot_in_two_axes(t, y, palette)

  [peaks_preys, peak_indices_preys] = findpeaks(y(:, 1));
  max_years_preys = round(t(peak_indices_preys));

  extra_positive_addition = max(y(:, 2)) + 1;
  [~, bottoms_indices_predators] = findpeaks(extra_positive_addition - y(:, 2));
  bottoms_predators = y(bottoms_indices_predators, 2);
  min_years_predators = round(t(bottoms_indices_predators));

  mean_period_preys = mean(diff(max_years_preys));
  mean_period_predators = mean(diff(min_years_predators));
end

function plot_in_common_axes(t, y, t_steady_sate, y_steady_state, palette)
  figure;
  plot(t, y(:, 1), 'Color', palette('prey'), 'LineWidth', 2, t, y(:, 2), 'Color', palette('predator'), 'LineWidth', 2)
  title('Prey and predator population over time')
  xlabel('time, years')
  ylabel('population')
  grid on
  hold on

  plot(t_steady_sate, y_steady_state(:, 1), 'Color', palette('prey_steady_state'), t_steady_sate, y_steady_state(:, 2), 'Color', palette('predator_steady_state'))
  legend('prey (rabbits)', 'predator (foxes)', 'steady state: prey', 'steady state: predator')
end

function plot_in_subplots(t, y, t_steady_sate, y_steady_state, palette)
  figure;

  subplot(2, 1, 1);
  plot(t, y(:, 1), 'Color', palette('prey'));
  title('Prey population over time');
  xlabel('time, years');
  ylabel('prey population');
  grid on
  hold on
  plot(t_steady_sate, y_steady_state(:, 1), 'Color', palette('prey_steady_state'))

  subplot(2, 1, 2);
  plot(t, y(:, 2), 'Color', palette('predator'));
  title('Predator population over time');
  xlabel('time, years');
  ylabel('predator population');
  grid on
  hold on
  plot(t_steady_sate, y_steady_state(:, 2), 'Color', palette('predator_steady_state'))
end

function plot_in_two_axes(t, y, palette)
  figure;
  [axes, h1, h2] = plotyy(t, y(:, 1), t, y(:, 2));
  title('Prey and predator population over time');
  xlabel(axes(1), 'time, years');
  ylabel(axes(1), 'prey population')
  ylabel(axes(2), 'predator population')
  grid on
  hold on

  set(h1, 'Color', palette('prey'));
  set(axes(1), 'YColor', palette('prey'))
  set(h2, 'Color', palette('predator'));
  set(axes(2), 'YColor', palette('predator'))
end

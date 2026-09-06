% alpha is prey birth rate: d(N_prey)/dt ~ alpha * N_prey
% betta is predator death rate: d(N_predator) / dt ~ -betta * N_predator
% c shows how predator population affects the growth of prey population (negative effect)
% d shows how prey population affects the growth of predator population (positive effect)
function study_lotka_volterra_model(model, tspan_years, y0, titles, palette)
  steady_state_prey = model.betta / model.d;
  steady_state_predator = model.alpha / model.c;

  tspan = 0:0.05:tspan_years;
  [t, y] = ode45(@(t, y) lotka_volterra_ode(t, y, model.alpha, model.betta, model.c, model.d), tspan, y0);

  y0_steady_state = [steady_state_prey, steady_state_predator];
  [t_steady_sate, y_steady_state] = ode45(@(t, y) lotka_volterra_ode(t, y, model.alpha, model.betta, model.c, model.d), tspan, y0_steady_state);

  plot_in_common_axes(t, y, t_steady_sate, y_steady_state, titles, palette)
  plot_in_subplots(t, y, t_steady_sate, y_steady_state, titles, palette)
  plot_in_two_axes(t, y, titles, palette)

  [peaks_preys, peak_indices_preys] = findpeaks(y(:, 1));
  max_years_preys = round(t(peak_indices_preys));

  extra_positive_addition = max(y(:, 2)) + 1;
  [~, bottoms_indices_predators] = findpeaks(extra_positive_addition - y(:, 2));
  bottoms_predators = y(bottoms_indices_predators, 2);
  min_years_predators = round(t(bottoms_indices_predators));

  mean_period_preys = mean(diff(max_years_preys));
  mean_period_predators = mean(diff(min_years_predators));
end

function plot_in_common_axes(t, y, t_steady_sate, y_steady_state, titles, palette)
  figure;
  plot(t, y(:, 1), 'Color', palette('prey'), 'LineWidth', 2, t, y(:, 2), 'Color', palette('predator'), 'LineWidth', 2)
  title(titles('general_title'))
  xlabel(titles('time_axis_label'))
  ylabel(titles('general_y_axis_label'))
  grid on
  hold on

  plot(t_steady_sate, y_steady_state(:, 1), 'Color', palette('prey_steady_state'), t_steady_sate, y_steady_state(:, 2), 'Color', palette('predator_steady_state'))
  legend(titles('legend_prey'), titles('legend_predator'), titles('legend_prey_steady'), titles('legend_predator_steady'), 'location', 'northeastoutside')
end

function plot_in_subplots(t, y, t_steady_sate, y_steady_state, titles, palette)
  figure;

  subplot(2, 1, 1);
  plot(t, y(:, 1), 'Color', palette('prey'));
  title(titles('prey_title'));
  xlabel(titles('time_axis_label'));
  ylabel(titles('prey_axis_label'));
  grid on
  hold on
  plot(t_steady_sate, y_steady_state(:, 1), 'Color', palette('prey_steady_state'))

  subplot(2, 1, 2);
  plot(t, y(:, 2), 'Color', palette('predator'));
  title(titles('predator_title'));
  xlabel(titles('time_axis_label'));
  ylabel(titles('predator_axis_label'));
  grid on
  hold on
  plot(t_steady_sate, y_steady_state(:, 2), 'Color', palette('predator_steady_state'))
end

function plot_in_two_axes(t, y, titles, palette)
  figure;
  [axes, h1, h2] = plotyy(t, y(:, 1), t, y(:, 2));
  title(titles('general_title'));
  xlabel(axes(1), titles('time_axis_label'));
  ylabel(axes(1), titles('prey_axis_label'))
  ylabel(axes(2), titles('predator_axis_label'))
  grid on
  hold on

  set(h1, 'Color', palette('prey'));
  set(axes(1), 'YColor', palette('prey'))
  set(h2, 'Color', palette('predator'));
  set(axes(2), 'YColor', palette('predator'))
end

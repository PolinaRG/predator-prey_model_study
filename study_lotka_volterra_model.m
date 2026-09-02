% alpha is prey birth rate: d(N_prey)/dt ~ alpha * N_prey
% betta is predator death rate: d(N_predator) / dt ~ -betta * N_predator
% c shows how predator population affects the growth of prey population (negative effect)
% d shows how prey population affects the growth of predator population (positive effect)
function study_lotka_volterra_model(alpha, betta, c, d, tspan_years, y0)
  steady_state_prey = betta / d;
  steady_state_predator = alpha / c;

  tspan = 0:0.05:tspan_years;
  [t, y] = ode45(@(t, y) lotka_volterra_ode(t, y, alpha, betta, c, d), tspan, y0);

  figure;
  plot(t, y(:, 1), 'Color', '#2BB735', 'LineWidth', 2, t, y(:, 2), 'Color', '#0135E7', 'LineWidth', 2)
  title('Prey and predator population over time')
  xlabel('time, years')
  ylabel('population')
  grid on
  hold on

  y0_steady_state = [steady_state_prey, steady_state_predator];
  [t_steady_sate, y_steady_state] = ode45(@(t, y) lotka_volterra_ode(t, y, alpha, betta, c, d), tspan, y0_steady_state);
  plot(t_steady_sate, y_steady_state(:, 1), 'Color', '#FEAB12', t_steady_sate, y_steady_state(:, 2), 'Color', '#FF0000')
  legend('prey (rabbits)', 'predator (foxes)', 'steady state: prey', 'steady state: predator')

  [peaks_preys, peak_indices_preys] = findpeaks(y(:, 1));
  max_years_preys = round(t(peak_indices_preys));

  extra_positive_addition = max(y(:, 2)) + 1;
  [~, bottoms_indices_predators] = findpeaks(extra_positive_addition - y(:, 2));
  bottoms_predators = y(bottoms_indices_predators, 2);
  min_years_predators = round(t(bottoms_indices_predators));

  mean_period_preys = mean(diff(max_years_preys));
  mean_period_predators = mean(diff(min_years_predators));

  plot_phase_space_plot(alpha, betta, c, d, round([steady_state_prey, steady_state_predator] * 0.1), tspan, 5)
end

function plot_phase_space_plot(alpha, betta, c, d, y0_step, tspan, curves_num)

  figure;
  title('Phase-space plot for prey and predator populations')
  xlabel('prey population')
  ylabel('predator population')
  grid on
  hold on

  y0 = [betta / d, alpha / c];
  for i = 1:1:curves_num
    [t, y] = ode45(@(t, y) lotka_volterra_ode(t, y, alpha, betta, c, d), tspan, y0);
    [peaks_preys, peak_indices_preys] = findpeaks(y(:, 1));
    tspan_phase = peak_indices_preys(1):peak_indices_preys(2);
    plot(y(tspan_phase, 1), y(tspan_phase, 2))
    hold on
    y0 = y0 + y0_step;
  end

end

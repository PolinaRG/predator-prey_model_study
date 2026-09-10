function plot_phase_space_for_lv_model(model, y0_step, tspan_years, curves_num, titles)

  figure;
  title(titles('phase_plot_title'))
  xlabel(titles('prey_axis_label'))
  ylabel(titles('predator_axis_label'))
  grid on
  hold on

  y0 = [model.betta / model.d, model.alpha / model.c];
  tspan = 0:0.01:tspan_years;
  for i = 1:curves_num
    [~, y] = ode45(@(t, y) lotka_volterra_ode(t, y, model.alpha, model.betta, model.c, model.d), tspan, y0);
    [peaks_preys, peak_indices_preys] = findpeaks(y(:, 1));
    tspan_phase = peak_indices_preys(1):peak_indices_preys(2);
    curve_label = sprintf('y0: (%d, %d)', y0(1), y0(2));
    marker = 'none';
    if all(y(tspan_phase, 1) - y(1, 1) < 0.001)
      marker = 'x';
    end
    plot(y(tspan_phase, 1), y(tspan_phase, 2), 'Marker', marker, 'DisplayName', curve_label)
    hold on
    y0 = y0 + y0_step;
  end
  legend('show');
end

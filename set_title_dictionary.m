function titles = set_title_dictionary(lang)
  if lang == 'EN'
    titles = set_title_dictionary_EN();
  elseif lang == 'RU'
    titles = set_title_dictionary_RU();
  end
end

function titles = set_title_dictionary_EN()
  titles = containers.Map();

  titles('general_title') = 'Prey and predator population over time';
  titles('phase_plot_title') = 'Phase-space plot for prey and predator populations';
  titles('prey_title') = 'Prey population over time';
  titles('predator_title') = 'Predator population over time';

  titles('time_axis_label') = 'time, years';

  titles('general_y_axis_label') = 'population';
  titles('prey_axis_label') = 'prey population';
  titles('predator_axis_label') = 'predator population';

  titles('legend_prey') = 'prey (rabbits)';
  titles('legend_predator') = 'predator (foxes)';
  titles('legend_prey_steady') = 'steady state: prey';
  titles('legend_predator_steady') = 'steady state: predator';
end

function titles = set_title_dictionary_RU()
  titles = containers.Map();

  titles('general_title') = 'Популяции хищников и жертв в зависимости от времени';
  titles('phase_plot_title') = 'Фазовое пространство в системе хищников и жертв';
  titles('prey_title') = 'Популяция жертв в зависимости от времени';
  titles('predator_title') = 'Популяция хищников в зависимости от времени';

  titles('time_axis_label') = 'время, число лет';

  titles('general_y_axis_label') = 'плотность популяции';
  titles('prey_axis_label') = 'популяция жертв';
  titles('predator_axis_label') = 'популяция хищников';

  titles('legend_prey') = 'жертвы (зайцы)';
  titles('legend_predator') = 'хищники (лисицы)';
  titles('legend_prey_steady') = 'стационарное решение: жертвы';
  titles('legend_predator_steady') = 'стационарное решение: хищники';
end

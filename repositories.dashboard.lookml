- dashboard: repositories
  title: Repositories
  layout: newspaper
  elements:
  - title: Total Commits by Repository
    name: Total Commits by Repository
    model: block-github-commits
    explore: commit
    type: looker_column
    fields: [commit.count, repository.name_formatted]
    filters:
      repository.name_formatted: "-EMPTY"
    sorts: [commit.count desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 0
    col: 0
    width: 9
    height: 9
  - title: Total Commits Over Time
    name: Total Commits Over Time
    model: block-github-commits
    explore: commit
    type: looker_line
    fields: [commit.author_year, commit.count, repository.name_formatted]
    pivots: [repository.name_formatted]
    filters:
      commit.author_year: after 2010/01/01
      repository.name_formatted: "-NULL"
    sorts: [commit.author_year, repository.name_formatted 0]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: running_total, label: Running Total, expression: 'running_total(${commit.count})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [commit.count]
    listen: {}
    row: 0
    col: 9
    width: 15
    height: 9

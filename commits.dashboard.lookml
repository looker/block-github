- dashboard: commits
  title: Commits
  layout: newspaper
  elements:
  - name: Commits by Company
    title: Commits by Company
    model: block-github-commits
    explore: commit
    type: looker_column
    fields: [user.company, commit.count]
    sorts: [commit.count desc]
    limit: 10
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: commit.count,
            id: commit.count, name: Commit}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
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
    listen:
      Repository: repository.name_formatted
    row: 0
    col: 0
    width: 13
    height: 8
  - name: Commits by Hour of Day
    title: Commits by Hour of Day
    model: block-github-commits
    explore: commit
    type: looker_pie
    fields: [commit.count, commit.author_hour_of_day]
    fill_fields: [commit.author_hour_of_day]
    sorts: [commit.author_hour_of_day]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
        reverse: false
    series_colors:
      '0': "#1E0030"
      '1': "#12165C"
      '2': "#173589"
      '3': "#184EA0"
      '4': "#1864B4"
      '5': "#1A81CE"
      '6': "#2693D1"
      '7': "#3EB0D5"
      '8': "#72C5D4"
      '9': "#B4DED2"
      '10': "#D2EAD1"
      '11': "#E9F3D1"
      '12': "#E9F3D1"
      '13': "#D2EAD1"
      '14': "#B4DED2"
      '15': "#72C5D4"
      '16': "#3EB0D5"
      '17': "#2693D1"
      '18': "#1A81CE"
      '19': "#1864B4"
      '20': "#184EA0"
      '21': "#173589"
      '22': "#12165C"
      '23': "#1E0030"
    series_labels:
      '0': 12am
      '1': 1am
      '2': 2am
      '3': 3am
      '4': 4am
      '5': 5am
      '6': 6am
      '7': 7am
      '8': 8am
      '9': 9am
      '10': 10am
      '11': 11am
      '12': 12pm
      '13': 1pm
      '14': 2pm
      '15': 3pm
      '16': 4pm
      '17': 5pm
      '18': 6pm
      '19': 7pm
      '20': 8pm
      '21': 9pm
      '22': 10pm
      '23': 11pm
    series_types: {}
    listen:
      Repository: repository.name_formatted
    row: 15
    col: 0
    width: 11
    height: 10
  - name: Commits by Week for the Past Year
    title: Commits by Week for the Past Year
    model: block-github-commits
    explore: commit
    type: looker_line
    fields: [commit.count, commit.author_week, repository.name_formatted]
    pivots: [repository.name_formatted]
    fill_fields: [commit.author_week]
    filters:
      commit.author_week: 52 weeks
    sorts: [commit.author_week desc, repository.name_formatted]
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
    show_null_points: true
    interpolation: linear
    listen:
      Repository: repository.name_formatted
    row: 8
    col: 0
    width: 24
    height: 7
  - title: Commits by Day of Week
    name: Commits by Day of Week
    model: block-github-commits
    explore: commit
    type: looker_column
    fields: [commit.author_day_of_week, commit.count, repository.name_formatted]
    pivots: [repository.name_formatted]
    fill_fields: [commit.author_day_of_week]
    filters: {}
    sorts: [commit.author_day_of_week, repository.name_formatted]
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
    listen:
      Repository: repository.name_formatted
    row: 15
    col: 11
    width: 13
    height: 10
  - title: Commits by Author
    name: Commits by Author
    model: block-github-commits
    explore: commit
    type: looker_column
    fields: [commit.author_year, commit.count, commit.author_name]
    pivots: [commit.author_name]
    filters:
      commit.author_year: after 2010/01/01
      commit.count: ">20"
    sorts: [commit.author_year desc]
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
    stacking: percent
    limit_displayed_rows: false
    hide_legend: true
    legend_position: center
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
    listen:
      Repository: repository.name_formatted
    row: 25
    col: 0
    width: 24
    height: 11
  - title: Commits by No-Company Authors
    name: Commits by No-Company Authors
    model: block-github-commits
    explore: commit
    type: looker_bar
    fields: [commit.count, commit.author_name]
    filters:
      user.company: EMPTY
    sorts: [commit.count desc]
    limit: 10
    query_timezone: America/Los_Angeles
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
    listen:
      Repository: repository.name_formatted
    row: 0
    col: 13
    width: 11
    height: 8
  filters:
  - name: Repository
    title: Repository
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block-github-commits
    explore: commit
    listens_to_filters: []
    field: repository.name_formatted

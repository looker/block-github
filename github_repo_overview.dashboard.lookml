- dashboard: github_repo_overview
  title: Github Repo Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Total Authors
    name: Total Authors
    model: block-github
    explore: commit
    type: single_value
    fields: [commit.author_count_distinct]
    limit: 500
    column_limit: 50
    listen:
      Created Date: commit.author_date
      Repository: repository.name
    row: 0
    col: 12
    width: 6
    height: 3
  - title: Commits Over Time
    name: Commits Over Time
    model: block-github
    explore: commit
    type: looker_area
    fields: [commit.author_year, commit.count, repository.name]
    pivots: [repository.name]
    fill_fields: [commit.author_year]
    filters:
      commit.author_year: after 2010/01/01
    sorts: [commit.author_year, repository.name]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: running_total, label: Running Total, expression: 'running_total(${commit.count})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: angular - running_total,
            id: angular - running_total, name: angular}, {axisId: angular.js - running_total,
            id: angular.js - running_total, name: angular.js}, {axisId: app-marketing-common
              - running_total, id: app-marketing-common - running_total, name: app-marketing-common},
          {axisId: block-github-data - running_total, id: block-github-data - running_total,
            name: block-github-data}, {axisId: code.angularjs.org - running_total,
            id: code.angularjs.org - running_total, name: code.angularjs.org}, {axisId: foo
              - running_total, id: foo - running_total, name: foo}, {axisId: hello-world
              - running_total, id: hello-world - running_total, name: hello-world},
          {axisId: other-repository - running_total, id: other-repository - running_total,
            name: other-repository}, {axisId: react - running_total, id: react - running_total,
            name: react}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [commit.count]
    listen:
      Created Date: commit.author_date
      Repository: repository.name
    row: 3
    col: 0
    width: 12
    height: 10
  - title: Open PRs
    name: Open PRs
    model: block-github
    explore: pull_request
    type: single_value
    fields: [pull_request.count, pull_request.is_merged]
    filters:
      pull_request.is_merged: 'No'
    sorts: [pull_request.count desc]
    limit: 500
    column_limit: 50
    listen:
      Repository: repository.name
    row: 0
    col: 18
    width: 6
    height: 3
  - title: Committers Over Time
    name: Committers Over Time
    model: block-github
    explore: commit
    type: looker_area
    fields: [commit.author_year, repository.name, user.count]
    pivots: [repository.name]
    fill_fields: [commit.author_year]
    filters:
      commit.author_year: after 2010/01/01
    sorts: [commit.author_year, repository.name]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: running_total, label: Running Total, expression: 'running_total(${user.count})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: angular - running_total,
            id: angular - running_total, name: angular}, {axisId: angular.js - running_total,
            id: angular.js - running_total, name: angular.js}, {axisId: app-marketing-common
              - running_total, id: app-marketing-common - running_total, name: app-marketing-common},
          {axisId: block-github-data - running_total, id: block-github-data - running_total,
            name: block-github-data}, {axisId: code.angularjs.org - running_total,
            id: code.angularjs.org - running_total, name: code.angularjs.org}, {axisId: foo
              - running_total, id: foo - running_total, name: foo}, {axisId: hello-world
              - running_total, id: hello-world - running_total, name: hello-world},
          {axisId: other-repository - running_total, id: other-repository - running_total,
            name: other-repository}, {axisId: react - running_total, id: react - running_total,
            name: react}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [user.count]
    listen:
      Created Date: commit.author_date
      Repository: repository.name
    row: 3
    col: 12
    width: 12
    height: 10
  - title: Avg Message Length by Repository
    name: Avg Message Length by Repository
    model: block-github
    explore: commit
    type: looker_column
    fields: [commit.average_message_length, repository.name]
    filters:
      repository.name_formatted: "-NULL"
    sorts: [commit.average_message_length desc]
    limit: 10
    column_limit: 50
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: commit.average_message_length,
            id: commit.average_message_length, name: Average Message Length}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      commit.average_message_length: "#7CC8FA"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Created Date: commit.author_date
      Repository: repository.name
    row: 30
    col: 0
    width: 12
    height: 11
  - title: Top 10 Committer Locations
    name: Top 10 Committer Locations
    model: block-github
    explore: commit
    type: looker_bar
    fields: [user.location, commit.count]
    filters:
      commit.author_year: after 2010/01/01
      repository.name_formatted: "-NULL"
      user.location: "-NULL"
    sorts: [commit.count desc]
    limit: 10
    column_limit: 50
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: commit.count, id: commit.count,
            name: Commit}], showLabels: true, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    series_colors:
      commit.count: "#7CC8FA"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      Created Date: commit.author_date
      Repository: repository.name
    row: 13
    col: 12
    width: 12
    height: 10
  - title: PR Reviews by State
    name: PR Reviews by State
    model: block-github
    explore: pull_request
    type: looker_bar
    fields: [pull_request_review.state, pull_request.count]
    pivots: [pull_request_review.state]
    filters:
      pull_request_review.state: "-NULL"
    sorts: [pull_request.count desc 0, pull_request_review.state]
    limit: 500
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: APPROVED - pull_request.count,
            id: APPROVED - pull_request.count, name: APPROVED}, {axisId: CHANGES_REQUESTED
              - pull_request.count, id: CHANGES_REQUESTED - pull_request.count, name: CHANGES_REQUESTED},
          {axisId: DISMISSED - pull_request.count, id: DISMISSED - pull_request.count,
            name: DISMISSED}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      APPROVED - pull_request.count: "#7CC8FA"
      CHANGES_REQUESTED - pull_request.count: "#FDEC85"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Repository: repository.name
    row: 23
    col: 0
    width: 12
    height: 7
  - title: Top Committers
    name: Top Committers
    model: block-github
    explore: commit
    type: looker_bar
    fields: [commit.count, user.name, dt_rank.rank]
    filters:
      commit.author_year: after 2010/01/01
      dt_rank.rank: NOT NULL
      user.name: "-NULL"
    sorts: [dt_rank.rank]
    limit: 15
    column_limit: 50
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: commit.count, id: commit.count,
            name: Commit}], showLabels: true, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    series_colors:
      commit.count: "#7CC8FA"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    hidden_fields: [dt_rank.rank]
    listen:
      Created Date: commit.author_date
      Repository: repository.name
    row: 13
    col: 0
    width: 12
    height: 10
  - title: Commits By Day of Week and Hour of Day
    name: Commits By Day of Week and Hour of Day
    model: block-github
    explore: commit
    type: looker_grid
    fields: [commit.author_day_of_week, commit.count, commit.author_hour_of_day]
    pivots: [commit.author_day_of_week]
    fill_fields: [commit.author_day_of_week, commit.author_hour_of_day]
    filters:
      repository.name_formatted: ''
    sorts: [commit.author_day_of_week 0, commit.author_hour_of_day]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      commit.count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7,
          custom: {id: b5977ecc-3e49-5749-11fe-b3341dd6c108, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#7CC8FA", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [commit.count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    series_types: {}
    listen:
      Created Date: commit.author_date
      Repository: repository.name
    row: 30
    col: 12
    width: 12
    height: 11
  - title: Open PR Details
    name: Open PR Details
    model: block-github
    explore: pull_request
    type: looker_grid
    fields: [pull_request_head_user.head_user_name, pull_request.id, reposityry_head.head_repo_name,
      issue.name]
    filters:
      pull_request.is_merged: 'No'
    sorts: [pull_request_head_user.head_user_name]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_labels:
      issue.name: Issue Name
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Repository: repository.name
    row: 23
    col: 12
    width: 12
    height: 7
  - title: Commits This Month
    name: Commits This Month
    model: block-github
    explore: commit
    type: single_value
    fields: [commit.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields:
    defaults_version: 1
    listen:
      Created Date: commit.author_date
      Repository: repository.name
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Committers This Month
    name: Committers This Month
    model: block-github
    explore: commit
    type: single_value
    fields: [user.count]
    filters:
      commit.committer_date: 1 months
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields:
    defaults_version: 1
    listen:
      Created Date: commit.author_date
      Repository: repository.name
    row: 0
    col: 6
    width: 6
    height: 3
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: block-github
    explore: commit
    listens_to_filters: []
    field: commit.author_date
  - name: Repository
    title: Repository
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: block-github
    explore: commit
    listens_to_filters: []
    field: repository.name

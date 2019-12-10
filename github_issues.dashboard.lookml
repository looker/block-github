- dashboard: github_issues
  title: GitHub Issues
  layout: newspaper
  elements:
  - title: Avg Open Duration by Month
    name: Avg Open Duration by Month
    model: block-github-commits
    explore: issue
    type: looker_area
    fields: [issue.created_month, issue.avg_open]
    fill_fields: [issue.created_month]
    filters:
      issue.created_month: 6 months
    sorts: [issue.created_month desc]
    limit: 500
    column_limit: 50
    series_types: {}
    listen:
      Created Date: issue.created_date
    row: 6
    col: 14
    width: 10
    height: 6
  - title: Issues with Most Mentions
    name: Issues with Most Mentions
    model: block-github-commits
    explore: issue
    type: looker_grid
    fields: [issue.number, issue.title, repository.name, issue.created_date, issue.state,
      issue.days_open, issue_mention.count]
    sorts: [issue_mention.count desc]
    limit: 15
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: issue_mention.count,
            id: issue_mention.count, name: Mention Count}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_colors:
      issue_comment.count: "#7CC8FA"
      issue_mention.count: "#10C871"
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
      Created Date: issue.created_date
    row: 12
    col: 0
    width: 14
    height: 8
  - title: Issue Status by Month
    name: Issue Status by Month
    model: block-github-commits
    explore: issue
    type: looker_column
    fields: [issue.count, issue.created_month, issue.state]
    pivots: [issue.state]
    fill_fields: [issue.created_month]
    filters:
      issue.created_month: 6 months
    sorts: [issue.count desc 0, issue.state]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: closed - issue.count,
            id: closed - issue.count, name: closed}, {axisId: open - issue.count,
            id: open - issue.count, name: open}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: right
    series_types: {}
    point_style: none
    series_colors:
      closed - issue.count: "#FD9577"
      open - issue.count: "#7CC8FA"
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
      Created Date: issue.created_date
    row: 0
    col: 14
    width: 10
    height: 6
  - title: Closed Issues Heatmap
    name: Closed Issues Heatmap
    model: block-github-commits
    explore: issue
    type: looker_grid
    fields: [issue.count, issue.closed_hour_of_day, issue.closed_day_of_week]
    pivots: [issue.closed_day_of_week]
    fill_fields: [issue.closed_hour_of_day, issue.closed_day_of_week]
    filters:
      issue.closed_date: NOT NULL
    sorts: [issue.closed_day_of_week, issue.closed_hour_of_day 0]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      issue.count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#FCCF41",
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          custom: {id: b0b3a5b9-7115-2de8-d20d-902775e4bbad, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#A5EF55", offset: 100}]},
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [issue.count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    size_by_field: issue.count
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    hide_legend: true
    legend_position: center
    series_types: {}
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    listen:
      Created Date: issue.created_date
    row: 12
    col: 14
    width: 10
    height: 13
  - title: Issues Burndown
    name: Issues Burndown
    model: block-github-commits
    explore: issue
    type: looker_area
    fields: [issue.count, issue.created_date, issue.state]
    pivots: [issue.state]
    fill_fields: [issue.created_date]
    filters: {}
    sorts: [issue.state 0, issue.created_date]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: calculation_1, id: calculation_1,
            name: Calculation 1}, {axisId: issue.count, id: Closed - issue.count,
            name: Closed - Issue Issue Count}, {axisId: issue.count, id: Open - issue.count,
            name: Open - Issue Issue Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
      closed - issue.count: "#10C871"
    series_point_styles:
      calculation_1: triangle-down
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    swap_axes: false
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Created Date: issue.created_date
    row: 0
    col: 0
    width: 14
    height: 12
  - title: Issues with Most Comments
    name: Issues with Most Comments
    model: block-github-commits
    explore: issue
    type: looker_grid
    fields: [issue.number, issue.title, repository.name, issue.created_date, issue.days_open,
      issue_comment.count]
    sorts: [issue_comment.count desc]
    limit: 15
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: issue_comment.count,
            id: issue_comment.count, name: Comment Count}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_colors:
      issue_comment.count: "#7CC8FA"
    show_value_labels: true
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
      Created Date: issue.created_date
    row: 20
    col: 0
    width: 14
    height: 7
  - title: Most Mentioned Users
    name: Most Mentioned Users
    model: block-github-commits
    explore: issue
    type: looker_grid
    fields: [mentioned_user_info.name, mentioned_user_info.login, issue_mention.count]
    sorts: [issue_mention.count desc]
    limit: 500
    column_limit: 50
    series_types: {}
    listen:
      Created Date: issue.created_date
    row: 25
    col: 14
    width: 10
    height: 7
  - title: Issues Created Over Time
    name: Issues Created Over Time
    model: block-github-commits
    explore: issue
    type: looker_area
    fields: [issue.created_date, issue.count]
    fill_fields: [issue.created_date]
    sorts: [issue.created_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
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
      issue.count: "#f56776"
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Created Date: issue.created_date
    row: 27
    col: 0
    width: 14
    height: 5
  - title: Issues by Label
    name: Issues by Label
    model: block-github-commits
    explore: issue
    type: looker_column
    fields: [issue_label.label, issue_renamed.count]
    filters:
      issue_label.label: "-NULL"
    sorts: [issue_renamed.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: issue_renamed.count,
            id: issue_renamed.count, name: Renamed Count}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
      Created Date: issue.created_date
    row: 32
    col: 10
    width: 14
    height: 6
  - title: Issues By Status and Repository
    name: Issues By Status and Repository
    model: block-github-commits
    explore: issue
    type: looker_column
    fields: [repository.name, issue.state, issue.count]
    pivots: [issue.state]
    sorts: [repository.name, issue.state]
    limit: 500
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: closed - issue.count,
            id: closed - issue.count, name: closed}, {axisId: open - issue.count,
            id: open - issue.count, name: open}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
      issue_comment.count: "#7CC8FA"
      issue_mention.count: "#10C871"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Created Date: issue.created_date
    row: 32
    col: 0
    width: 10
    height: 6
  - title: Most Referenced Issues
    name: Most Referenced Issues
    model: block-github-commits
    explore: issue
    type: looker_grid
    fields: [issue.id, issue_referenced.count, issue.title]
    sorts: [issue_referenced.count desc]
    limit: 500
    column_limit: 50
    series_types: {}
    listen:
      Created Date: issue.created_date
    row: 38
    col: 0
    width: 14
    height: 7
  - title: Oldest Open Issues
    name: Oldest Open Issues
    model: block-github-commits
    explore: issue
    type: looker_grid
    fields: [issue.title, issue.body, issue.created_date]
    filters:
      issue.open_or_closed: Open
    sorts: [issue.created_date]
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
    series_colors:
      issue_comment.count: "#7CC8FA"
      issue_mention.count: "#10C871"
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
      Created Date: issue.created_date
    row: 38
    col: 14
    width: 10
    height: 7
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block-github-commits
    explore: issue
    listens_to_filters: []
    field: issue.created_date

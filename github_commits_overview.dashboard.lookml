- dashboard: github_commits_overview
  title: Github Commits Overview
  layout: newspaper
  elements:
  - title: Commits This Month
    name: Commits This Month
    model: block-github-commits
    explore: commit
    type: single_value
    fields: [commit.count]
    filters:
      commit.author_date: 1 months
    limit: 500
    column_limit: 50
    series_types: {}
    listen: {}
    row: 4
    col: 0
    width: 4
    height: 4
  - title: Committers This Month
    name: Committers This Month
    model: block-github-commits
    explore: commit
    type: single_value
    fields: [user.count]
    filters:
      commit.committer_date: 1 months
    limit: 500
    column_limit: 50
    series_types: {}
    listen: {}
    row: 0
    col: 0
    width: 4
    height: 4
  - title: Repositories Detail
    name: Repositories Detail
    model: block-github-commits
    explore: commit
    type: looker_grid
    fields: [repository.created_date, repository.full_name, repository.homepage, repository.description,
      commit.count, repository.private, repository_owner.owner_name]
    filters:
      commit.author_year: after 2010/01/01
      repository.name: "-NULL"
    sorts: [commit.count desc]
    limit: 10
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
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
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen: {}
    row: 33
    col: 0
    width: 24
    height: 5
  - title: Commits By Day of Week and Hour of Day
    name: Commits By Day of Week and Hour of Day
    model: block-github-commits
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
          palette_id: 97ce1e3f-9504-4d5c-835b-3fbaf78c084a, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: [commit.count]}]
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
    listen: {}
    row: 8
    col: 12
    width: 12
    height: 12
  - title: Commits Over Time
    name: Commits Over Time
    model: block-github-commits
    explore: commit
    type: looker_area
    fields: [commit.author_year, commit.count, repository.name]
    pivots: [repository.name]
    fill_fields: [commit.author_year]
    filters:
      commit.author_year: after 2010/01/01
      repository.name: "-NULL"
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
    listen: {}
    row: 0
    col: 10
    width: 14
    height: 8
  - title: Commits By Author
    name: Commits By Author
    model: block-github-commits
    explore: commit
    type: looker_column
    fields: [commit.count, commit.author_name, commit.author_month]
    pivots: [commit.author_name]
    filters:
      commit.count: ">20"
      repository.name_formatted: ''
      commit.author_date: 6 months
    sorts: [commit.author_name 0, commit.author_month]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Brian Vaughn - bvaughn
              - commit.count, id: Brian Vaughn - bvaughn - commit.count, name: Brian
              Vaughn}, {axisId: Dan Abramov - gaearon - commit.count, id: Dan Abramov
              - gaearon - commit.count, name: Dan Abramov}, {axisId: Dominic Gannaway
              - trueadm - commit.count, id: Dominic Gannaway - trueadm - commit.count,
            name: Dominic Gannaway}, {axisId: George Kalpakas - gkalpak - commit.count,
            id: George Kalpakas - gkalpak - commit.count, name: George Kalpakas},
          {axisId: JiaLiPassion - JiaLiPassion - commit.count, id: JiaLiPassion -
              JiaLiPassion - commit.count, name: JiaLiPassion}, {axisId: Judy Bogart
              - jbogarthyde - commit.count, id: Judy Bogart - jbogarthyde - commit.count,
            name: Judy Bogart}, {axisId: Kara Erickson - kara - commit.count, id: Kara
              Erickson - kara - commit.count, name: Kara Erickson}, {axisId: Matias
              Niemelä - matsko - commit.count, id: Matias Niemelä - matsko - commit.count,
            name: Matias Niemelä}, {axisId: Paul Gschwendtner - devversion - commit.count,
            id: Paul Gschwendtner - devversion - commit.count, name: Paul Gschwendtner},
          {axisId: Pawel Kozlowski - pkozlowski-opensource - commit.count, id: Pawel
              Kozlowski - pkozlowski-opensource - commit.count, name: Pawel Kozlowski},
          {axisId: Pete Bacon Darwin - petebacondarwin - commit.count, id: Pete Bacon
              Darwin - petebacondarwin - commit.count, name: Pete Bacon Darwin}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    hide_legend: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 8
    col: 0
    width: 12
    height: 7
  - title: Top 10 Committers
    name: Top 10 Committers
    model: block-github-commits
    explore: commit
    type: looker_bar
    fields: [commit.count, user.name, dt_rank.rank]
    filters:
      commit.author_year: after 2010/01/01
      dt_rank.rank: NOT NULL
      user.name: "-NULL"
    sorts: [dt_rank.rank]
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
      commit.count: "#10C871"
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
    listen: {}
    row: 20
    col: 0
    width: 12
    height: 7
  - title: Top 10 Committer Locations
    name: Top 10 Committer Locations
    model: block-github-commits
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
      commit.count: "#9E7FD0"
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
    listen: {}
    row: 20
    col: 12
    width: 12
    height: 7
  - title: Commits By Repository
    name: Commits By Repository
    model: block-github-commits
    explore: commit
    type: looker_pie
    fields: [commit.count, repository.name_formatted]
    filters:
      repository.name_formatted: "-EMPTY"
    sorts: [commit.count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    series_colors: {}
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
    col: 4
    width: 6
    height: 8
  - title: Avg Message Length by Repository
    name: Avg Message Length by Repository
    model: block-github-commits
    explore: commit
    type: looker_column
    fields: [repository.name_formatted, commit.average_message_length]
    filters:
      repository.name_formatted: "-NULL"
    sorts: [repository.name_formatted]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: " >°))))彡 - commit.average_message_length",
            id: " >°))))彡 - commit.average_message_length", name: " >°))))彡"}, {axisId: "@MizaelGalvez\
              \ - commit.average_message_length", id: "@MizaelGalvez - commit.average_message_length",
            name: "@MizaelGalvez"}, {axisId: 3boll - commit.average_message_length,
            id: 3boll - commit.average_message_length, name: 3boll}, {axisId: 839
              - commit.average_message_length, id: 839 - commit.average_message_length,
            name: '839'}, {axisId: Aaditya Talwai - commit.average_message_length,
            id: Aaditya Talwai - commit.average_message_length, name: Aaditya Talwai},
          {axisId: Aaron (Ron) Tsui - commit.average_message_length, id: Aaron (Ron)
              Tsui - commit.average_message_length, name: Aaron (Ron) Tsui}, {axisId: Aaron
              Abramov - commit.average_message_length, id: Aaron Abramov - commit.average_message_length,
            name: Aaron Abramov}, {axisId: Aaron Ackerman - commit.average_message_length,
            id: Aaron Ackerman - commit.average_message_length, name: Aaron Ackerman},
          {axisId: Aaron Brager - commit.average_message_length, id: Aaron Brager
              - commit.average_message_length, name: Aaron Brager}, {axisId: Aaron
              Brewer - commit.average_message_length, id: Aaron Brewer - commit.average_message_length,
            name: Aaron Brewer}, {axisId: Aaron Cannon - commit.average_message_length,
            id: Aaron Cannon - commit.average_message_length, name: Aaron Cannon},
          {axisId: Aaron Franks - commit.average_message_length, id: Aaron Franks
              - commit.average_message_length, name: Aaron Franks}, {axisId: Aaron
              Gussman - commit.average_message_length, id: Aaron Gussman - commit.average_message_length,
            name: Aaron Gussman}, {axisId: Aaron Hoffman - commit.average_message_length,
            id: Aaron Hoffman - commit.average_message_length, name: Aaron Hoffman},
          {axisId: Aaron Wang - commit.average_message_length, id: Aaron Wang - commit.average_message_length,
            name: Aaron Wang}, {axisId: Aashish Nagpal - commit.average_message_length,
            id: Aashish Nagpal - commit.average_message_length, name: Aashish Nagpal},
          {axisId: Abdul Rauf - commit.average_message_length, id: Abdul Rauf - commit.average_message_length,
            name: Abdul Rauf}, {axisId: Abdulrahman Khalil - commit.average_message_length,
            id: Abdulrahman Khalil - commit.average_message_length, name: Abdulrahman
              Khalil}, {axisId: Abhay Nikam - commit.average_message_length, id: Abhay
              Nikam - commit.average_message_length, name: Abhay Nikam}, {axisId: Abhimanyu
              Deora - commit.average_message_length, id: Abhimanyu Deora - commit.average_message_length,
            name: Abhimanyu Deora}, {axisId: Abhishek Garg - commit.average_message_length,
            id: Abhishek Garg - commit.average_message_length, name: Abhishek Garg},
          {axisId: Abhishek Soni - commit.average_message_length, id: Abhishek Soni
              - commit.average_message_length, name: Abhishek Soni}, {axisId: Abraham
              - commit.average_message_length, id: Abraham - commit.average_message_length,
            name: Abraham}, {axisId: Adam - commit.average_message_length, id: Adam
              - commit.average_message_length, name: Adam}, {axisId: Adam Abrons -
              commit.average_message_length, id: Adam Abrons - commit.average_message_length,
            name: Adam Abrons}, {axisId: Adam Banko - commit.average_message_length,
            id: Adam Banko - commit.average_message_length, name: Adam Banko}, {axisId: Adam
              Beck - commit.average_message_length, id: Adam Beck - commit.average_message_length,
            name: Adam Beck}, {axisId: Adam Bowen - commit.average_message_length,
            id: Adam Bowen - commit.average_message_length, name: Adam Bowen}, {axisId: Adam
              Bradley - commit.average_message_length, id: Adam Bradley - commit.average_message_length,
            name: Adam Bradley}, {axisId: Adam Comella - commit.average_message_length,
            id: Adam Comella - commit.average_message_length, name: Adam Comella},
          {axisId: Adam Humphrey - commit.average_message_length, id: Adam Humphrey
              - commit.average_message_length, name: Adam Humphrey}, {axisId: Adam
              Kent - commit.average_message_length, id: Adam Kent - commit.average_message_length,
            name: Adam Kent}, {axisId: Adam Krebs - commit.average_message_length,
            id: Adam Krebs - commit.average_message_length, name: Adam Krebs}, {axisId: Adam
              Mark - commit.average_message_length, id: Adam Mark - commit.average_message_length,
            name: Adam Mark}, {axisId: Adam Shannon - commit.average_message_length,
            id: Adam Shannon - commit.average_message_length, name: Adam Shannon},
          {axisId: Adam Shaylor - commit.average_message_length, id: Adam Shaylor
              - commit.average_message_length, name: Adam Shaylor}, {axisId: Adam
              Solove - commit.average_message_length, id: Adam Solove - commit.average_message_length,
            name: Adam Solove}, {axisId: Adam Stankiewicz - commit.average_message_length,
            id: Adam Stankiewicz - commit.average_message_length, name: Adam Stankiewicz},
          {axisId: Adam Timberlake - commit.average_message_length, id: Adam Timberlake
              - commit.average_message_length, name: Adam Timberlake}, {axisId: Adam
              Yi - commit.average_message_length, id: Adam Yi - commit.average_message_length,
            name: Adam Yi}, {axisId: Adam Zapletal - commit.average_message_length,
            id: Adam Zapletal - commit.average_message_length, name: Adam Zapletal},
          {axisId: Adam Zerner - commit.average_message_length, id: Adam Zerner -
              commit.average_message_length, name: Adam Zerner}, {axisId: Adams Au
              - commit.average_message_length, id: Adams Au - commit.average_message_length,
            name: Adams Au}, {axisId: Addy Osmani - commit.average_message_length,
            id: Addy Osmani - commit.average_message_length, name: Addy Osmani}, {
            axisId: Adil MOURAHI - commit.average_message_length, id: Adil MOURAHI
              - commit.average_message_length, name: Adil MOURAHI}, {axisId: Adir
              Amsalem - commit.average_message_length, id: Adir Amsalem - commit.average_message_length,
            name: Adir Amsalem}, {axisId: Aditya Bhardwaj - commit.average_message_length,
            id: Aditya Bhardwaj - commit.average_message_length, name: Aditya Bhardwaj},
          {axisId: Adrian Carolli - commit.average_message_length, id: Adrian Carolli
              - commit.average_message_length, name: Adrian Carolli}, {axisId: Adrian
              Gheorghe - commit.average_message_length, id: Adrian Gheorghe - commit.average_message_length,
            name: Adrian Gheorghe}, {axisId: Adrian Moos - commit.average_message_length,
            id: Adrian Moos - commit.average_message_length, name: Adrian Moos}],
        showLabels: true, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
      commit.average_message_length: "#F29ED2"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 15
    col: 0
    width: 12
    height: 5
  - title: PR Reviews by State
    name: PR Reviews by State
    model: block-github-commits
    explore: pull_request
    type: looker_column
    fields: [pull_request_review.state, pull_request.count, reposityry_head.head_repo_name]
    pivots: [pull_request_review.state]
    filters:
      pull_request_review.state: "-NULL"
    sorts: [pull_request.count desc 0, reposityry_head.head_repo_name, pull_request_review.state]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: APPROVED - pull_request.count,
            id: APPROVED - pull_request.count, name: APPROVED}, {axisId: CHANGES_REQUESTED
              - pull_request.count, id: CHANGES_REQUESTED - pull_request.count, name: CHANGES_REQUESTED},
          {axisId: DISMISSED - pull_request.count, id: DISMISSED - pull_request.count,
            name: DISMISSED}], showLabels: true, showValues: true, unpinAxis: false,
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    row: 27
    col: 0
    width: 12
    height: 6
  - title: Open PRs
    name: Open PRs
    model: block-github-commits
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
    listen: {}
    row: 27
    col: 12
    width: 12
    height: 6

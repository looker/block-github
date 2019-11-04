- dashboard: commit_messages
  title: Commit Messages
  layout: newspaper
  elements:
  - title: Commits by Message Length
    name: Commits by Message Length
    model: block-github-commits
    explore: commit
    type: looker_scatter
    fields: [commit.count, commit.message_length, repository.name_formatted]
    pivots: [repository.name_formatted]
    filters: {}
    sorts: [commit.message_length, repository.name_formatted]
    limit: 130
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
    listen:
      Repository: repository.name_formatted
    row: 10
    col: 0
    width: 13
    height: 12
  - title: Message Length = 15
    name: Message Length = 15
    model: block-github-commits
    explore: commit
    type: looker_bar
    fields: [commit.message, commit.count]
    filters:
      commit.message_length: '15'
      repository.name_formatted: React
    sorts: [commit.count desc]
    limit: 500
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
    listen: {}
    row: 10
    col: 13
    width: 11
    height: 6
  - title: Top Words by Day of Week
    name: Top Words by Day of Week
    model: block-github-commits
    explore: commit
    type: looker_column
    fields: [commit.author_day_of_week, commit.count_of_add_messages, commit.count_of_fix_messages,
      commit.count_of_pr_messages, commit.count_of_remove_messages, commit.count_of_test_messages,
      commit.count_of_merge_messages, commit.count_of_close_messages, commit.count_of_docs_messages]
    fill_fields: [commit.author_day_of_week]
    filters: {}
    sorts: [commit.author_day_of_week]
    limit: 500
    column_limit: 50
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
    point_style: circle
    series_colors: {}
    series_labels:
      commit.count_of_add_messages: Add
      commit.count_of_fix_messages: Fix
      commit.count_of_pr_messages: Pull Request
      commit.count_of_remove_messages: Remove
      commit.count_of_test_messages: Test
      commit.count_of_merge_messages: Merge
      commit.count_of_close_messages: Close
      commit.count_of_docs_messages: Docs
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    swap_axes: false
    show_null_points: true
    up_color: "#3D52B9"
    down_color: "#08B248"
    total_color: "#A918B4"
    listen:
      Repository: repository.name_formatted
    row: 0
    col: 13
    width: 11
    height: 10
  - title: Top Commit Message Words
    name: Top Commit Message Words
    model: block-github-commits
    explore: commit
    type: looker_wordcloud
    fields: [dt_message_words.flattenedMessages, commit.count]
    filters: {}
    sorts: [commit.count desc]
    limit: 30
    column_limit: 50
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    listen:
      Repository: repository.name_formatted
    row: 0
    col: 0
    width: 13
    height: 10
  - title: Message Length = 29
    name: Message Length = 29
    model: block-github-commits
    explore: commit
    type: looker_bar
    fields: [commit.author_name, commit.count]
    filters:
      commit.message_length: '29'
    sorts: [commit.count desc]
    limit: 25
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
    row: 16
    col: 13
    width: 11
    height: 6
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

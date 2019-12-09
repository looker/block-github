include: "//@{CONFIG_PROJECT_NAME}/github_commits.view"

view: issue {
  extends: [issue_config]
}

view: issue_core {
  sql_table_name: @{GITHUB_SCHEMA}.issue ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension_group: closed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_week,
      hour_of_day,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.closed_at ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: locked {
    type: yesno
    sql: ${TABLE}.locked ;;
  }

  dimension: milestone_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.milestone_id ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  dimension: pull_request {
    type: yesno
    sql: ${TABLE}.pull_request ;;
  }

  dimension: repository_id {
    type: number
    sql: ${TABLE}.repository_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: is_open {
    type: yesno
    sql: CASE
      WHEN ${state} = 'open' THEN true
      ELSE false
      END;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    label: "Issue Count"
    type: count
    drill_fields: [detail*]
  }

  measure: avg_open_duration {
    type: average
    sql: TIMESTAMP_DIFF(${closed_raw}, ${created_raw}, DAY) ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      milestone.id,
      issue_label.count,
      issue_assignee.count,
      issue_closed_history.count,
      issue_mention.count,
      issue_renamed.count,
      pull_request.count,
      issue_milestone_history.count,
      issue_project_history.count,
      issue_label_history.count,
      issue_comment.count,
      issue_locked_history.count,
      issue_referenced.count,
      issue_merged.count,
      card.count,
      issue_assignee_history.count
    ]
  }
}

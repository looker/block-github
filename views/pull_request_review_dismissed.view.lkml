include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: pull_request_review_dismissed {
  extends: [pull_request_review_dismissed_config]
}

view: pull_request_review_dismissed_core {
  sql_table_name: @{GITHUB_SCHEMA}.pull_request_review_dismissed ;;

  dimension_group: _fivetran_synced {
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
    sql: ${TABLE}._fivetran_synced ;;
    hidden: yes
  }

  dimension: actor_id {
    type: number
    sql: ${TABLE}.actor_id ;;
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

  dimension: dismissal_commit_sha {
    type: string
    sql: ${TABLE}.dismissal_commit_sha ;;
  }

  dimension: dismissal_message {
    type: string
    sql: ${TABLE}.dismissal_message ;;
  }

  dimension: pull_request_review_id {
    type: number
    hidden: yes
    sql: ${TABLE}.pull_request_review_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  measure: count {
    type: count
    drill_fields: [pull_request_review.id]
  }
}
include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: pull_request_review {
  extends: [pull_request_review_config]
}

view: pull_request_review_core {
  sql_table_name: @{GITHUB_SCHEMA}.pull_request_review ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

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

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension: commit_sha {
    type: string
    sql: ${TABLE}.commit_sha ;;
  }

  dimension: pull_request_id {
    type: number
    hidden: yes
    sql: ${TABLE}.pull_request_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension_group: submitted {
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
    sql: ${TABLE}.submitted_at ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [id, pull_request.id, pull_request_review_dismissed.count]
  }
}
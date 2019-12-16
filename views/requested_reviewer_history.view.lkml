include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: requested_reviewer_history {
  extends: [requested_reviewer_history_config]
}

view: requested_reviewer_history_core {
  sql_table_name: @{GITHUB_SCHEMA}.requested_reviewer_history ;;

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
    hidden: yes
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

  dimension: pull_request_id {
    type: number
    hidden: yes
    sql: ${TABLE}.pull_request_id ;;
  }

  dimension: removed {
    type: yesno
    sql: ${TABLE}.removed ;;
  }

  dimension: requested_id {
    type: number
    sql: ${TABLE}.requested_id ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [pull_request.id]
  }
}
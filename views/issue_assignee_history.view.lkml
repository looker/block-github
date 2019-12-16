include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: issue_assignee_history {
  extends: [issue_assignee_history_config]
}

view: issue_assignee_history_core {
  sql_table_name: @{GITHUB_SCHEMA}.issue_assignee_history ;;

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
  }

  dimension: assigned {
    type: yesno
    sql: ${TABLE}.assigned ;;
  }

  dimension: assigner_id {
    type: number
    sql: ${TABLE}.assigner_id ;;
  }

  dimension: issue_id {
    type: number
    hidden: yes
    sql: ${TABLE}.issue_id ;;
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
    type: count
    drill_fields: [issue.id]
  }
}
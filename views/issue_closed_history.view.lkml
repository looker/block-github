include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: issue_closed_history {
  extends: [issue_closed_history_config]
}

view: issue_closed_history_core {
  sql_table_name: @{GITHUB_SCHEMA}.issue_closed_history ;;

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

  dimension: actor_id {
    type: number
    sql: ${TABLE}.actor_id ;;
  }

  dimension: closed {
    type: yesno
    sql: ${TABLE}.closed ;;
  }

  dimension: commit_sha {
    type: string
    sql: ${TABLE}.commit_sha ;;
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

  measure: count {
    type: count
    drill_fields: [issue.id]
  }
}
include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: issue_milestone_history {
  extends: [issue_milestone_history_config]
}

view: issue_milestone_history_core {
  sql_table_name: @{GITHUB_SCHEMA}.issue_milestone_history ;;

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

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.issue_id ;;
  }

  dimension: milestone_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.milestone_id ;;
  }

  dimension: milestoned {
    type: yesno
    sql: ${TABLE}.milestoned ;;
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
    drill_fields: [issue.id, milestone.id]
  }
}
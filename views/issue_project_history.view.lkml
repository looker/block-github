include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: issue_project_history {
  extends: [issue_project_history_config]
}

view: issue_project_history_core {
  sql_table_name: @{GITHUB_SCHEMA}.issue_project_history ;;

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

  dimension: card_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.card_id ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.column_name ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.issue_id ;;
  }

  dimension: previous_column_name {
    type: string
    sql: ${TABLE}.previous_column_name ;;
  }

  dimension: project_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension: removed {
    type: yesno
    sql: ${TABLE}.removed ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      column_name,
      previous_column_name,
      issue.id,
      project.name,
      project.id,
      card.id
    ]
  }
}
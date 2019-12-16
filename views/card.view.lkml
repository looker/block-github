include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: card {
  extends: [card_config]
}

view: card_core {
  sql_table_name: @{GITHUB_SCHEMA}.card ;;
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
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
  }

  dimension: column_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.column_id ;;
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

  dimension: creator_id {
    type: number
    sql: ${TABLE}.creator_id ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.issue_id ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
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
    drill_fields: [id, column.name, column.id, issue.id, issue_project_history.count]
  }
}
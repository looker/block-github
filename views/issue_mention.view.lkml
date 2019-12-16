include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: issue_mention {
  extends: [issue_mention_config]
}

view: issue_mention_core {
  sql_table_name: @{GITHUB_SCHEMA}.issue_mention ;;

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

  dimension: issue_id {
    type: number
    hidden: yes
    sql: ${TABLE}.issue_id ;;
  }

  dimension_group: updated {
    group_label: "Mention Info"
    label: "Mention Updated"
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
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    label: "Mention Count"
    type: count
    drill_fields: [issue.id]
  }
}
include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: issue_referenced {
  extends: [issue_referenced_config]
}

view: issue_referenced_core {
  sql_table_name: @{GITHUB_SCHEMA}.issue_referenced ;;

  dimension_group: _fivetran_synced {
    hidden: yes
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
    group_label: "Referenced Info"
    label: "Referenced Actor ID"
    type: number
    sql: ${TABLE}.actor_id ;;
  }

  dimension: commit_sha {
    group_label: "Referenced Info"
    label: "Referenced Commit SHA"
    type: string
    sql: ${TABLE}.commit_sha ;;
  }

  dimension: issue_id {
    type: number
    hidden: yes
    sql: ${TABLE}.issue_id ;;
  }

  dimension_group: referenced {
    group_label: "Referenced Info"
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
    sql: ${TABLE}.referenced_at ;;
  }

  measure: count {
    label: "Reference Count"
    type: count
    drill_fields: [issue.id]
  }
}
include: "//@{CONFIG_PROJECT_NAME}/github_commits.view"

view: issue_referenced {
  extends: [issue_referenced_config]
}

view: issue_referenced_core {
  sql_table_name: @{GITHUB_SCHEMA}.issue_referenced ;;

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

  dimension: commit_sha {
    type: string
    sql: ${TABLE}.commit_sha ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.issue_id ;;
  }

  dimension_group: referenced {
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
    type: count
    drill_fields: [issue.id]
  }
}

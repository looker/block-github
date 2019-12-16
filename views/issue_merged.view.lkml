include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: issue_merged {
  extends: [issue_merged_config]
}

view: issue_merged_core {
  sql_table_name: @{GITHUB_SCHEMA}.issue_merged ;;

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

  dimension: actor_id {
    group_label: "Merged Info"
    type: number
    sql: ${TABLE}.actor_id ;;
  }

  dimension: commit_sha {
    group_label: "Merged Info"
    type: string
    sql: ${TABLE}.commit_sha ;;
  }

  dimension: issue_id {
    type: number
    hidden: yes
    sql: ${TABLE}.issue_id ;;
  }

  dimension_group: merged {
    group_label: "Merged Info"
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
    sql: ${TABLE}.merged_at ;;
  }

  measure: count {
    label: "Merge Count"
    type: count
    drill_fields: [issue.id]
  }
}
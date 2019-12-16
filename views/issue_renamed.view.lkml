include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: issue_renamed {
  extends: [issue_renamed_config]
}

view: issue_renamed_core {
  sql_table_name: @{GITHUB_SCHEMA}.issue_renamed ;;

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
    group_label: "Renamed Info"
    label: "Actor ID"
    type: number
    sql: ${TABLE}.actor_id ;;
  }

  dimension: from_name {
    group_label: "Renamed Info"
    type: string
    sql: ${TABLE}.from_name ;;
  }

  dimension: issue_id {
    type: number
    hidden: yes
    sql: ${TABLE}.issue_id ;;
  }

  dimension: to_name {
    group_label: "Renamed Info"
    type: string
    sql: ${TABLE}.to_name ;;
  }


  dimension_group: updated {
    label: "Renamed"
    group_label: "Renamed Info"
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
    label: "Renamed Count"
    type: count
    drill_fields: [to_name, from_name, issue.id]
  }
}
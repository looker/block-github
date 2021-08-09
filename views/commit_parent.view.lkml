
view: commit_parent {
  sql_table_name: @{GITHUB_SCHEMA}.commit_parent ;;

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

  dimension: commit_sha {
    type: string
    sql: ${TABLE}.commit_sha ;;
  }

  dimension: parent_sha {
    type: string
    sql: ${TABLE}.parent_sha ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

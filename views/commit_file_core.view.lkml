include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: commit_file {
  extends: [commit_file_config]
}

view: commit_file_core {
  sql_table_name: @{GITHUB_SCHEMA}.commit_file ;;

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

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    sql: CONCAT(${TABLE}.filename, ' ', ${TABLE}.commit_sha) ;;
  }

  dimension: additions {
    type: number
    sql: ${TABLE}.additions ;;
  }

  dimension: changes {
    type: number
    sql: ${TABLE}.changes ;;
  }

  dimension: commit_sha {
    type: string
    sql: ${TABLE}.commit_sha ;;
  }

  dimension: deletions {
    type: number
    sql: ${TABLE}.deletions ;;
  }

  dimension: filename {
    type: string
    sql: ${TABLE}.filename ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [filename]
  }
}
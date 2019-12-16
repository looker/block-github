include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: user_email {
  extends: [user_email_config]
}

view: user_email_core {
  sql_table_name: @{GITHUB_SCHEMA}.user_email ;;

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
    hidden: yes
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [name, user.name, user.id]
  }
}
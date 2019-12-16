include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: team_membership {
  extends: [team_membership_config]
}

view: team_membership_core {
  sql_table_name: @{GITHUB_SCHEMA}.team_membership ;;

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

  dimension: team_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.team_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [team.name, team.id]
  }
}
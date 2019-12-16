include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: repo_team {
  extends: [repo_team_config]
}

view: repo_team_core {
  sql_table_name: @{GITHUB_SCHEMA}.repo_team ;;

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

  dimension: permission {
    type: string
    sql: ${TABLE}.permission ;;
  }

  dimension: repository_id {
    type: number
    sql: ${TABLE}.repository_id ;;
  }

  dimension: team_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.team_id ;;
  }

  measure: count {
    type: count
    drill_fields: [team.name, team.id]
  }
}
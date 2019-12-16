include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: team {
  extends: [team_config]
}

view: team_core {
  sql_table_name: @{GITHUB_SCHEMA}.team ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: org_id {
    type: number
    sql: ${TABLE}.org_id ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: privacy {
    type: string
    sql: ${TABLE}.privacy ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, team_membership.count, repo_team.count]
  }
}
include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: user {
  extends: [user_config]
}

view: user_core {
  sql_table_name: @{GITHUB_SCHEMA}.user ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

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

  dimension: bio {
    type: string
    sql: ${TABLE}.bio ;;
  }

  dimension: blog {
    type: string
    sql: ${TABLE}.blog ;;
  }

  dimension: company {
    type: string
    sql: LOWER(REPLACE(TRIM(${TABLE}.company), '@', '')) ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: hireable {
    type: yesno
    sql: ${TABLE}.hireable ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: login {
    type: string
    sql: ${TABLE}.login ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: head_user_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: base_user_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: site_admin {
    type: yesno
    sql: ${TABLE}.site_admin ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated {
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
    type: count
    drill_fields: [id, name, user_email.count]
  }

}
include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: issue_comment {
  extends: [issue_comment_config]
}

view: issue_comment_core {
  sql_table_name: @{GITHUB_SCHEMA}.issue_comment ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    primary_key: yes
    type: string
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

  dimension: body {
    group_label: "Comment Info"
    label: "Comment Body"
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension_group: created {
    group_label: "Comment Info"
    label: "Comment Created"
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

  dimension: issue_id {
    type: number
    hidden: yes
    sql: ${TABLE}.issue_id ;;
  }

  dimension_group: updated {
    group_label: "Comment Info"
    label: "Comment Updated"
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

  dimension: user_id {
    hidden: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    label: "Comment Count"
    type: count
    drill_fields: [id, issue.id]
  }
}
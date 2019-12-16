include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: pull_request {
  extends: [pull_request_config]
}

view: pull_request_core {
  sql_table_name: @{GITHUB_SCHEMA}.pull_request ;;
  drill_fields: [id]

  dimension: id {
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

  dimension: base_label {
    type: string
    sql: ${TABLE}.base_label ;;
  }

  dimension: base_ref {
    type: string
    sql: ${TABLE}.base_ref ;;
  }

  dimension: base_repo_id {
    type: number
    sql: ${TABLE}.base_repo_id ;;
    hidden: yes
  }

  dimension: base_sha {
    type: string
    sql: ${TABLE}.base_sha ;;
  }

  dimension: base_user_id {
    type: number
    sql: ${TABLE}.base_user_id ;;
    hidden: yes
  }

  dimension: head_label {
    type: string
    sql: ${TABLE}.head_label ;;
  }

  dimension: head_ref {
    type: string
    sql: ${TABLE}.head_ref ;;
  }

  dimension: head_repo_id {
    type: number
    sql: ${TABLE}.head_repo_id ;;
    hidden: yes
  }

  dimension: head_sha {
    type: string
    sql: ${TABLE}.head_sha ;;
  }

  dimension: head_user_id {
    type: number
    sql: ${TABLE}.head_user_id ;;
    hidden: yes
  }

  dimension: issue_id {
    type: number
    hidden: yes
    sql: ${TABLE}.issue_id ;;
  }

  dimension: merge_commit_sha {
    type: string
    sql: ${TABLE}.merge_commit_sha ;;
  }

  dimension: is_merged {
    type: yesno
    sql: ${merge_commit_sha} IS NULL ;;
  }

  measure: count {
    type: count
    drill_fields: [id, issue.id, requested_reviewer_history.count, pull_request_review.count]
  }
}
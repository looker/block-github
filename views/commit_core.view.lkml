include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: commit {
  extends: [commit_config]
}

view: commit_core {
  sql_table_name: @{GITHUB_SCHEMA}.commit ;;

  dimension_group: _fivetran_synced {
    type: time
    hidden:  yes
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

  dimension_group: author {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      day_of_week,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.author_date ;;
  }

  dimension: author_email {
    type: string
    sql: ${TABLE}.author_email ;;
  }

  dimension: author_name {
    type: string
    sql: ${TABLE}.author_name ;;

    link: {
      label: "GitHub User Page"
      url: "https://www.github.com/{{ user.login._value }}"
    }
  }

  dimension_group: committer {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      day_of_week,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.committer_date ;;
  }

  dimension: committer_email {
    type: string
    sql: ${TABLE}.committer_email ;;
  }

  dimension: committer_name {
    type: string
    sql: ${TABLE}.committer_name ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: repository_id {
    type: number
    hidden: yes
    sql: ${TABLE}.repository_id ;;
  }

  dimension: sha {
    primary_key: yes
    type: string
    sql: ${TABLE}.sha ;;
  }

  dimension: message_length {
    type: number
    sql: LENGTH(${TABLE}.message) ;;
  }

  measure: count {
    type: count
    drill_fields: [author_name, message, author_date]
  }

  ## email is an accurate count_distinct key

  measure:  author_count_distinct {
    description: "Unique authout count by email"
    type: count_distinct
    sql: ${author_email} ;;
  }

  measure: average_message_length {
    type: average
    sql: ${message_length} ;;
    value_format_name: decimal_1
  }

}

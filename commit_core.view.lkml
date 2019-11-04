include: "//@{CONFIG_PROJECT_NAME}/github_commits.view"

view: commit {
  extends: [commit_config]
}

view: commit_core {
  sql_table_name: github.commit ;;

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
    # hidden: yes
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

  measure: count_of_test_messages {
    type: count
    filters: {
      field: dt_message_words.flattenedMessages
      value: "test, tests"
    }
    drill_fields: [author_name, message, author_date]
  }

  measure: count_of_fix_messages {
    type: count
    filters: {
      field: dt_message_words.flattenedMessages
      value: "fix, fixes"
    }
    drill_fields: [author_name, message, author_date]
  }

  measure: count_of_merge_messages {
    type: count
    filters: {
      field: dt_message_words.flattenedMessages
      value: "Merge, merge"
    }
    drill_fields: [author_name, message, author_date]
  }

  measure: count_of_pr_messages {
    type: count
    filters: {
      field: dt_message_words.flattenedMessages
      value: "pull, request"
    }
    drill_fields: [author_name, message, author_date]
  }

  measure: count_of_add_messages {
    type: count
    filters: {
      field: dt_message_words.flattenedMessages
      value: "add, adds"
    }
    drill_fields: [author_name, message, author_date]
  }

  measure: count_of_remove_messages {
    type: count
    filters: {
      field: dt_message_words.flattenedMessages
      value: "remove, removes"
    }
    drill_fields: [author_name, message, author_date]
  }

  measure: count_of_close_messages {
    type: count
    filters: {
      field: dt_message_words.flattenedMessages
      value: "close, closed, Close"
    }
    drill_fields: [author_name, message, author_date]
  }

  measure: count_of_docs_messages {
    type: count
    filters: {
      field: dt_message_words.flattenedMessages
      value: "docs, docs:"
    }
    drill_fields: [author_name, message, author_date]
  }


  measure: average_message_length {
    type: average
    sql: ${message_length} ;;
  }
}

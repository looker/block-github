include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: repository {
  extends: [repository_config]
}

view: repository_core {
  sql_table_name: @{GITHUB_SCHEMA}.repository ;;
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

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
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

  dimension: default_branch {
    type: string
    sql: ${TABLE}.default_branch ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: fork {
    type: yesno
    sql: ${TABLE}.fork ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: homepage {
    type: string
    sql: ${TABLE}.homepage ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: name {
    type: string
    sql: REPLACE(${TABLE}.name, '-1', '') ;;
    link: {
      url:"http://github.com/@{COMPANY_DOMAIN}/{{ value }}"
      label: "View in GitHub"
    }
  }

  dimension: head_repo_name {
    type: string
    sql: ${name} ;;
  }
  dimension: name_formatted {
    type: string
    sql: CASE WHEN ${name} IN ('angular','angular.js', 'code.angularjs.org') THEN 'Angular'
              WHEN ${name} = 'react' THEN 'React'
              ELSE null
              END;;

      link: {
        label: "Commits Dashboard"
        url: "https://app.dev.looker.com/dashboards/534?Repository={{ value }}&filter_config=%7B%22Repository%22:%5B%7B%22type%22:%22%3D%22,%22values%22:%5B%7B%22constant%22:%22{{ value }}%22%7D,%7B%7D%5D,%22id%22:2%7D%5D%7D"
      }

      link: {
        label: "Commit Messages Dashboard"
        url: "https://app.dev.looker.com/dashboards/564?Repository=React&filter_config=%7B%22Repository%22:%5B%7B%22type%22:%22%3D%22,%22values%22:%5B%7B%22constant%22:%22{{ value }}%22%7D,%7B%7D%5D,%22id%22:8%7D%5D%7D"
      }
    }

    dimension: owner_id {
      type: number
      #hidden:  yes
      sql: ${TABLE}.owner_id ;;
    }

    dimension: private {
      type: yesno
      sql: ${TABLE}.private ;;
    }

    measure: count {
      type: count
      drill_fields: [id, full_name, name, commit.count]
    }
  }
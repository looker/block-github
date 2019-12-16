include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: dt_rank {
  extends: [dt_rank_config]
}

view: dt_rank_core {
  derived_table: {
    sql: SELECT
        user.id  AS user_id,
        COUNT(*) AS commit_count,
        rank() over (order by COUNT(sha) desc) as rank
      FROM @{GITHUB_SCHEMA}.commit  AS commit
      LEFT JOIN @{GITHUB_SCHEMA}.user_email  AS user_email ON commit.author_email = user_email.email
      LEFT JOIN @{GITHUB_SCHEMA}.user  AS user ON user_email.user_id = user.id

      GROUP BY 1
      ORDER BY 2 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: commit_count {
    type: number
    sql: ${TABLE}.commit_count ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  set: detail {
    fields: [user_id, commit_count, rank]
  }
}
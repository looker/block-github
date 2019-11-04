connection: "@{CONNECTION_NAME}"
include: "//@{CONFIG_PROJECT_NAME}/*.view"
include: "//@{CONFIG_PROJECT_NAME}/*.dashboard"
include: "*.view"
include: "*.dashboard"

# include all the views
include: "/views/**/*.view"

datagroup: block_github_commits_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: block_github_commits_default_datagroup

explore: commit {
  join: user_email {
    type: left_outer
    sql_on: ${commit.author_email} = ${user_email.email} ;;
    relationship: many_to_one
  }
  join: user {
    type: left_outer
    sql_on: ${user_email.user_id} = ${user.id} ;;
    relationship: one_to_one
  }
  join: commit_file {
    type: left_outer
    sql_on: ${commit.sha} = ${commit_file.commit_sha} ;;
    relationship: one_to_many
  }
  join: commit_parent {
    type: left_outer
    sql_on: ${commit.sha} = ${commit_parent.commit_sha} ;;
    relationship: one_to_many
  }
  join: repository {
    type: left_outer
    sql_on: ${commit.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }
  join: dt_rank {
    type: left_outer
    sql_on: ${user.id} = ${dt_rank.user_id} ;;
    relationship: one_to_one
  }
  join: dt_message_words {
    type: left_outer
    sql_on: ${commit.sha} = ${dt_message_words.sha} ;;
    relationship: one_to_many
  }
}

explore: commit_file {}

explore: commit_parent {}

explore: fivetran_audit {}

explore: repository {}

explore: user {}

explore: user_email {}

connection: "@{CONNECTION_NAME}"
include: "//@{CONFIG_PROJECT_NAME}/*.view"
include: "//@{CONFIG_PROJECT_NAME}/*.dashboard"
include: "views/*.view"
include: "*.dashboard"

datagroup: block_github_commits_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: block_github_commits_default_datagroup

explore: commit {
  extends: [commit_config]
}

explore: commit_core {
  extension: required
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
  join: repository {
    type: left_outer
    sql_on: ${commit.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }
  join: repository_owner {
    fields: [owner_name]
    view_label: "Repository"
    from: user
    type: left_outer
    sql_on: ${repository.owner_id} = ${repository_owner.id} ;;
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

explore: team {
  extends: [team_config]
}

explore: team_core {
  extension: required

  join: team_membership {
    fields: []
    type: left_outer
    sql_on: ${team.id} = ${team_membership.team_id} ;;
    relationship: one_to_many
  }
  join: user {
    type: left_outer
    sql_on: ${team_membership.user_id} = ${user.id} ;;
    relationship: one_to_many
  }
  join: user_email {
    type: left_outer
    sql_on: ${user.id} = ${user_email.user_id} ;;
    relationship: many_to_one
  }
  join: repo_team {
    type: left_outer
    sql_on: ${team.id} = ${repo_team.team_id} ;;
    relationship: one_to_one
  }

}

explore: pull_request {
  extends: [pull_request_config]
}

explore: pull_request_core {
  extension: required

  join: issue {
    from: user
    type: left_outer
    sql_on: ${pull_request.issue_id} = ${issue.id} ;;
    relationship: many_to_one
  }
  join: repository {
    type: left_outer
    sql_on: ${pull_request.base_repo_id} = ${repository.id} ;;
    relationship: many_to_one
  }
  join: requested_reviewer_history {
    type: left_outer
    sql_on: ${pull_request.id} = ${requested_reviewer_history.pull_request_id} ;;
    relationship: one_to_many
  }
  join: pull_request_review {
    type: left_outer
    sql_on: ${pull_request.id} = ${pull_request_review.pull_request_id};;
    relationship: one_to_many
  }
  join: reviewer {
    fields: [reviewer.name]
    from: user
    type: left_outer
    sql_on: ${reviewer.id} = ${pull_request_review.user_id} ;;
    relationship: many_to_one
  }
  join: pull_request_review_dismissed {
    type: left_outer
    sql_on: ${pull_request_review_dismissed.pull_request_review_id} = ${pull_request_review.id} ;;
    relationship: one_to_one
  }
  join: pull_request_head_user {
    view_label: "Pull Request"
    fields: [pull_request_head_user.head_user_name]
    from: user
    type: left_outer
    sql_on: ${pull_request_head_user.id} = ${pull_request.head_user_id} ;;
    relationship: many_to_one
  }
  join: reposityry_head {
    view_label: "Pull Request"
    fields: [reposityry_head.head_repo_name]
    from: repository
    type: left_outer
    sql_on: ${reposityry_head.id} = ${pull_request.head_repo_id} ;;
    relationship: many_to_one
  }

}

explore: issue {
  extends: [issue_config]
}

explore: issue_core {
  extension: required

  join: creator_user_info {
    from: user_core
    type: left_outer
    sql_on: ${issue.user_id} = ${creator_user_info.id} ;;
    relationship: one_to_many
  }
  join: issue_assignee {
    type: left_outer
    sql_on: ${issue.id} = ${issue_assignee.issue_id} ;;
    relationship: one_to_many
    fields: []
  }
  join: assignee_user_info {
    from: user_core
    type: left_outer
    sql_on: ${issue_assignee.user_id} = ${assignee_user_info.id} ;;
    relationship: one_to_many
  }
  join: issue_comment {
    view_label: "Issue"
    type: left_outer
    sql_on: ${issue.id} = ${issue_comment.issue_id} ;;
    relationship: one_to_many
  }
  join: comment_user_info {
    from: user_core
    type: left_outer
    sql_on: ${issue_comment.user_id} = ${comment_user_info.id} ;;
    relationship: one_to_one
  }
  join: issue_label {
    view_label: "Issue"
    type: left_outer
    sql_on: ${issue.id} = ${issue_label.issue_id} ;;
    relationship: one_to_one
  }
  join: issue_mention {
    view_label: "Issue"
    type: left_outer
    sql_on: ${issue.id} = ${issue_mention.issue_id} ;;
    relationship: one_to_one
  }
  join: mentioned_user_info {
    from: user_core
    type: left_outer
    sql_on: ${issue_mention.user_id} = ${mentioned_user_info.id} ;;
    relationship: one_to_one
  }
  join: issue_merged {
    view_label: "Issue"
    type: left_outer
    sql_on: ${issue.id} = ${issue_merged.issue_id} ;;
    relationship: one_to_one
  }
  join: merge_user_info {
    from: user_core
    type: left_outer
    sql_on: ${issue_merged.actor_id} = ${merge_user_info.id} ;;
    relationship: one_to_one
  }
  join: issue_referenced {
    view_label: "Issue"
    type: left_outer
    sql_on: ${issue.id} = ${issue_referenced.issue_id} ;;
    relationship: one_to_one
  }
  join: referenced_user_info {
    from: user_core
    type: left_outer
    sql_on: ${issue_referenced.actor_id} = ${referenced_user_info.id} ;;
    relationship: one_to_one
  }
  join: issue_renamed {
    view_label: "Issue"
    type: left_outer
    sql_on: ${issue.id} = ${issue_renamed.issue_id} ;;
    relationship: one_to_one
  }
  join: repository {
    type: left_outer
    sql_on: ${issue.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }


}

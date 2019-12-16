include: "//@{CONFIG_PROJECT_NAME}/github.view"

view: dt_message_words {
  extends: [dt_message_words_config]
}

view: dt_message_words_core {
  derived_table: {
#     persist_for: "24 hours"
  sql: WITH setup AS (
    SELECT sha, SPLIT(message, ' ') as messageAsArray
    FROM @{GITHUB_SCHEMA}.commit
    )

    SELECT sha, flattenedMessages
    FROM setup
    CROSS JOIN UNNEST(setup.messageAsArray) AS flattenedMessages
    WHERE LOWER(flattenedMessages) NOT IN ('to','the','in','for','from','and','a','of','is','that','on','with','not','be', 'it','when','as','this','an','are','we','by','was','if', 'can', 'this', 'which', 'so');;
}

dimension: sha {
  type: string
}

dimension: flattenedMessages {
  type: string
}

measure: count {
  type: count
}
}
project_name: "block-github-commits"

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
  override_constant: GITHUB_SCHEMA {
    value: "@{GITHUB_SCHEMA}"
  }
}

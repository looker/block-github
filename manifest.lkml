project_name: "block-github"

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
  override_constant: GITHUB_SCHEMA {
    value: "@{GITHUB_SCHEMA}"
  }
  override_constant: COMPANY_DOMAIN {
    value: "@{COMPANY_DOMAIN}"
  }
}

constant: CONFIG_PROJECT_NAME {
  value: "block-github-config"
  export: override_required
}

constant: CONNECTION_NAME {
  value: "static_data"
  export: override_required
}

constant: GITHUB_SCHEMA {
  value: "github_skeleton"
  export: override_required
}

constant: COMPANY_DOMAIN {
  value: "highspew"
  export: override_required
}

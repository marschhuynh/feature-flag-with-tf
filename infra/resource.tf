# Declare project
resource "launchdarkly_project" "default_project" {
  name = var.project_name
  key  = var.project_key

  environments {
    key   = "production"
    name  = "Production"
    color = "57CE55"
    tags  = ["terraform"]
  }
  environments {
    key   = "staging"
    name  = "Staging"
    color = "E8D930"
    tags  = ["terraform", "staging"]
  }
  environments {
    key   = "testing"
    name  = "Testing"
    color = "B730E8"
    tags  = ["terraform", "testing"]
  }
}

# Declare feature flag
resource "launchdarkly_feature_flag" "show_green_block" {
  project_key = launchdarkly_project.default_project.key
  key         = "show-green-block"
  name        = "Show green block"
  description = "Just show a green block"

  variation_type = "boolean"
  variations {
    value       = "true"
    name        = "On"
    description = "Show"
  }
  variations {
    value       = "false"
    name        = "Off"
    description = "Hidden"
  }
}

resource "launchdarkly_feature_flag" "show_red_block" {
  project_key = launchdarkly_project.default_project.key
  key         = "show-red-block"
  name        = "Show red block"
  description = "Just show a red block"

  variation_type = "boolean"
  variations {
    value       = "true"
    name        = "On"
    description = "Show"
  }
  variations {
    value       = "false"
    name        = "Off"
    description = "Hidden"
  }
}

resource "launchdarkly_feature_flag" "show_yellow_block" {
  project_key = launchdarkly_project.default_project.key
  key         = "show-yellow-block"
  name        = "Show yellow block"
  description = "Just show a yellow block"

  variation_type = "boolean"
  variations {
    value       = "true"
    name        = "On"
    description = "Show"
  }
  variations {
    value       = "false"
    name        = "Off"
    description = "Hidden"
  }
}

resource "launchdarkly_feature_flag_environment" "green-on-testing" {
  flag_id = launchdarkly_feature_flag.show_green_block.id
  env_key = "testing"

  on = true
  fallthrough {
    variation = 0
  }
  off_variation = 1
}

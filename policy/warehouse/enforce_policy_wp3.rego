package terraform
import future.keywords.in
deny[msg] {
	sf_resource := input.planned_values.root_module.child_modules[_].resources[_]
	sf_type := sf_resource.type
    sf_type == "snowflake_warehouse"
    sf_wh_scaling_policy := sf_resource.values.scaling_policy
    not sf_wh_scaling_policy == "STANDARD"
    msg := sprintf("Scaling Policy Economy is not allowed",[])
}
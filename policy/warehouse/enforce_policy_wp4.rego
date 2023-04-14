package terraform
import future.keywords.in
# 5. Policy to allow only standard formatted warehouse name.
deny[msg] {
	sf_resource := input.planned_values.root_module.child_modules[_].resources[_]
	sf_type := sf_resource.type
    sf_type == "snowflake_warehouse"
    sf_wh_name := sf_resource.values.name
    wh_name_prefix := "LTI_"
    not startswith(sf_wh_name,wh_name_prefix)
    msg := sprintf("Warehouse name should start with the prefix '%v'",[wh_name_prefix])
}
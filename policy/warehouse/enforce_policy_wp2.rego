package terraform
import future.keywords.in
deny[msg] {
	sf_resource := input.planned_values.root_module.child_modules[_].resources[_]
	sf_type := sf_resource.type
    sf_type == "snowflake_warehouse"
	sf_wh_max_cluster_count := sf_resource.values.max_cluster_count
    sf_wh_min_cluster_count := sf_resource.values.min_cluster_count
    not sf_wh_min_cluster_count <= sf_wh_max_cluster_count
    msg := sprintf("Snowflake warehouse min_cluster_count more than max_cluster_count is not allowed",[])
}
#OUTPUT RDS
output "rds_bsd" {
  description = "rds_bsd"
  value       = [
                  "${aws_rds_cluster_instance.rds_bsd_instance}"
                ]
}
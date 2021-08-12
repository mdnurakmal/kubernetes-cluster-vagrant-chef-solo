# Etcd
etcd_service 'default' do
  action %w(create start)
end

# Kubernetes cluster

kube_apiserver 'default' do
  service_cluster_ip_range '10.0.0.1/24'
  etcd_servers 'http://127.0.0.1:2379'
  insecure_bind_address '0.0.0.0'
  action %w(create start)
end

group 'docker' do
  members %w(kubernetes)
end

kube_scheduler 'default' do
  master '127.0.0.1:8080'
  action %w(create start)
end

kube_controller_manager 'default' do
  master '127.0.0.1:8080'
  action %w(create start)
end

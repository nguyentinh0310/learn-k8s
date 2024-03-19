
| Command | Giải thích câu lệnh |
|-----------------|-----------------|
| `kubectl get nodes` | Danh sách các Node trong Cluster |
| `kubectl describe node name-node`   | Thông tin chi tiết về Node có tên name-node  |
| `kubectl get pods`   | Liệt kê các pod ở namespace mặc định |
| `kubectl get pod -o wide`   | Hiện thị nhiều thông tin hơn |
| `kubectl get pod -o wide --show-labels`   | Hiện thị thông tin pod kèm label |
| `kubectl get pods -o wide -n namespace-name`   | Pod ở namepace: kubernetes-dashboard |
| `kubectl get pods -l "app=pod-name`   | Liệt kê các Pod có nhãn "app:pod-name" |
| `kubectl get pods -A`   | Pod ở tất cả các namespace |
| `kubectl describe pod/namepod`   | Xem thông tin mô tả chi tiết của Pod |
| `kubectl explain pod --recursive=true`   | Xem cấu trúc mẫu định nghĩa POD trong file cấu hình yaml |
| `kubectl apply -f pod.yaml`   | Triển khai tạo các tài nguyên định nghĩa trong file pod.yaml |
| `kubectl delete -f pod.yaml`   | Xóa các tài nguyên tạo ra từ định nghĩa firstpod.yaml |
| `kubectl exec mypod command`   | 	Chạy lệnh từ container của POD có tên mypod, nếu POD có nhiều container thêm vào tham số -c và tên container |
| `kubectl exec -it mypod bash`   | Chạy lệnh bash của container trong POD mypod và gắn terminal |
| `kubectl proxy`   | Liệt kê các pod ở namespace mặc định |
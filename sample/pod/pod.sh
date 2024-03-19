# Liệt kê các pod ở namespace mặc định
kubectl get pods

# Hiện thị nhiều thông tin hơn
kubectl get pod -o wide

# Hiện thị thông tin pod kèm label
kubectl get pod -o wide --show-labels

# Pod ở namepace: kubernetes-dashboard
kubectl get pod -o wide -n namespace-name

# Liệt kê các Pod có nhãn "app:pod-name"
kubectl get pod -l "app=pod-name"

# Pod ở tất cả các namespace
kubectl get pod -A

# Xem thông tin mô tả chi tiết của Pod
kubectl describe pod/namepod

# Log của pod tên là pod-name
kubectl logs pod/pod-name

# Log tất cả các Pod có label là app=pod-name
kubectl logs -l "app=pod-name"

# Exec vào trong Pod để chạy lệnh, nếu có nhiều container trong Pod thì chỉ định container bằng tham số -c
kubectl exec pod-name command
kubectl exec pod-name -c container-name command

# Chạy lệnh bash của container trong POD pod-name và gắn terminal
kubectl exec -it pod-name bash

# Xem cấu trúc mẫu định nghĩa POD trong file cấu hình yaml
kubectl explain pod --recursive=true	

# Triển khai tạo các tài nguyên định nghĩa trong file firstpod.yaml
kubectl apply -f firstpod.yaml	

# Xóa pod theo tên
kubectl delete pod/pod-name

# Xóa pod bằng chính file khai báo pod
kubectl delete -f pod-name.yaml
<h1 align="center">Pod Container</h1>

### 1. Resource

Resource là một loại tài nguyên được kubernetes quản lý như namespace, pods, volume, service, serviceaccount, configMap, secret,…
Một số câu lệnh truy xuất thông tin

```bash
kubectl get <resource-type> # kubectl get nodes
kubectl describe <resource-type> <resource-name> # kubectl describe node node1
```

Các loại resource K8s:

<div align="center">
  <div><img src="/assets/images/resource.png" alt="kubectl api-resources"></div>
  <span>Xem danh sách lệnh:</span><b>kubectl api-resources</b>
</div>

### 2. YAML

- Là một loại format thay thế cho XML, JSON vì nó dễ đọc hơn
- Rất nhiều các thư viện hỗ trợ định dạng YAML
- Sử dụng cho Ansible, docker-compose, Cloudformation, ...

<div align="center">
  <div><img src="/assets/images/yaml.png" alt="Cú pháp YAML"></div>
  <a href="https://developer.ibm.com/tutorials/yaml-basics-and-usage-in-kubernetes/">Cú pháp YAML</a>
</div>

### 3. Pod - Container

**Pod**: đơn vị quản lý nhỏ nhất của Kubernetes. Một pod có thể chứa 1 hoặc nhiều container.
**Containers** trên cùng 1 pod sẽ share storage, network và có chung life cycle.
Communication between Pods: Các Pod có thể giao tiếp với nhau thông qua một thư mục chung.
Có thể triển khai nhiều hơn 1 container trên 1 pod, vd 1 container chính & 1 container phụ làm nhiệm vụ hỗ trợ (sidecar).

> Lưu ý: Không triển khai 2 container cùng loại trên 1 pod.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: "MYAPP"
  namespace: default
  labels:
    app: "MYAPP"
spec:
  # khai báo host cho pod
  hostAliases:
    - ip: "127.0.0.1"
      hostnames:
        - "mylocalhost"
  # Chứa các container được chạy trước khi các container chính được khởi chạy.
  initContainers:
    - name: init-container-init-container
      image: busybox
      command: ["sh", "-c", "some-command-here"]
  # Thông tin chi tiết cho các container
  containers:
    - name: MYAPP
      image: "busybox:latest"
      resources:
        limits:
          cpu: 200m
          memory: 500Mi
        requests:
          cpu: 100m
          memory: 200Mi
      env:
        - name: DB_HOST
          valueFrom:
            configMapKeyRef:
              name: MYAPP
              key: DB_HOST
      ports:
        - containerPort: 80
          name: http
      volumeMounts:
        - name: localtime
          mountPath: /etc/localtime
  # Khai báo Volume cho Pod
  volumes:
    - name: localtime
      hostPath:
        path: /usr/share/zoneinfo/Asia/
  # Có 3 giá trị là Always, OnFailure, và Never
  restartPolicy: Always
  # tham số lựa chọn Node để schedule pod lên node đó.
  nodeSelector:
    disktype: ssd
  # đối tượng khai báo các thuộc tính liên quan tới schedule Pod
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: kubernetes.io/hostname
                operator: Exists
```

Chú thích:

- **kind**: Phân loại tài nguyên (Pod, Deployment, Service...)
- **metadata**: Chứa thông tin metadata của Pod, có thể kể tới một số tham số chính như tên pod, label...
- **spec**: Đây là phần quan trọng nhất, nơi chứa các thông tin khai báo cho Pod và cho các Container trong Pod
  - **hostAliases**: Giống như ta khai báo host trong file /etc/hosts của máy chủ vậy. Nhưng ở đây ta khai báo cho Pod
  - **initContainers**: Tương tự containers, tuy nhiên đảm bảo chạy trước containers (Install or download thông tin trước khi sử dụng)
  - **container**: Định nghĩa thông tin chi tiết cho các container của Pod.
  - **volumes**: Khai báo Volume cho Pod. Volume có thể lấy từ `ConfigMap`, `PV/PVC`,...
  - **restartPolicy**: Có 3 giá trị là `Always`, `OnFailure`, và `Never`.
  - **nodeSelector**: tham số lựa chọn Node để schedule pod lên node đó.
  - **affinity**: Là đối tượng khai báo các thuộc tính liên quan tới schedule Pod.
    - **NodeAffinity/NodeAntiaffinity**: Định nghĩa việc lựa chọn/không lựa chọn triển khai Pod trên một Node theo tiêu chí nào đó.
    - **PodAffinity/PodAntiaffinity**: Định nghĩa việc lựa chọn/không lựa chọn triển khai Pod trên một Node phụ thuộc vào một Pod nào đó.

**Một số lệnh cơ bản**

- [Bảng giải thích câu lệnh](/sample/pod/pod.md)
- [Code giải thích câu lệnh](/sample/pod/pod.sh)

### 4. Namespace

Namespace trong Kubernetes là một cách logical để phân chia tài nguyên cluster giữa các nhóm resource.
Mỗi namespace cung cấp một phạm vi cho các tên của tài nguyên. Tài nguyên trong một namespace là riêng biệt và không thể truy cập được từ các namespace khác.
Namespace không thể lồng nhau.
Kubernetes đã có sẵn 4 namespace được tạo sẵn, đó là default, kube-public, kube-system và kube-node-lease:
- **default**: Khi thao tác với các tài nguyên ở mức namespace mà không chỉ định cụ thể Namespace nào
- **kube-system**:  Các thành phần Control Plane của K8S được triển khai ở namespace này. Thường thì chúng ta không triển khai các ứng dụng hay workload gì vào namespace này.
- **kube-public**: Các tài nguyên được triển khai ở Namespace kube-public có thể được truy cập công khai trong toàn bộ cụm Kubernetes này.
- **kube-node-lease**: Giữ những object Lease, để kubelet báo các hearbeat về control plane → 1 đang health check

<div align="center">
  <div><img src="/assets/images/namespace.jpeg" alt="Cú pháp YAML"></div>
  <a href="https://developer.ibm.com/tutorials/yaml-basics-and-usage-in-kubernetes/">Cú pháp YAML</a>
</div>

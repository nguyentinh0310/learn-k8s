<h1 align="center">Tổng quan về K8S và Cluster</h1>

### Giới thiệu Kubernetes?

Container Orchestration phát triển bởi Google.
Kubernetes giúp quản lý và tự động hoá việc triển khai các container, đồng thời cung cấp khả năng mở rộng và linh hoạt cho ứng dụng của bạn. Nó là một công cụ quan trọng trong việc xây dựng hệ thống phân tán và hiệu quả.

### Container Orchestration là gì?

Container Orchestration là quá trình tự động hóa việc triển khai, quản lý, mở rộng, di chuyển và giám sát container. Các công nghệ như Kubernetes, Docker Swarm và Mesos được thiết kế để giúp trong việc quản lý các container.
Các công việc cụ thể mà container orchestration có thể thực hiện bao gồm:

- Quản lý vòng đời container.
- Cung cấp khả năng mở rộng tự động (Auto scaling).
- Cung cấp khả năng phục hồi (recovery).
- Load Balancer trên các container
- Cung cấp kênh giao tiếp giữa các container (Networking).
- Cung cấp cơ chế bảo mật cho các container (Security).
- Quản lý việc cấp phát tài nguyên cho các container.

<p align="center">
  <img src="/assets/images/container-orchestration.png" width="900" alt="Container Orchestration">
</p>

### Tính năng Kubernetes?

1. **Storage Orchestration**: Quản lý và phân phối tài nguyên lưu trữ tự động và linh hoạt cho các ứng dụng, hỗ trợ nhiều loại lưu trữ khác nhau.
2. **Secret and configuration management**: Bảo vệ và quản lý thông tin nhạy cảm cũng như cấu hình ứng dụng thông qua các cơ chế như Secret và ConfigMap.
3. **Automatic bin packing**: Tối ưu hóa việc sử dụng tài nguyên máy chủ bằng cách tự động đặt các container trên các nút máy chủ.
4. **Automated rollouts and rollbacks**: Tự động triển khai và kiểm soát phiên bản của ứng dụng, cũng như thu hồi tự động trong trường hợp lỗi.
5. **Self-healing**: Giám sát và tự động khôi phục sức khỏe của các container và server, đảm bảo tính ổn định của hệ thống.
6. **Service discovery and load balancing**: Dễ dàng phát hiện và truy cập các dịch vụ trong mạng cụm, cũng như tự động cân bằng tải giữa các phiên bản của dịch vụ.

<p align="center">
  <img src="/assets/images/feature-k8s.jpeg" width="900" alt="Container Orchestration">
</p>

### Kubernetes architecture

Mô hình đơn giản của một K8s cluster gồm `Master Node` (Control Plane) và `Worker Node`.

<div align="center">
  <div><img src="/assets/images/kubernetes-architecture.png" alt="Container Orchestration"></div>
  <a href="https://kubernetes.io/docs/concepts/overview/components/">Kubernetes architecture</a>
</div>

**Kubernetes cluster bao gồm các thành phần sau:**

- Các thành phần bên trong Control Plane (Master node).

  - **API Server**: Entrypoint của K8s Cluster cho việc quản lý cluster và tương tác với các thành phần khác.
  - **Controller Manager**: Giám sát trạng thái của cluster và thực hiện các tác vụ điều khiển như quản lý replica sets, deployments, và services. 
  - **Scheduler**: Quản lý và phân phối các công việc (pods) trên các worker node dựa trên tài nguyên và yêu cầu. 
  - **etcd**: lưu trữ & đảm bảo tính nhất quán của cluster data (key:value)

- Các thành phần bên trong Worker node.
  - **kubelet**:  Giao tiếp với master node và quản lý các container trên node đó.
  - **k-proxy**: Quản lý dịch vụ mạng và cung cấp kết nối mạng cho các pod.
  - **Container runtime**: Môi trường chạy các container, ví dụ như Docker hoặc containerd. 
- **Cluster** là cụm các node, được kết nối với nhau và chịu sự quản lý của control-plane
- **Master node** là node có nhiệm vụ điều khiển, phần phối resource tới các node khác.
- **Node** (Worker node) là các thiết bị máy chủ là vật lý hoặc ảo hóa, dùng để chạy chương trình dạng container. Node sẽ có `kubelet` là service chạy ngầm điểu khiển.
- **Pod** là 1 đơn vị thực thi trên k8s cluster. Pod có thể chứa 1 hoặc nhiều application hoặc nhiều. Là đơn vị nhỏ nhất mà k8s có thể Deploy. Chứa các container là các application.
- **Container** là đơn vị nhỏ nhất của một hệ thống sử dụng container - microservice. Trong đó các thành phần như web, db, cache, in-memory service,... sẽ được đóng gói lại thành các container.
- **Service**: Đại diện cho một nhóm các pod và cung cấp một địa chỉ IP ổn định và tên miền để truy cập vào nhóm đó. 
- **Volume**: Cung cấp một cơ chế lưu trữ dữ liệu cho các container trong pod. 
- **Namespace**: Tách biệt và phân loại các tài nguyên trong cluster thành các nhóm logic khác nhau. 
- **kubectl**: command line tool giúp tương tác với Kubernetes cluster

### Tài liệu tham khảo

- [Container Orchestration](https://sunteco.vn/blog/kien-thuc-cloud/container-orchestration-giai-thich-va-tam-quan-trong-trong-quan-ly-ung-dung/)
- [Các thành phần trong Kubernetes](https://devops.vinahost.vn/Containers-Orchestration/Kubernetes/Kubernetes/#kubernetes-la-gi)
- [Cách làm việc với Kubernetes cluster](https://gcloudvn.com/kienthuc/kubernetes-cluster-la-gi/)
- [Tổng quan các thành phần của kubernetes](https://viblo.asia/p/k8s-basic-tong-quan-cac-thanh-phan-cua-kubernetes-aAY4ql7qVPw)

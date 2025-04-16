```bash
helm repo add csi-driver-smb https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/charts
helm install csi-driver-smb csi-driver-smb/csi-driver-smb --namespace kube-system --version v1.17.0

kubectl create secret generic smbcreds --from-literal username=USERNAME --from-literal password="PASSWORD"
kubectl create -f https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/deploy/example/smb-provisioner/smb-server-networkdisk.yaml

kubectl apply -f smb-storag-class.yml
kubectl apply -f test.yml
```
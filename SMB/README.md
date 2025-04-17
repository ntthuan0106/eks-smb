```bash
# Install smb csi driver
helm repo add csi-driver-smb https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/charts
helm install csi-driver-smb csi-driver-smb/csi-driver-smb --namespace kube-system --version v1.17.0
# Uninstall smb csi drver if needed
helm uninstall csi-driver-smb -n kube-system

# ADD secret
kubectl create secret generic smbcreds --from-literal username=USERNAME --from-literal password="PASSWORD"
#Create a Samba Server deployment on the network disk
kubectl create -f https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/deploy/example/smb-provisioner/smb-server-networkdisk.yaml

kubectl apply -f smb-storag-class.yml
kubectl apply -f test.yml

aws eks describe-cluster --name thuan-eks --query "cluster.identity.oidc.issuer" --output text
```
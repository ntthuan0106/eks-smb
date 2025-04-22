```bash
# Install smb csi driver
helm repo add csi-driver-smb https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/charts
helm install csi-driver-smb csi-driver-smb/csi-driver-smb --namespace kube-system --version v1.17.0
# Uninstall smb csi drver if needed
helm uninstall csi-driver-smb -n kube-system

# ADD secret
kubectl create secret generic smbcreds --from-literal username=USERNAME --from-literal password="PASSWORD"
#Create a Samba Server deployment on the network disk
kubectl apply -f smb-server-networkdisk.yml

kubectl apply -f smb-storage-class.yml
kubectl apply -f ebs-storage-class.yml
kubectl apply -f pwsh-smb.yml

aws eks describe-cluster --name thuan-eks --query "cluster.identity.oidc.issuer" --output text
```

```bash
oidc_id=$(aws eks describe-cluster --name thuan-eks --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5)
echo $oidc_id

eksctl utils associate-iam-oidc-provider --cluster thuan-eks --approve

eksctl create iamserviceaccount \
        --name ebs-csi-controller-sa \
        --namespace kube-system \
        --cluster thuan-eks \
        --role-name AmazonEKS_EBS_CSI_DriverRole \
        --role-only \
        --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
        --approve

kubectl annotate serviceaccount \
  -n kube-system ebs-csi-controller-sa \
  eks.amazonaws.com/role-arn=arn:aws:iam::492804330065:role/SAP-dev-ebs-csi-iam-role \
  --overwrite


aws eks describe-addon --cluster-name thuan-eks --addon-name aws-ebs-csi-driver

kubectl get pod smb-server-9f999cd64-57zzf  -o jsonpath="{.spec.containers[*].image}"
kubectl exec -it alpine-3-20-deployment-6b65d4ff85-thhbg -- /bin/sh
kubectl exec -it alpine-3-21-deployment-6f75958446-nlkj7 -- /bin/sh
kubectl exec -it smb-server-9f999cd64-57zzf -- /bin/sh
492804330065.dkr.ecr.us-east-1.amazonaws.com/thuan-ecr/smb:v3.21.3
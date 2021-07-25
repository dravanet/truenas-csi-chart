# github.com/dravanet/truenas-csi-chart

## Preparations

You'll need a TrueNAS instance, it is recommended to create a dataset to hold volumes. In TrueNAS interface, create an apikey which will be used for authentication.

On nodes, where volumes will be mounted, nfs and iscsi support should be present, on debian based systems `nfs-common` and `open-iscsi` packages are needed for that.

## Quickstart

For a quick deployment, copy [local.yaml.sample](local.yaml.sample) to `local.yaml`, edit parameters in controller section:

- `default.apiurl`, `default.apikey` for api access
- `default.configurations.default.dataset`
- `default.iscsi.portal`, `default.iscsi.portalid` for iscsi based volumes (RWO)
- `default.nfs.server`, `default.nfs.allowedhosts`, `default.nfs.allowednetworks` for nfs based volumes (RWX)

Then install to a dedicated namespace:

```shell
$ kubectl create ns truenas-csi
$ helm install truenas-csi --namespace=truenas-csi -f local.yaml .
```

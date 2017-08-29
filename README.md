# Dotfiles

## Neovim Setup:

### To install Neovim on Ubuntu 16.04

```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install python-dev python-pip python3-dev python3-pip
```

### Install vim-plug plugin manager:

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

```go
func (vs *volumeSnapshotter) CreateVolumeSnapshot(snapshot *crdv1.VolumeSnapshot) {
    snapshotName := cache.MakeSnapshotName(snapshot.Metadata.Namespace, snapshot.Metadata.Name)
    operationName := snapshotOpCreatePrefix + snapshotName + snapshot.Spec.PersistentVolumeClaimName
    glog.Infof("Snapshotter is about to create volume snapshot operation named %s, spec %#v", operationName, snapshot.Spec)

    err := vs.runningOperation.Run(operationName, vs.getSnapshotCreateFunc(snapshotName, snapshot))

    if err != nil {
        switch {
        case goroutinemap.IsAlreadyExists(err):
            glog.V(4).Infof("operation %q is already running, skipping", operationName)
        case exponentialbackoff.IsExponentialBackoff(err):
            glog.V(4).Infof("operation %q postponed due to exponential backoff", operationName)
        default:
            glog.Errorf("Failed to schedule the operation %q: %v", operationName, err)
        }
    }   
}
```

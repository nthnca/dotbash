# Takes the name of the VM you want to start
export GCE_DEFAULT_ZONE=us-west1-c

alias gcels="gcloud compute instances list"

function gcestart() {
  if [ $# -ne 1 ]; then
    echo "Usage: gcestart <vmname>"
    return
  fi

  gcloud compute instances start "$1" --zone=$GCE_DEFAULT_ZONE

  # Collapse ssh Host entries back to their expected values.
  #sed -i "" "s/Host \(.*\) \1./Host \1./g" ~/.ssh/config

  #gcloud compute config-ssh

  # Expand ssh Host entries to add a simple shortcut.
  #sed -i "" "s/Host \([^. ]*\)[.]/Host \1 \1./g" ~/.ssh/config
}

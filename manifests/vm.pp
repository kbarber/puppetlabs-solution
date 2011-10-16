define solution::vm($cpu, $memory, $classes) {
  #notify {"new_vm_${name}": message => "CPU: ${cpu} Memory: ${memory} Classes: ${classes}" }

  $disks = [
      { image => "deb-wheezy-amd64-2",
        driver => "qcow2",
        target => "vda" },{}
  ]

  $nics = [
     { network => "internal",
       model => "virtio" },{}
  ]

  onevm { "${name}":
    memory => "${memory}",
    cpu => $cpu,
    vcpu => $cpu,
    os_arch => "x86_64",
    disks => $disks,
    nics => $nics,
    graphics_type => "vnc",
    graphics_listen => "0.0.0.0",
    context => {
      hostname => '$NAME',
      gateway => '$NETWORK[GATEWAY]',
      dns => '$NETWORK[DNS]',
      ip => '$NIC[IP]',
      files => ['/var/lib/one/context/init.sh'],
      target => "vdb",
      puppet_environment => "onedemo",
    },
  }

  @@solution::export_classes { "export_${name}":
    params => $classes,
    tag => "vm_${name}",
  }

}

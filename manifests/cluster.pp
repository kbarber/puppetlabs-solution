define solution::cluster($cpu, $memory, $classes, $nodes, $domain) {
   # Get an array of nodes to create
   $node_list = split(inline_template("<% for i in (1..${nodes}) do %>${name}<%= i.to_s %>.${domain},<% end %>"), ",")
   #notify { $node_list: message => "new node" }

   # Pass the array in to create multiple vms
   solution::vm { $node_list:
    cpu => $cpu,
    memory => $memory,
    classes => $classes,
  }
}

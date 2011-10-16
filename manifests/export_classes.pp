define solution::export_classes($params) {
  #notify { "export_classes_${name}": message => $params }
  create_resources("class", $params)
}

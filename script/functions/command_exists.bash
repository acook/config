function command_exists {
  return command -v foo >/dev/null 2>&1
  return $?
}

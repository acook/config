function parse_commandline_options {
  while getopts ":n" opt; do
    case $opt in
      n)
        noninteractive='true'
        ;;
      \?)
        echo "Ignoring invalid option: -$OPTARG" >&2
        ;;
    esac
  done
}

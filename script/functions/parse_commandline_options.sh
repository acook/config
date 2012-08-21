function parse_commandline_options {
  export noninteractive='false'

  while getopts ":n" opt; do
    case $opt in
      n)
        export noninteractive='true'
        ;;
      \?)
        echo "Ignoring invalid option: -$OPTARG" >&2
        ;;
    esac
  done
}

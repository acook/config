function broken_symlink {
  [[ -L $1 && ! -e $1 ]]
}

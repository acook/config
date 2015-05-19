function pre_install {

  if [[ $noninteractive != 'true' ]]; then
    echo "Setting up git... (pass -n to skip this in the future)."
    echo -ne "git name: "
    read git_name
    echo -ne "git email: "
    read git_email
    echo -ne "github username: "
    read github_username
  fi

}

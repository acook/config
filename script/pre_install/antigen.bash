function pre_install {

  if [[ $noninteractive != 'true' ]]; then
    echo "Do you want to install Antigen for ZSH?"

    until [[ $antigen_confirm != '' ]]; do
      echo -ne "(y/n): "
      read antigen_confirm
    done
  else
    export antigen_confirm=y
  fi

}

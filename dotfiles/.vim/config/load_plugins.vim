" initialize pathogen and load all the plugins in .vim/bundle
runtime bundle/plugin-pathogen/autoload/pathogen.vim
execute pathogen#infect()

python from powerline.ext.vim import source_plugin; source_plugin()

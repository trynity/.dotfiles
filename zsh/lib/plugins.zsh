plugins=()

(($+commands[brew])) && plugins+=brew
(($+commands[bundler])) && plugins+=bundler
(($+commands[cpanm])) && plugins+=cpanm
(($+commands[gem])) && plugins+=gem
(($+commands[git])) && plugins+=git
(($+commands[git-extras])) && plugins+=git-extras
(($+commands[gpg-agent])) && plugins+=gpg-agent
(($+commands[heroku])) && plugins+=heroku
(($+commands[hg])) && plugins+=mercurial
(($+commands[hub])) && plugins+=hub
(($+commands[knife])) && plugins+=knife
(($+commands[nanoc])) && plugins+=nanoc
(($+commands[node])) && plugins+=node
(($+commands[npm])) && plugins+=npm
(($+commands[pip])) && plugins+=pip
(($+commands[perl])) && plugins+=perl
(($+commands[rvm])) && plugins+=rvm
(($+commands[svn])) && plugins+=svn
(($+commands[tmux])) && plugins+=tmux
(($+commands[vagrant])) && plugins+=vagrant
(($+commands[make])) && plugins+=make
(($+commands[lein])) && plugins+=lein

[[ $OSTYPE =~ darwin ]] && plugins+=(osx)

if [[ -s $(which virtualenvwrapper_lazy.sh) ]]; then
  plugins+=(virtualenvwrapper)
fi

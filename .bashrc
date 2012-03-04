#
# ~/.bashrc
#

# Cabal & Gem  packages
PATH=$PATH:~/.cabal/bin/:~/.gem/ruby/1.9.1/bin

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Easier Navigation
alias ..="cd .."
alias ...="cd ../.."


#SSH Into Drawrawr
alias dr="ssh root@drawrawr.com"

#Run my Haiku Operating system in the Qemu Virtual Machine
alias haiku="qemu-kvm -hda /home/lambdanaut/haiku.img -m 512 -vga std"

#Untar a .tar
alias untar="tar xvf"

#Issue networking request
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

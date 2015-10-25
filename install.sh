#!/bin/bash -

##########################################################################
function fn_initialize()
{
    readonly c_user_home="/Users/yinle"

    local l_script_path=`dirname $0`
    cd "$l_script_path" && l_script_path="`pwd`" && cd - &> /dev/null
    readonly c_dotfiles_root="$l_script_path"

    return 0
}

##########################################################################
function fn_apply_for_bash_profile()
{
    rm -rf ${c_user_home}/.alias
    rm -rf ${c_user_home}/.bash_profile

    cd "$c_user_home"
    ln -s ${c_dotfiles_root}/alias .alias
    [ "$?" -ne 0 ] && return 1

    ln -s ${c_dotfiles_root}/bash_profile .bash_profile
    [ "$?" -ne 0 ] && return 1

    return 0
}

##########################################################################
function fn_apply_for_vim()
{
    rm -rf ${c_user_home}/.vim
    rm -rf ${c_user_home}/.vimrc

    cd "$c_user_home"

    ln -s ${c_dotfiles_root}/vim .vim
    [ "$?" -ne 0 ] && return 1

    ln -s ${c_dotfiles_root}/.vimrc .vimrc
    [ "$?" -ne 0 ] && return 1

    return 0
}

##########################################################################
function fn_apply()
{
    fn_apply_for_bash_profile
    [ "$?" -ne 0 ] && echo "Apply [.bash_profile] ... Failed" && return 1

    fn_apply_for_vim
    [ "$?" -ne 0 ] && echo "Apply [.vim] ... Failed" && return 1

    return 0
}

##########################################################################
function fn_main()
{
    fn_initialize

    fn_apply
    if [ "$?" -eq 0 ]; then
        echo "###########################################"
        echo "Apply dotfiles Succeed"
        echo "###########################################"
    else
        echo "###########################################"
        echo "Apply dotfiles Failed"
        echo "###########################################"

        return 1
    fi

    return 0
}

##########################################################################
fn_main
exit $?



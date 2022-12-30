# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# Annex linkman | Copyright Ⓒ 2022 Z-Shell Community
#
# Zsh Plugin Standard
# https://wiki.zshell.dev/community/zsh_plugin_standard/#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://wiki.zshell.dev/community/zsh_plugin_standard/#funtions-directory
if [[ $PMSPEC != *f* ]]; then
  fpath+=( "${0:h}/functions" )
fi

# Autoload functions
autoload -Uz .za-lman-{atclone,atdelete}-handler

# An empty stub to fill the help handler fields
.za-lman-null-handler() { :; }

@zi-register-annex "z-a-linkman" hook:atclone-50 \
  .za-lman-atclone-handler \
  .za-lman-null-handler "lman"

@zi-register-annex "z-a-linklman" hook:atpull-50 \
  .za-lman-atclone-handler \
  .za-lman-null-handler

@zi-register-annex "z-a-linklman" hook:atdelete-50 \
  .za-lman-atdelete-handler \
  .za-lman-help-handler

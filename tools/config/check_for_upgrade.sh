#!/usr/bin/env

ALIASES=${ALIASES:-~/.aliases}
function _current_epoch() {
  echo $(( $EPOCHSECONDS / 60 / 60 / 24 ))
}

function _update_aliases_update() {
  echo "LAST_EPOCH=$(_current_epoch)" >! ${ALIASES}/caches/.aliases-update
}

function _upgrade_aliases() {
  env ALIASES=$ALIASES sh $ALIASES/tools/config/upgrade.sh
  # update the aliases file
  _update_aliases_update
}

epoch_target=13
if [[ -z "$epoch_target" ]]; then
  # Default to old behavior
  epoch_target=13
fi

# Cancel upgrade if the current user doesn't have write permissions for the
# aliases directory.
[[ -w "$ALIASES" ]] || return 0

# Cancel upgrade if git is unavailable on the system
whence git >/dev/null || return 0

if mkdir "$HOME/.aliases/log/update.lock" 2>/dev/null; then
  if [ -f ${$HOME/aliases/caches/}/.aliases-update ]; then
    .  ${$HOME/aliases/caches/}/.aliases-update

    if [[ -z "$LAST_EPOCH" ]]; then
      _update_aliases_update
      rmdir $ALIASES/log/update.lock # TODO: fix later
      return 0
    fi

    epoch_diff=$(($(_current_epoch) - $LAST_EPOCH))
    if [ $epoch_diff -gt $epoch_target ]; then
      if [ "$DISABLE_UPDATE_PROMPT" = "true" ]; then
        _upgrade_aliases
      else
        echo "Aliases Would you like to update? [Y/n]: \c"
        read line
        if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
          _upgrade_aliases
        else
          _update_aliases_update
        fi
      fi
    fi
  else
    # create the aliases file
    _update_aliases_update
  fi

  rmdir $ALIASES/log/update.lock
fi

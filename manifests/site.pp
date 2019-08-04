node default {
  if $facts[role] {
    include "role::${facts[role]}"
  }
  else {
    notify{"Node ${facts[fdqn]} does not have a role specified":}
    include profile::base
  }
}

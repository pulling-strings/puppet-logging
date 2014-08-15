# setting up http://www.sysdig.org/
class logging::sysdig {
  ensure_resource('class', 'apt', {})

  apt::key { 'sysgid':
    key        => 'EC51E8C4',
    key_source => 'https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public'
  } ->

  apt::source {'draios':
    location    => 'http://download.draios.com/stable/deb',
    release     => 'stable-$(ARCH)/',
    repos => '',
    include_src => false
  } ->

  package{"linux-headers-${kernelrelease}":
    ensure  => present
  } ->

  package{'sysdig':
    ensure  => present
  }
}

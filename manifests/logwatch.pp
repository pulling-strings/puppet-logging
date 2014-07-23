# Setting up logwatch
class logging::logwatch(
  $email='',
  $mailfrom='',
  $detail='Low',
  $range='yesterday'
) {
  package{'logwatch':
    ensure  => present
  } ->

  file { '/usr/share/logwatch/default.conf/logwatch.conf':
    ensure  => file,
    mode    => '0644',
    content => template('logging/logwatch.conf.erb'),
    owner   => root,
    group   => root,
  }
}

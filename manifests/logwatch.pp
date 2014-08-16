# Setting up logwatch, this module should be used in conjunction with puppet-ssmtp
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

  cron{'logwatch':
    command => "logwatch --detail ${detail} --mailto ${mailto} --range ${range}",
    user    => 'root',
    hour    => '0',
    minute  => '0'
  }
}

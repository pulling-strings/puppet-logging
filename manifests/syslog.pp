# Setting up remote rsyslog server
class logging::syslog($syslog_server='') {
  if(!empty($syslog_server)){

    $conf = '/etc/rsyslog.d/60-kibana.conf'

    file{$conf:
      ensure => file
    }

    # order matters!
    file_line { 'graylog2-rsyslog-template':
      path    => $conf,
      line    => '$template GRAYLOG2,"<%PRI%>1 %timegenerated:::date-rfc3339% %HOSTNAME% %syslogtag% - %APP-NAME%: %msg:::drop-last-lf%\n"',
      require => File[$conf]
    } ->

    file_line { 'action-forward-default':
      path => $conf,
      line => '$ActionForwardDefaultTemplate GRAYLOG2'
    } ->

    file_line { 'syslog-dest-server':
      path => $conf,
      line => "*.* @${syslog_server}"
    }
  }

}

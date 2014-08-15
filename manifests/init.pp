# Logging managment from Logstash to Logwatch/rotate
class logging {
  include logging::logwatch
  include logging::sysdig
}

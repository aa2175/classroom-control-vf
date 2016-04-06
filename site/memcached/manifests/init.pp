class memcached {
  package { 'memcached':
    ensure => present,
  }
  file { 'memcached_config' :
    path    => '/etc/sysconfig/memcached',
    ensure  => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Package['memcached'],
    source  => 'puppet:///modules/memcached/sysconfig_memcached',
  }
  service { 'memcached':
      ensure        => running,
      enable      => true,
      subscribe => File['memcached_config'],
  }
}

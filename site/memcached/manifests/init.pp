class memcached {
  package { 'memcached':
    ensure => present,
  }
  file { '/etc/sysconfig/memcached':
    ensure  => file,
    require => Package['memcached'],
    source  => 'puppet:///modules/memcached/sysconfig_memcached',
  }
}

class nginx {
  $pkg = 'nginx'
  package { $pkg:
   ensure => present,
  }
  file { '/var/www' :
    ensure => directory,
  }
  file { "${pkg}_config" :
   path    => '/etc/${pkg}/${pkg}.conf',
   ensure  => file,
   owner   => 'root',
   group   => 'root',
   mode    => '0644',
   require => Package[$pkg],
   source  => "puppet:///modules/${pkg}/${pkg}.conf",
  }
  file { "${pkg}_site_config" :
    path    => "/etc/${pkg}/conf.d/default.conf",
    ensure  => file,
    owner   => $pkg,
    group   => $pkg,
    mode    => '0644',
    require => Package[$pkg],
    source  => "puppet:///modules/${pkg}/default.conf",
  }
  file { "${pkg}_html_index" :
    path    => '/var/www/index.html',
    ensure  => file,
    owner   => $pkg,
    group   => $pkg,
    mode    => '0644',
    require => Package[$pkg],
    source  => "puppet:///modules/${pkg}/index.html",
  }
  service { $pkg:
     ensure    => running,
     enable    => true,
     subscribe => [File['nginx_config'], File['nginx_site_config'],File['nginx_html_index']],
  }
}

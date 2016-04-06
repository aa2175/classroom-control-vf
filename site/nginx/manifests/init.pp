class nginx {
  $pkg = 'nginx'
  package { $pkg :
   ensure => present,
  }
  file { '/var/www' :
    ensure => directory,
  }
  file { "nginx_config" :
   path    => '/etc/nginx/nginx.conf',
   ensure  => file,
   owner   => 'root',
   group   => 'root',
   mode    => '0644',
   require => Package[$pkg],
   source  => "puppet:///modules/nginx/nginx.conf",
  }
  file { "nginx_site_config" :
    path    => "/etc/nginx/conf.d/default.conf",
    ensure  => file,
    owner   => $pkg,
    group   => $pkg,
    mode    => '0644',
    require => Package[$pkg],
    source  => "puppet:///modules/nginx/default.conf",
  }
  file { "nginx_html_index" :
    path    => '/var/www/index.html',
    ensure  => file,
    owner   => $pkg,
    group   => $pkg,
    mode    => '0644',
    require => Package[$pkg],
    source  => "puppet:///modules/nginx/index.html",
  }
  service { $pkg:
     ensure    => running,
     enable    => true,
     subscribe => [File['nginx_config'], File['nginx_site_config'],File['nginx_html_index']],
  }
}

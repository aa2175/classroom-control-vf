class skeleton {
  file { '/etc/skel/.bashrc':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///site/skeleton/etc/skel/.bashrc',
  }
}

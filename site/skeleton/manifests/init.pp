class skeleton {
  file { '/etc/skel/.bashrc':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///etc/skel/.bashrc',
  }
}

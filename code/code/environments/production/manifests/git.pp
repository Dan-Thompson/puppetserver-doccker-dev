vcsrepo { '/tmp/git-test':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/thockin/test.git',
}

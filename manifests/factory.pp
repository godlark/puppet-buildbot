# Define: buildbot::factory
#
define buildbot::factory (
  $ensure = 'present',
){

  concat::fragment {
    ensure  => $ensure,
    content => "${name} = BuildFactory()\n",
    order   => 41,
  }
}

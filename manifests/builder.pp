# Define: buildbot::builder
#
define buildbot::builder (
  $slavenames,
  $factory,
  $ensure = 'present',
){
  validate_array($slavenames)

  concat::fragment { "buildbot_builder_${name}":
    ensure  => $ensure,
    order   => 55,
    target  => "${::buildbot::params::home}/master/master.cfg",
    content => "c['builders'].append(BuilderConfig(name='${name}', slavenames=${slavenames}, factory=${factory}))\n",
  }
}

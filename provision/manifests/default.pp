#
# site.pp - defines defaults for vagrant provisioning
#

# use run stages to control overall module load order
stage { 'pre': before => Stage['main'] }

class { 'vagrant':    stage => 'pre' }
class { 'bash': stage => 'pre' }
class {'buildtools': stage => 'main'}

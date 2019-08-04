# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::puppetmaster
class profile::puppetmaster {
  class { 'puppetserver::repository': }
  -> class { 'puppetserver': }
  class { 'hiera':
          hiera_version   =>  '5',
          hiera5_defaults =>  {"datadir" => "data", "data_hash" => "yaml_data"},
          hierarchy       =>  [
                                {"name" =>  "Nodes yaml", "paths" =>  ['nodes/%
                                {::trusted.certname}.yaml', 'role/%{::role}.yaml']},
                                {"name" =>  "Default yaml file", "path" =>  "common.yaml"},
                              ],
}
}

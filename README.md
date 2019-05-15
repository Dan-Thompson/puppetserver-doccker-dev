# PuppetServer/PuppetMaster


Create a throwaway puppetserver/puppetmaster in Docker to test hiera and modules on its own slave cluster.

  - Testing of puppet
  - Can be deleted and re-spawned
  - totally throwaway

# Branch Master

This is puppetserver,  based on Java and is a drop in replacement for puppetmaster and can handle much more load than puppetmaster,

```sh
$ docker-compose up -d
$ docker-compose scale slave=5 #if you want multiple slaves
$ docker-compose down
```

# Branch puppetMaster

same as above but uses the traditional puppetmaster (apache based) instead of the newer java.


Puppet agent starts automatically,  each slave needs to be signed on the master.
```
#list nodes
puppet cert list
/opt/puppetlabs/bin/puppetserver ca list

#sign all nodes
puppet cert sign --all
/opt/puppetlabs/bin/puppetserver ca sign --all
```

puppet agent runs every 120 seconds.

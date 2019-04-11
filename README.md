# rake-standard-project
> Rake script for standard-project.

## deps
```rb
# Gemfile
gem 'fileutils'
```

## install
```bash
npm i -S afeiship/rake-standard-project --registry=https://registry.npm.taobao.org
```

## usage
~~~
$ rake -T
rake stdapp:commit[target_branch]  # Commit new release to remote
rake stdapp:make                   # Make new release from dist
rake stdapp:rollback[githash]      # Rollback release to git hash version
~~~

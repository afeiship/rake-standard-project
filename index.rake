require "json"

# use package.json
package_hash = JSON.load File.open "./package.json"
version = package_hash["version"]

# main task list:
namespace :stdapp do
  desc "Make new release from dist."
  task :make do
    # git commit nothing will caught error:
    begin
      sh "rm -rf release && cp -R dist release"
      sh "git add --all && git commit -m 'add: release - #{version}' && git push"
    rescue StandardError => e
    end
  end

  desc "Commit new release to remote."
  task :commit, [:target_branch] do |task, args|
    args.with_defaults(
      :target_branch => "release",
    )

    current_branch = %x(git rev-parse --abbrev-ref HEAD).strip
    target_branch = args[:target_branch]

    # check latest relase files:
    sh "rm -rf release && cp -R dist release"
    sh "git checkout #{target_branch}"
    sh "rm -rf release"
    sh "git checkout #{current_branch} -- release"
    sh "git add --all && git commit -m 'add: new release - #{version}' && git push"
    sh "git checkout #{current_branch}"
  end
end

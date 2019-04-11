# main task list:
namespace :stdapp do
  desc "Make new release from dist."
  task :make_release do
    sh "rm -rf release && cp -R dist release"
    sh "git add --all && git commit -m 'add: auto release' && git push"
  end

  desc "Commit new release to remote."
  task :commit_release, [:target_branch] do |task, args|
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
    sh "git add --all && git commit -m 'add: new release' && git push"
    sh "git checkout #{current_branch}"
  end
end

# main task list:
namespace :stdapp do
  # rake hello_with_args[afei,bash]
  desc "Make new release to remote."
  task :make_release, [:target] do |task, args|
    args.with_defaults(
      :target => "release",
    )

    current_branch = %x(git rev-parse --abbrev-ref HEAD).strip
    target_branch = args[:target]

    # check latest relase files:
    sh "git checkout #{target_branch}"
    sh "rm -rf release"
    sh "git checkout #{current_branch} -- release"
  end
end

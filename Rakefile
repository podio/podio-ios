# do not echo sh commands
verbose(false)

SCRIPTS = './Scripts'

desc "Run the PodioKit unit test suite"
task :test do
  sh "#{SCRIPTS}/run-tests"
  sh "#{SCRIPTS}/coverage-report"
end

namespace :docs do
  desc "Generate PodioKit documentation using appledoc"
  task :generate do
    sh "appledoc \
        --create-html \
        --create-docset \
        --install-docset \
        --clean-output \
        --keep-intermediate-files \
        --project-name PodioKit \
        --project-company \"Citrix Systems, Inc\" \
        --company-id com.podio \
        --output Docs PodioKit"
  end
end
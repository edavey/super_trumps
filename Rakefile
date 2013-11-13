require "cucumber"
require "cucumber/rake/task"

Cucumber::Rake::Task.new(:cucumber) do |t|
  def_r = " -r features/support/ -r features/step_definitions"
  t.cucumber_opts = "#{def_r} features --format pretty -x"
  t.fork = false
end
require "erb"
require "foreman/export"

class Foreman::Export::Initscript < Foreman::Export::Base

  def export
    super

    # hack to add our template path to the new #export_template
    options[:template] = Pathname.new(File.dirname(__FILE__)).join('..', '..', '..', 'data', 'export', 'initscript').expand_path

    Dir["#{location}/#{app}"].each do |file|
      clean file
    end

    write_template "initscript/master.erb", "#{app}", binding
   end

end


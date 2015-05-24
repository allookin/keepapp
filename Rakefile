require 'bundler/setup'
Bundler.require
Dir.glob('tasks/*.rake').each { |r| import r }
require 'yui/compressor'
require 'uglifier'

CONFIG = {
    min_height: 600,
    footer_size: 50
}

COMPRESS = false

task :compile do
  out_base = File.join('public', 'assets')
  assets = Sprockets::Environment.new(Dir.pwd) do |env|
    env.logger = Logger.new(STDOUT)
    if COMPRESS
      env.css_compressor = YUI::CssCompressor.new
      env.js_compressor = Uglifier.new(mangle: true)
    else
      env.css_compressor = false # YUI::CssCompressor.new
      env.js_compressor = false #Uglifier.new(mangle: true)
    end
  end

  assets.append_path(File.join 'assets', 'js')
  assets.append_path(File.join 'assets', 'styles')
  app_js = assets['app.js']
  out_js_file = Pathname.new(out_base).join('app.min.js')
  app_js.write_to(out_js_file)
  app_js.write_to("#{out_js_file}.gz")

  app_css = assets['app.css']
  out_css_file = Pathname.new(out_base).join('app.min.css')
  app_css.write_to(out_css_file)
  app_css.write_to("#{out_css_file}.gz")
end

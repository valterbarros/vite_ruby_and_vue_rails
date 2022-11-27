require "test_helper"

def run_cmd options
  cdn_host = options[:cdn_host]
  vite_asset_host = options[:vite_asset_host]
  custom_vite_asset_host = options[:custom_vite_asset_host]

  vars = "VITE_RUBY_CONFIG_PATH=\"./test/fixtures/files/vite-test.json\" "
  vars += cdn_host ? " CDN_HOST=#{cdn_host} " : ''
  vars += vite_asset_host ? " VITE_RUBY_ASSET_HOST=#{vite_asset_host} " : ''
  vars += custom_vite_asset_host ? " CUSTOM_VITE_ASSET_HOST=#{custom_vite_asset_host} " : ''

  cmd = system("#{vars} bin/vite build --clean --mode=production");
end

class ViteExecutable < ActiveSupport::TestCase
  def setup; end

  test "should application.[hash].js host comes from VITE_RUBY_CONFIG_PATH file" do
    run_cmd({})

    application_file = Dir['public/vite-rails-test/assets/application*.js'][0]

    assert_not_empty File.foreach(application_file).grep /localhost:5000/
  end

  test "should application.[hash].js has the host localhost:4000 from rails config/test.rb file" do
    run_cmd({ cdn_host: "http://localhost:4000" })

    application_file = Dir['public/vite-rails-test/assets/application*.js'][0]

    assert_not_empty File.foreach(application_file).grep /localhost:4000/
  end

  # set VITE_RUBY_ASSET_HOST is stronger than set config.action_controller.asset_host on rails env file
  test "should application.[hash].js has the host localhost:4000 from VITE_RUBY_ASSET_HOST var" do
    run_cmd({ cdn_host: "http://localhost:4000", vite_asset_host: "http://127.0.0.1:4000" })

    application_file = Dir['public/vite-rails-test/assets/application*.js'][0]

    assert_not_empty File.foreach(application_file).grep /127.0.0.1:4000/
  end

  # set VITE_RUBY_ASSET_HOST value inside var on vite.config.js
  test "should application.[hash].js has the host 127.0.0.1:4001 from VITE_RUBY_ASSET_HOST var" do
    run_cmd({ cdn_host: "http://localhost:4000", vite_asset_host: "http://127.0.0.1:4000", custom_vite_asset_host: '127.0.0.1:4001' })

    application_file = Dir['public/vite-rails-test/assets/application*.js'][0]

    assert_not_empty File.foreach(application_file).grep /127.0.0.1:4001/
  end
end

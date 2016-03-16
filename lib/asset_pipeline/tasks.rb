require 'rake'
require 'rake/tasklib'
require 'rake/sprocketstask'

module AssetPipeline
  class Tasks < Rake::TaskLib
    def initialize
      namespace :assets do
        desc 'Precompile assets'
        task :precompile do
          manifest = Sprockets::Manifest.new(AssetPipeline.sprockets.index, AssetPipeline.assets_public_path)
          manifest.compile(AssetPipeline.assets_precompile)
        end

        desc 'Clean assets'
        task :clean do
          FileUtils.rm_rf(AssetPipeline.assets_public_path)
        end
      end
    end

    def self.install
      self.new
    end
  end
end

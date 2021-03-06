namespace :qbrick do
  namespace :db do
    desc 'Load qbrick seeds'
    task seed: :environment do
      Qbrick::Engine.load_seed
    end
  end
end

Rake::Task['db:seed'].enhance ['qbrick:db:seed']

desc "Create nondigest versions of all ckeditor digest assets"
task "assets:precompile" do
  fingerprint = /\-[0-9a-f]{32}\./
  for file in Dir["public/assets/qbrick/cms/ck-config*"]
    next unless file =~ fingerprint

    nondigest = file.sub fingerprint, '.'
    if !File.exist?(nondigest) or File.mtime(file) > File.mtime(nondigest)
      FileUtils.cp file, nondigest, verbose: true
    end
  end
end

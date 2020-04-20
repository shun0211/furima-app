Dir.glob(File.join(Rails.root, 'db', 's', '*.rb')).each do |file|
  desc "Load the  data from db/s/#{File.basename(file)}."
  task "db::#{File.basename(file).gsub(/\..+$/, '')}" => :environment do
    load(file)
  end
end
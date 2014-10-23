namespace :hkstockowl do

  desc "Import Ex Headline Category CSV Data."
  task :ex_headline_category => :environment do

    require 'csv'

    csv_file_path = 'lib/assets/ex_headline_category_data.csv'
    puts "Start importing #{csv_file_path} ..."

    CSV.foreach(csv_file_path) do |row|

      ExHeadlineCategory.where( :name => row[0].to_s ).first_or_create

    end

    puts 'Ex Headline Category CSV data imported!'
    puts 'Note that this process does not remove missing records.'
  end

end

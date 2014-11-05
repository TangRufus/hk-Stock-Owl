namespace :hkstockowl do

  desc "Import Ex Tag CSV Data."
  task :import_ex_tag_csv => :environment do

    require 'csv'

    csv_file_path = 'lib/assets/ex_tag_data.csv'
    puts "Start importing #{csv_file_path} ..."

    CSV.foreach(csv_file_path) do |row|

      ExTag.where( :name => row[0].to_s ).first_or_create

    end

    puts 'Ex Tag CSV data imported!'
    puts 'Note that this process does not remove missing records.'
  end

end

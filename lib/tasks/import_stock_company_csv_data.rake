namespace :hkstockowl do

  desc "Import Stock Company CSV Data."
  task :stock_company => :environment do

    require 'csv'

    csv_file_path = 'lib/assets/stock_company_data.csv'
    puts "Start importing #{csv_file_path} ..."

    CSV.foreach(csv_file_path, headers: true) do |row|

      sc = StockCompany.where( :code => row['Stock Code'].to_i ).first_or_initialize
      sc.update_attributes( :name => row['Stock Name'].to_s )

    end

    puts 'Stock company CSV data imported!'
    puts 'Note that this process does not remove missing records.'
  end

end

namespace :hkstockowl do

  desc 'Delete all StockCompany records.'
  task :destroy_all_stock_companies => :environment do
    STDOUT.puts 'Are you sure to delete all StockCompany records? Y/n'
    input = STDIN.gets.chomp
    if input === 'Y'
      puts 'Burn!!!'
      StockCompany.all.destroy_all
      puts 'Done'
    end
    puts 'Bye'
  end
end

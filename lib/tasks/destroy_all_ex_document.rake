namespace :hkstockowl do

  desc "Delete all ExDocument records."
  task :destroy_all_ex_documents => :environment do
    input = ''
    STDOUT.puts "Are you sure to delete all ExDocument records? Y/n"
    input = STDIN.gets.chomp
    if input === 'Y'
      puts 'Burn!!!'
      ExDocument.all.destroy_all 
      puts 'Done'
    end
    puts 'Bye'
  end
end

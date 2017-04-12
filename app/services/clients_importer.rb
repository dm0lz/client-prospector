require 'csv'
class ClientsImporter
  class << self
    def call
      CSV.parse(File.open("/Users/olivier/Desktop/clients2.csv", 'r:bom|utf-8'), col_sep: ';').drop(1).each_with_index do |row, index|
        begin
          #binding.pry
          #client = Client.new(name: row[0], postal_code: row[4], city: row[5])
          client = Client.new(file_row(row))
          client.save!
        rescue => e
          puts "Error #{e} with row ##{index}"
          return false
        end
      end
    end

    def file_row row
      {
        company_name: row[0],
        adr1: row[1],
        adr2: row[2],
        postal_code: row[4],
        city: row[5],
        country: row[6],
        gender: row[7],
        name: row[8],
        phone1: row[9],
        phone2: row[10]
      }
    end

    def complete
      Client.all.each do |client|
        binding.pry
      end
    end
  end
end

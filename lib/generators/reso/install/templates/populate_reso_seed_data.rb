class PopulateRESOSeedData < ActiveRecord::Migration[7.0]
  def up
    require 'json'
    require 'smarter_csv'

    file = Rails.root.join('db/reso_enumerations.tsv')
    options = {col_sep: "\t", row_sep: "\n" }
    SmarterCSV.process(file, options) do |hash|
      puts "Inserting RESO::Enumeration: #{hash.first[:type]} – #{hash.first[:value]}"
      RESO::Enumeration.create(hash)
    end
  end

  def down
    RESO::Enumeration.destroy_all
  end
end

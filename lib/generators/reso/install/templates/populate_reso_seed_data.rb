class PopulateRESOSeedData < ActiveRecord::Migration[7.0]
  def up
    require 'json'
    require 'smarter_csv'

    file = Rails.root.join('db/data/reso_dd_2.0_lookups.tsv')
    options = {col_sep: "\t", row_sep: "\n" }
    SmarterCSV.process(file, options) do |hash|
      puts "Inserting RESO::Enumeration: #{hash.first[:type]} – #{hash.first[:value]}"
      RESO::Enumeration.create(hash)
    end
  end

  def down
  end
end

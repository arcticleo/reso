module Reso
  module Generators
    class InstallGenerator < Rails::Generators::Base

      include Rails::Generators::Migration
      source_root File.expand_path("../templates", __FILE__)

      desc "Copy RESO Data Dictionary migration files to your application."

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S%L")
      end

      def create_model_file
        %w[
          reso_enumerations
          reso_parent_child_assignments
          reso_properties
          reso_property_characteristics
          reso_property_equipment
          reso_property_farmings
          reso_property_financials
          reso_property_listing_prices
          reso_property_listing_remarks
          reso_property_listing_showings
          reso_property_listings
          reso_property_location_addresses
          reso_property_location_areas
          reso_property_location_gis
          reso_property_location_schools
          reso_property_locations
          reso_property_occupant_owners
          reso_property_structures
        ].each do |name|
          migration_template "create_#{name}.rb", "db/migrate/create_#{name}.rb"
          sleep 0.1
        end
      end

    end
  end
end

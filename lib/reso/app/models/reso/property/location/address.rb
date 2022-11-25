class RESO::Property::Location::Address < ApplicationRecord
  belongs_to :location

  has_one :reso_city_assignment, as: :parent, class_name: "CityAssignment", dependent: :destroy
  has_one :city,
    through: :reso_city_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_country_assignment, as: :parent, class_name: "CountryAssignment", dependent: :destroy
  has_one :country,
    through: :reso_country_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_county_or_parish_assignment, as: :parent, class_name: "CountyOrParishAssignment", dependent: :destroy
  has_one :county_or_parish,
    through: :reso_county_or_parish_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_postal_city_assignment, as: :parent, class_name: "PostalCityAssignment", dependent: :destroy
  has_one :postal_city,
    through: :reso_postal_city_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_state_or_province_assignment, as: :parent, class_name: "StateOrProvinceAssignment", dependent: :destroy
  has_one :state_or_province,
    through: :reso_state_or_province_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_street_dir_prefix_assignment, as: :parent, class_name: "StreetDirPrefixAssignment", dependent: :destroy
  has_one :street_dir_prefix,
    through: :reso_street_dir_prefix_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_street_dir_suffix_assignment, as: :parent, class_name: "StreetDirSuffixAssignment", dependent: :destroy
  has_one :street_dir_suffix,
    through: :reso_street_dir_suffix_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_street_suffix_assignment, as: :parent, class_name: "StreetSuffixAssignment", dependent: :destroy
  has_one :street_suffix,
    through: :reso_street_suffix_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  def city=(value)
    enum = RESO::City.lookup_enum(value)
    RESO::CityAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def country=(value)
    enum = RESO::Country.lookup_enum(value, is_open: false)
    RESO::CountryAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def county_or_parish=(value)
    enum = RESO::CountyOrParish.lookup_enum(value)
    RESO::CountyOrParishAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def postal_city=(value)
    enum = RESO::PostalCity.lookup_enum(value)
    RESO::PostalCityAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def state_or_province=(value)
    enum = RESO::StateOrProvince.lookup_enum(value)
    RESO::StateOrProvinceAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def street_dir_prefix=(value)
    enum = RESO::StreetDirPrefix.lookup_enum(value)
    RESO::StreetDirPrefixAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def street_dir_suffix=(value)
    enum = RESO::StreetDirSuffix.lookup_enum(value)
    RESO::StreetDirSuffixAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def street_suffix=(value)
    enum = RESO::StreetSuffix.lookup_enum(value)
    RESO::StreetSuffixAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

end

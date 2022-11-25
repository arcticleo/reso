class RESO::Property::Location::School < ApplicationRecord
  belongs_to :location

  has_one :reso_elementary_school_district_assignment, as: :parent, class_name: "ElementarySchoolDistrictAssignment", dependent: :destroy
  has_one :elementary_school_district,
    through: :reso_elementary_school_district_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_elementary_school_assignment, as: :parent, class_name: "ElementarySchoolAssignment", dependent: :destroy
  has_one :elementary_school,
    through: :reso_elementary_school_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_high_school_district_assignment, as: :parent, class_name: "HighSchoolDistrictAssignment", dependent: :destroy
  has_one :high_school_district,
    through: :reso_high_school_district_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_high_school_assignment, as: :parent, class_name: "HighSchoolAssignment", dependent: :destroy
  has_one :high_school,
    through: :reso_high_school_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_middle_or_junior_school_district_assignment, as: :parent, class_name: "MiddleOrJuniorSchoolDistrictAssignment", dependent: :destroy
  has_one :middle_or_junior_school_district,
    through: :reso_middle_or_junior_school_district_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_middle_or_junior_school_assignment, as: :parent, class_name: "MiddleOrJuniorSchoolDistrictAssignment", dependent: :destroy
  has_one :middle_or_junior_school,
    through: :reso_middle_or_junior_school_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  def elementary_school_district=(value)
    enum = RESO::ElementarySchoolDistrict.lookup_enum(value)
    RESO::ElementarySchoolDistrictAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def elementary_school=(value)
    enum = RESO::ElementarySchool.lookup_enum(value)
    RESO::ElementarySchoolAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def high_school_district=(value)
    enum = RESO::HighSchoolDistrict.lookup_enum(value)
    RESO::HighSchoolDistrictAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def high_school=(value)
    enum = RESO::HighSchool.lookup_enum(value)
    RESO::HighSchoolAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def middle_or_junior_school_district=(value)
    enum = RESO::MiddleOrJuniorSchoolDistrict.lookup_enum(value)
    RESO::MiddleOrJuniorSchoolDistrictAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def middle_or_junior_school=(value)
    enum = RESO::MiddleOrJuniorSchool.lookup_enum(value)
    RESO::MiddleOrJuniorSchoolAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

end

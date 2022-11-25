class RESO::Property::Financial < ApplicationRecord
  belongs_to :property

  has_many :reso_existing_lease_type_assignments, as: :parent, class_name: "ExistingLeaseTypeAssignment", dependent: :destroy
  has_many :existing_lease_type,
    through: :reso_existing_lease_type_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_financial_data_source_assignments, as: :parent, class_name: "FinancialDataSourceAssignment", dependent: :destroy
  has_many :financial_data_source,
    through: :reso_financial_data_source_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_income_includes_assignments, as: :parent, class_name: "IncomeIncludesAssignment", dependent: :destroy
  has_many :income_includes,
    through: :reso_income_includes_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_operating_expense_includes_assignments, as: :parent, class_name: "OperatingExpenseIncludesAssignment", dependent: :destroy
  has_many :operating_expense_includes,
    through: :reso_operating_expense_includes_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_owner_pays_assignments, as: :parent, class_name: "OwnerPaysAssignment", dependent: :destroy
  has_many :owner_pays,
    through: :reso_owner_pays_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_rent_includes_assignments, as: :parent, class_name: "RentIncludesAssignment", dependent: :destroy
  has_many :rent_includes,
    through: :reso_rent_includes_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_tenant_pays_assignments, as: :parent, class_name: "TenantPaysAssignment", dependent: :destroy
  has_many :tenant_pays,
    through: :reso_tenant_pays_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  def existing_lease_type=(values)
    enums = RESO::ExistingLeaseType.lookup_enums(values)
    RESO::ExistingLeaseTypeAssignment.multi_assignment(parent: self, child: enums) unless enums.blank?
  end

  def financial_data_source=(values)
    enums = RESO::FinancialDataSource.lookup_enums(values)
    RESO::FinancialDataSourceAssignment.multi_assignment(parent: self, child: enums) unless enums.blank?
  end

  def income_includes=(values)
    enums = RESO::IncomeIncludes.lookup_enums(values)
    RESO::IncomeIncludesAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def operating_expense_includes=(values)
    enums = RESO::OperatingExpenseIncludes.lookup_enums(values)
    RESO::OperatingExpenseIncludesAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def owner_pays=(values)
    enum = RESO::OwnerPays.lookup_enum(value)
    RESO::OwnerPaysAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def rent_includes=(values)
    enums = RESO::RentIncludes.lookup_enums(values)
    RESO::RentIncludesAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def tenant_pays=(values)
    enums = RESO::TenantPays.lookup_enums(values)
    RESO::TenantPaysAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

end

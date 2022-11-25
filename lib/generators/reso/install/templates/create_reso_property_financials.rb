class CreateRESOPropertyFinancials < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_financials do |t|
      t.references :property, null: false, foreign_key: { to_table: :reso_properties }

      t.decimal :cable_tv_expense, precision: 14, scale: 2
      t.decimal :cap_rate, precision: 5, scale: 2
      t.decimal :electric_expense, precision: 14, scale: 2
      t.decimal :fuel_expense, precision: 14, scale: 2
      t.decimal :furniture_replacement_expense, precision: 14, scale: 2
      t.decimal :gardener_expense, precision: 14, scale: 2
      t.decimal :gross_income, precision: 14, scale: 2
      t.decimal :gross_scheduled_income, precision: 14, scale: 2
      t.decimal :insurance_expense, precision: 14, scale: 2
      t.decimal :licenses_expense, precision: 14, scale: 2
      t.decimal :maintenance_expense, precision: 14, scale: 2
      t.decimal :manager_expense, precision: 14, scale: 2
      t.decimal :net_operating_income, precision: 14, scale: 2
      t.decimal :new_taxes_expense, precision: 14, scale: 2
      t.integer :number_of_units_leased
      t.integer :number_of_units_mo_mo
      t.integer :number_of_units_vacant
      t.decimal :operating_expense, precision: 14, scale: 2
      t.decimal :other_expense, precision: 14, scale: 2
      t.decimal :pest_control_expense, precision: 14, scale: 2
      t.decimal :pool_expense, precision: 14, scale: 2
      t.decimal :professional_management_expense, precision: 14, scale: 2
      t.boolean :rent_control_yn
      t.decimal :supplies_expense, precision: 14, scale: 2
      t.decimal :total_actual_rent, precision: 14, scale: 2
      t.decimal :trash_expense, precision: 14, scale: 2
      t.integer :vacancy_allowance
      t.decimal :vacancy_allowance_rate, precision: 5, scale: 2
      t.decimal :water_sewer_expense, precision: 14, scale: 2

      t.timestamps
    end
  end
end

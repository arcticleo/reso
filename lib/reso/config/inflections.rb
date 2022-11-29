ActiveSupport::Inflector.inflections(:en) do |inflect|
  # inflect.plural /^(ox)$/i, '\1en'
  # inflect.singular /^(ox)en/i, '\1'
  # inflect.irregular 'person', 'people'
  # inflect.uncountable %w( fish sheep )

  inflect.acronym "FHA"
  inflect.acronym "GIS"
  inflect.acronym "RESO"
  inflect.acronym "URL"

  inflect.uncountable %w( gis media socialmedia )

end

require 'active_record/connection_adapters/abstract/schema_definitions'

ActiveRecord::ConnectionAdapters::TableDefinition.class_eval do
  def identities(*args)
    options = args.extract_options!
    column(:created_by, :integer, options)
    column(:updated_by, :integer, options)
  end
end
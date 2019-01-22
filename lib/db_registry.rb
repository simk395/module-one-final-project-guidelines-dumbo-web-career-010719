require 'ostruct'
require_relative "./connection_adapter"

DBRegistry ||= OpenStruct.new(test: ConnectionAdapter.new("db/character_inventory.db"), 
  development: ConnectionAdapter.new("db/development.db"), 
  production: ConnectionAdapter.new("db/production.db")
  )

# Enables the PostgreSQL PG Crypto extension, which is needed to use the UUID primary key type.
class EnablePostgresUuids < ActiveRecord::Migration[7.0]
  def change
    enable_extension('pgcrypto') unless extension_enabled?('pgcrypto')
  end
end

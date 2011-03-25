module MigrationHelpers
  def fk(from_table, from_column, to_table=from_column.to_s.sub(/_id$/, 's'))
    constraint_name = "fk_#{from_table}_#{from_column}"

    execute %{alter table #{from_table}
              add constraint #{constraint_name}
              foreign key (#{from_column})
              references #{to_table}(id)}
  end
  
  def sti(table)
    add_index table, [:id,:type]
  end
  
  def drop_fk(from_table, from_column)
    constraint_name = "fk_#{from_table}_#{from_column}"
    execute %{alter table #{from_table} drop foreign key #{constraint_name}}
  end
  
  def drop_sti(table)
    remove_index table, [:id,:type]
  end  
end
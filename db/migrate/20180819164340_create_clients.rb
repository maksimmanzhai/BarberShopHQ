class CreateClients < ActiveRecord::Migration[5.2]
  def change

  	create_table :clients do |t| #4. greate table
  		t.text :name
  		t.text :phone
  		t.text :datestamp
  		t.text :barber
  		t.text :color

  		t.timestamps
  	end #5. rake db:migrate

  end
end

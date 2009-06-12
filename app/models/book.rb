class Book < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    timestamps
  end
    

  lifecycle do
    
    state :borrowed, :default=>true
    state :finished, :returned
    
    transition :read, {:borrowed => :finished},
     :available_to=>:all
     
    transition :return, {[:borrowed, :finished] => :returned},
      :available_to=>:all
    
  end

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end

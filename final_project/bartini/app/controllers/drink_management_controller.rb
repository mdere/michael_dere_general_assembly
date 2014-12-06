class DrinkManagementController < ApplicationController
  def prepare_drink
  end

  def create_drink
    params[:user_account_id] = current_user.id
    new_drink = Drink.new(drink_params)
    if new_drink.save
      Rails.logger.info "Created new drink"
    else
      redirect_to index_path
    end
    redirect_to edit_ingredients_path(new_drink.id)
  end

  def add_ingredient
    new_association = DrinkAssociation.new(drink_id: params[:drink_id], ingredient_id: params[:ingredient][:ingredient_id], quantity: params[:quantity])  
    if new_association.save
      Rails.logger.info "Ingredient saved to associated drink!"
    else
      redirect_to edit_ingredients_path(params[:drink_id])
    end
    redirect_to edit_ingredients_path(params[:drink_id])
  end

  def remove_ingredient
    remove_save = DrinkAssociation.where("drink_id = ? and ingredient_id = ?", params[:drink_id], params[:ingredient_id])
    if remove_save.present?
      remove_save.first.destroy
    end
    redirect_to edit_ingredients_path(params[:drink_id])
  end

  def save_changes
    begin
      save_request = DrinkAssociation.find(params[:association_id])
      if save_request.present? 
        if !(save_request.quantity == params[:quantity])
          save_request.update_attributes(quantity: params[:quantity])
        end
        if !(save_request.step_id == params[:step][:step_id])
          save_request.update_attributes(step_id: params[:step][:step_id])
        end
      end
      redirect_to edit_ingredients_path(params[:drink_id])     
    rescue
      redirect_to edit_ingredients_path(params[:drink_id])
    end
  end

  def edit_ingredients
    @new_drink = Drink.find(params[:drink_id])
    @list_of_unassociated_drink = DrinkAssociation.where("drink_id = ? and step_id = ?", @new_drink.id, 0)
    @list_of_drink_ingredients = DrinkAssociation.where("drink_id = ?", @new_drink.id)
    @list_of_mixing_ingredients = []
    @list_of_adding_after_ingredients = []   
    @list_of_garnishing_ingredients =[]
    @list_of_coating_rim_ingredients = []
    @list_of_drink_ingredients.each do |i|
      if i.step_id == 1
        @list_of_mixing_ingredients.push i
      elsif i.step_id == 2
        @list_of_adding_after_ingredients.push i
      elsif i.step_id == 3
        @list_of_coating_rim_ingredients.push i        
      elsif i.step_id == 4
        @list_of_garnishing_ingredients.push i
      end  
    end
    @list_of_steps = Step.all    
  end

  def drink_page
    @data_file = DataStorage.where("drink_id = ? and user_account_id = ?", params[:drink_id], current_user.id).first
    @drink = Drink.find(params[:drink_id])
    @list_of_drink_ingredients = DrinkAssociation.where("drink_id = ?", @drink.id)
    @list_of_mixing_ingredients = []
    @list_of_adding_after_ingredients = []   
    @list_of_garnishing_ingredients =[]
    @list_of_coating_rim_ingredients = []
    @list_of_drink_ingredients.each do |i|
      if i.step_id == 1
        @list_of_mixing_ingredients.push i
      elsif i.step_id == 2
        @list_of_adding_after_ingredients.push i
      elsif i.step_id == 3
        @list_of_coating_rim_ingredients.push i        
      elsif i.step_id == 4
        @list_of_garnishing_ingredients.push i
      end  
    end   
  end
  
  def upload_file
    post = DataStorage.save(params[:upload], params[:drink_id], current_user.id)
    redirect_to drink_page_path(params[:drink_id])
  end

  def reupload_file
    # set reupload boolean to true
    # improve logic to include this logic into the display,
    post = DataStorage.save(params[:upload], params[:drink_id])
  end

  def update_description
    drink = Drink.find_by(id: params[:drink_id])
    if drink && (drink.user_account_id == current_user.id)
      drink.update_attributes(description: params[:description])
      redirect_to edit_ingredients_path(params[:drink_id])
    else
      redirect_to index_path
    end
  end

  private 

  def drink_association_params
    params.permit(:id, :drink_id, :ingredient_id, :step_id, :quantity)
  end

  def drink_params
    params.permit(:id, :drink_name, :visibility, :user_account_id)
  end

  def ingredient_params
    params.permit(:id, :ingredient_name)
  end

  def data_storage_params
    params.permit(:id, :path, :original_file_name, :user_acount_id, :drink_id)
  end
end
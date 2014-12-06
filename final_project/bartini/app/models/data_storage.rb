class DataStorage < ActiveRecord::Base

  def self.save(upload, drink_id, user_id)
    name =  DataStorage.sanitize_filename(upload['datafile'].original_filename)
    directory = "public/assets/images"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    DataStorage.create(path: path, original_filename: name, user_account_id: user_id, drink_id: drink_id )
  end


  def self.sanitize_filename(file_name)
    # get only the filename
    just_filename = File.basename(file_name) 
    # replace all none alphanumeric, underscore or perioids
    # with underscore
    just_filename.sub(/[^\w\.\-]/,'_') 
  end

  def self.get_data(drink_id, user_id)
    DataStorage.where("drink_id = ? and user_account_id = ?", drink_id, user_id).first
  end

end

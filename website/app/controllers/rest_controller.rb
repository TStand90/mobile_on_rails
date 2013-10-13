class RestController < ApplicationController
  protect_from_forgery except: :receive
  skip_before_filter :verify_authenticity_token
  respond_to :json
  
  def receive
    @json_data = JSON.parse(JSON.parse(params.keys.to_s).first)
    puts @json_data
    key = @json_data.keys[0]
    data = @json_data.values[0]
    case key
    when "newpost"
      save_post(data)
    when "latest"
      get_latest(data)
    when "edit"
      edit_post(data)
    when "delete"
      delete_post(data)
    else
      puts "Unrecognized value"
    end
  end
  
  def save_post(post)
    @post = Post.new(post)
    if @post.save
      respond_to do |format|
        msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
        format.json { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "Error", :message => "Failed", :html => "<b>...</b>" }
        format.json { render :json => msg }
      end
    end
  end
  
  def edit_post(post)
    #@post = Post.find(post)
    puts "Edit function called"
  end
  
  def delete_post(post)
    puts "Delete function called"
  end
  
  def display
    @latestfive = Post.last(5)
  end
  
<<<<<<< HEAD
  def get_latest
   
=======
  def getlatest
    
>>>>>>> 87f5529fe9cd96d00650da4c5c349de62201f22f
  end
end

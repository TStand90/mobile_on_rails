class RestController < ApplicationController
  protect_from_forgery except: :receive
  skip_before_filter :verify_authenticity_token
  respond_to :json
  
  def receive
    @json_data = JSON.parse(JSON.parse(params.keys.to_s).first)
    key = @json_data.keys[0]
    data = @json_data.values[0]
    case key
    when "newpost"
      save_post(data)
    when "latest"
      get_latest(data["count"].to_i)
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
    @edit_post = Post.find_by(id: post['id'])
    @edit_post.update(title: post['title'], topics: post['topics'], text: post['text'])
  end
  
  def delete_post(post)
    @delete_post = Post.find_by(id: post['id'])
    @delete_post.destroy
  end
  
  def get_latest(count)
    @latest = Post.last(count)
    puts @latest.to_json
    render json: @latest
  end
end

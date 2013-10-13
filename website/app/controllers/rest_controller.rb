class RestController < ApplicationController
  protect_from_forgery except: :receive
  skip_before_filter :verify_authenticity_token
  respond_to :json
  
  def receive
    @post = Post.new(JSON.parse(params.keys(0)))
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
  
  def display
    @latestfive = Post.last(5)
  end
  
  def getlatest
    
  end
end

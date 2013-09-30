class RestController < ApplicationController
  protect_from_forgery except: :receive
  skip_before_filter :verify_authenticity_token
  respond_to :json
  def receive
    @jsondata = JSON.parse params.to_a[0][0]
    @post = Post.new(@jsondata)
    if @post.save
      respond_to do |format|
        msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
        format.json { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "Not ok", :message => "Failed", :html => "<b>...</b>" }
        format.json { render :json => msg }
      end
    end
  end
end

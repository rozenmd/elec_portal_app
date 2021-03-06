class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
 
  def show
    @post = Post.find(params[:id])
  end
 
  def new
    @post = Post.new
  end
 
  def create  
    @topic = Topic.find(params[:post][:topic_id]);
    @post = Post.create(:content => params[:post][:content], :topic_id => @topic.id, :user_id => current_user.id)  
    if @post.save  
      @topic.update_attributes(:last_poster_id => current_user.id, :last_post_at => Time.now)  
      flash[:notice] = "Successfully created post." 
      redirect_to "/topics/#{@post.topic_id}" 
    else 
      render :action => 'new' 
    end 
  end
 
  def edit  
    @post = Post.find(params[:id])  
    admin_or_owner_required(@post.user.id)  
  end 
     
  def update  
    @post = Post.find(params[:id])  
    admin_or_owner_required(@post.user.id)  
    if @post.update_attributes(params[:post])  
      @topic = Topic.find(@post.topic_id)  
      @topic.update_attributes(:last_poster_id => current_user.id, :last_post_at => Time.now)  
      flash[:notice] = "Successfully updated post." 
      redirect_to "/topics/#{@post.topic_id}" 
    else 
      render :action => 'edit' 
    end 
  end 
   
  def destroy  
    @post = Post.find(params[:id])  
    admin_or_owner_required(@post.user.id)  
    @post.destroy  
    flash[:notice] = "Successfully destroyed post." 
    redirect_to forums_url  
  end 
end
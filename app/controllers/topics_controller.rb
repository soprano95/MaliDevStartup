class TopicsController < ApplicationController
  before_action :set_sidebar_topics
  layout 'blog'

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.published.recent.page(params[:page]).per(5)
    end
  end

  

  def new
     @topic = Topic.new
  end

  def create
     @topic = Topic.new(topic_params)

     respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Category a ete crée avec succes.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end

  end

private

  def set_sidebar_topics
    @side_bar_topics = Topic.with_blogs
  end


    def topic_params
      params.require(:topic).permit(:title)
    end
end

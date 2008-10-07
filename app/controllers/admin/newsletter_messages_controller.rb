class Admin::NewsletterMessagesController < Admin::BaseController
  before_filter :set_newsletter
  before_filter :set_newsletter_message, :only => [:edit, :update, :destroy]
  
  def index
    @newsletter_messages = @newsletter.newsletter_messages.find(:all)
  end

  def new
    @newsletter_message = @newsletter.newsletter_messages.build
  end

  def create
    @newsletter_message = @newsletter.newsletter_messages.build(params[:newsletter_message])
    if @newsletter_message.save
      flash[:notice] = 'The newsletter message has been created.'
      #redirect_to newsletters_path(@site)
    else
      flash[:error] = 'The newsletter message could not be created.'
      render :action => :new
    end
  end
  
  def edit
    
  end

  def update
    @newsletter_message.update_attributes(params[:newsletter_message])
    if @newsletter_message.save
      flash[:notice] = 'The newsletter message has been updated.'
      #redirect_to newsletters_path(@site)
    else
      flash[:error] = 'The newsletter message could not be updated.'
      render :action => "edit"
    end
  end

  def destroy
    if @newsletter_message.destroy
      flash[:notice] = 'The newsletter message has been deleted.'
      #redirect_to newsletters_path(@site)
    else
      flash[:error] = 'The newsletter message could not be deleted.'
      render :action => :show
    end
  end

  protected
  
  def set_newsletter
    @newsletter = Newsletter.find(
      :first,
      :conditions => {
        :id => params[:newsletter_id],
        :site_id => @site.id
      })
  end

  def set_newsletter_message
    @newsletter_message = @newsletter.newsletter_messages.find(params[:id])
  end
end
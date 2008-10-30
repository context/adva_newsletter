class Admin::NewslettersSubscriptionsController < Admin::BaseController
  before_filter :set_newsletter
  before_filter :set_newsletter_subscription, :only => [:edit, :update, :destroy]
  
  def index
    @newsletter_subscriptions = @newsletter.newsletter_subscriptions.find(:all)
  end

  def new
    @newsletter_subscription = @newsletter.newsletter_subscriptions.build
  end

  def create
    @newsletter_subscription = @newsletter.newsletter_subscriptions.build(params[:newsletter_subscription])
    if @newsletter_subscription.save
      flash[:notice] = 'The newsletter subscription has been created.'
      #redirect_to newsletters_path(@site)
    else
      flash[:error] = 'The newsletter subscription could not be created.'
      render :action => :new
    end
  end
  
  def edit
    
  end

  def update
    @newsletter_subscription.update_attributes(params[:newsletter_subscription])
    if @newsletter_subscription.save
      flash[:notice] = 'The newsletter subscription has been updated.'
      #redirect_to newsletters_path(@site)
    else
      flash[:error] = 'The newsletter subscription could not be updated.'
      render :action => "edit"
    end
  end

  def destroy
    if @newsletter_subscription.destroy
      flash[:notice] = 'The newsletter subscription has been deleted.'
      #redirect_to newsletters_path(@site)
    else
      flash[:error] = 'The newsletter subscription could not be deleted.'
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

  def set_newsletter_subscription
    @newsletter_subscription = @newsletter.newsletter_subscriptions.find(params[:id])
  end
end
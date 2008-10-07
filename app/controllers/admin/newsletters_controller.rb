class Admin::NewslettersController < Admin::BaseController
  before_filter :set_newsletter, :only => [:edit, :update, :destroy]
  
  def index
    @newsletters = Newsletter.find(:all, :conditions => {:site_id => @site.id})
  end

  def new
    @newsletter = Newsletter.new(:site_id => @site.id)
  end

  def create
    @newsletter = Newsletter.new(params[:newsletter])
    @newsletter.site = @site
    if @newsletter.save
      flash[:notice] = 'The newsletter has been created.'
      redirect_to newsletters_path(@site)
    else
      flash[:error] = 'The newsletter could not be created.'
      render :action => :new
    end
  end
  
  def edit
    
  end

  def update
    @newsletter.update_attributes(params[:newsletter])
    if @newsletter.save
      flash[:notice] = 'The newsletter has been updated.'
      redirect_to newsletters_path(@site)
    else
      flash[:error] = 'The newsletter could not be updated.'
      render :action => "edit"
    end
  end

  def destroy
    if @newsletter.destroy
      flash[:notice] = 'The newsletter has been deleted.'
      redirect_to newsletters_path(@site)
    else
      flash[:error] = 'The newsletter could not be deleted.'
      render :action => :show
    end
  end

  protected

  def set_newsletter
    @newsletter = Newsletter.find(:first, :conditions => {:id => params[:id], :site_id => @site.id})
  end

  def current_role_context
    @section
  end
end
class WishesController < ApplicationController
  # GET /wishes
  # GET /wishes.json
  before_filter :authenticate_user!, :except => [:index,  :show, :post_message]
  
  def index
    @wishes = Wish.all
    
    
#    @user = User.find(params[:user_id]) if params[:user_id].present?
    @user ||=  current_user
    if @user
      
      @completed_wishes =  @user.wishes.where(:status => "completed")
      @inprogress_wishes =  @user.wishes.where(:status => "inprogress")
     
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @wishes }
      end
    else
      redirect_to root_path
    end
  end

  # GET /wishes/1
  # GET /wishes/1.json
  def show
    @wish = Wish.find(params[:id])
    if request.path != wish_path(@wish)
      redirect_to @wish, status: :moved_permanently
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wish }
    end
  end

  # GET /wishes/new
  # GET /wishes/new.json
  def new
    @wish = Wish.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wish }
    end
  end

  # GET /wishes/1/edit
  def edit
    @wish = Wish.find(params[:id])
    
  end

  # POST /wishes
  # POST /wishes.json
  def create
  
    
    @wish = Wish.new(params[:wish])    
    @wish.user_id = current_user.id
    
    respond_to do |format|
      if @wish.save
        format.html { redirect_to @wish, notice: 'Wish was successfully created.' }
        format.json { render json: @wish, status: :created, location: @wish }
      else
        format.html { render action: "new" }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wishes/1
  # PUT /wishes/1.json
  def update
    @wish = Wish.find(params[:id])

    respond_to do |format|
      if @wish.update_attributes(params[:wish])
        format.html { redirect_to @wish, notice: 'Wish was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishes/1
  # DELETE /wishes/1.json
  def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy

    respond_to do |format|
      format.html { redirect_to wishes_url }
      format.json { head :no_content }
    end
  end

  def post_message
    @wish = Wish.find(params[:id])
    
    email = user_signed_in? ? current_user.email : params[:email]
    email ||= 'info'
    UserMailer.sent(email , @wish.user, params[:message]).deliver
    redirect_to :back
  
  end

end

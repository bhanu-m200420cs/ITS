class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html
      format.csv{ send_data @items.to_csv }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    item = Item.find(params[:id])
    if current_incharge.admin?
      if item.approved == false
        item.update_attribute(:approved, 'true')
        redirect_to "/items"
      else
        item.update_attribute(:approved, 'false')
        redirect_to "/items"
      end
    end
    
    if current_incharge.user == false
      if item.complaint==true
        item.update_attribute(:complaint, 'false')
        item.update_attribute(:status, 'Working')
        item.update_attribute(:description, 'NA')
      end
    else
      if item.update(item_params)
        redirect_to "/items"
      else
        flash[:errors]=item.errors.full_messages
        redirect_to "/items/<%= @item.id %>/edit"
      end
    end



    if current_incharge.admin == false && current_incharge.user == false
       respond_to do |format|
         if @item.update(item_params)
          format.html { redirect_to "/items", notice: 'Item was successfully updated.' }
           format.json { render :show, status: :ok, location: @item }
         else
           format.html { render :edit }
           format.json { render json: item.errors, status: :unprocessable_entity }
         end
       end
    end   
  end
  

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complain
    @item = Item.find(params[:id])
  end

  def cupdate
    item = Item.find(params[:id])
    if current_incharge.user?
      if item.complaint == false
        item.update_attribute(:complaint, 'true')
        item.update_attribute(:status, 'Not Working')
        
      else
        item.update_attribute(:complaint, 'false')
        item.update_attribute(:status, 'Working')
    
      end      
    end 
    if item.update(item_params)
      redirect_to "/items"
    else
      flash[:errors]=item.errors.full_messages
      redirect_to "/items/<%= @item.id %>/edit"
    end
  end

  def resolved
    item = Item.find(params[:id])
    item.update_attribute(:complaint, 'false')
    item.update_attribute(:status, 'Working')
    item.update_attribute(:description, 'NA')       
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:item_name, :model_number, :make, :lab_name, :installation_date, :typeofpurchase, :warranty, :status, :incharge_id, :approved, :description, :complaint)
    end

    def complain_params
      params.permit(:description)
    end
      
  end

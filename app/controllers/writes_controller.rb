class WritesController < ApplicationController
  before_action :set_write, only: %i[ show edit update destroy ]

  # GET /writes or /writes.json
  def index
    @writes = Write.all
  end

  # GET /writes/1 or /writes/1.json
  def show
  end

  # GET /writes/new
  def new
    @write = Write.new
  end

  # GET /writes/1/edit
  def edit
  end

  # POST /writes or /writes.json
  def create
    @write = Write.new(write_params)

    respond_to do |format|
      if @write.save
        format.html { redirect_to write_url(@write), notice: "Write was successfully created." }
        format.json { render :show, status: :created, location: @write }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @write.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /writes/1 or /writes/1.json
  def update
    respond_to do |format|
      if @write.update(write_params)
        format.html { redirect_to write_url(@write), notice: "Write was successfully updated." }
        format.json { render :show, status: :ok, location: @write }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @write.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /writes/1 or /writes/1.json
  def destroy
    @write.destroy

    respond_to do |format|
      format.html { redirect_to writes_url, notice: "Write was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_write
      @write = Write.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def write_params
      params.require(:write).permit(:book_id, :author_id, :role)
    end
end

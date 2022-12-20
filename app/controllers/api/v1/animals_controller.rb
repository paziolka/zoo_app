class Api::V1::AnimalsController < ApiController
  # GET /api/v1/animals
  def index
    @animals = Animal.all
    render json: @animals
  end

  # GET /api/v1/animals/:id
  # def show
  # end

  # POST /api/v1/animals
  # def create
  # end

  # PUT /api/v1/animals/:id
  # def update
  # end

  # DELETE /api/v1/animals/:id
  # def destroy
  # end
end

module Api
  module V1
    class AnimalsController < ApplicationController
      # GET api/v1/animals
      def index
        animals = Animal.all
        render json: { status: 'SUCCESS', message: 'Loaded animals', data: animals }, status: :ok
      end

      # GET api/v1/animals/1
      def show
        animal = set_animal
        render json: { status: 'SUCCESS', message: 'Loaded animal', data: animal }, status: :ok
      end

      # POST api/v1/animals
      def create
        animal = Animal.new(animal_params)

        if animal.save
          render json: { status: 'SUCCESS', message: 'Saved animal', data: animal }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Animal not saved', data: animal.errors} , status: :unprocessable_entity
        end
      end

      # PATCH/PUT api/v1/animals/1
      def update
        animal = set_animal
        if animal.update(animal_params)
          render json: { status: 'SUCCESS', message: 'Updated animal', data: animal }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Animal not updated', data: animal.errors }, status: :unprocessable_entity
        end
      end

      # DELETE api/v1/animals/1
      def destroy
        animal = set_animal
        animal.destroy
        render json: { status: 'SUCCESS', message: 'Deleted animal', data: animal }, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_animal
        Animal.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def animal_params
        params.permit(:name, :species, :birth, :death)
      end
    end
  end
end


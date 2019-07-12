class PropertiesController < ApplicationController

	def index
		@properties = Property.includes(:units)

		render json: @properties.to_json(include: [:units]), status: :ok
	end

	def create
		@property = Property.new(property_params)

		@property.save
		render json: @property, status: :created
	end

	def update
		@property = Property.find(params[:id])
		if @property.update_attributes(params)
			head(:ok)
		else
			render status: :unprocessed
		end
	end

	def destroy
		@property = Property.find(params[:id])
		if @property.destroy
			head(:ok)
		else
			render status: :unprocessed
		end
	end

	private

	def property_params
		params.require(:property).permit(:name, :description, :address)
	end
end

class PosturesController < ApplicationController
    before_action :require_login
    before_action :get_sequence, only: [:index, :new]

    def index
        redirect_if_request_invalid
    end

    def new
        redirect_if_request_invalid
        @posture = Posture.new
    end

    def create
        @sequence = Sequence.find_by(id: params[:posture][:sequence_id])
        if user_authorized?
            @posture = Posture.new(posture_params)
            if @posture.save
                redirect_to sequence_postures_path(@posture.sequence)
            else
                render :new
            end
        else
            redirect_to sequences_path
        end
    end

    private

    def get_sequence
        @sequence ||= Sequence.find_by(id: params[:sequence_id])
    end

    def user_authorized?
        @sequence.user && (@sequence.user.id == current_user.id)
    end

    def redirect_if_request_invalid
        if @sequence.nil? || !user_authorized?
            redirect_to sequences_path
        end
    end

    def posture_params
        params.require(:posture).permit(:asana_id, :duration, :variation, :sequence_id)
    end

end
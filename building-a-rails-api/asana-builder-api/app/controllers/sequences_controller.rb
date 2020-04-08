class SequencesController < ApplicationController
    before_action :require_login

    def index
        @sequences = current_user.sequences
    end

    def new
        @sequence = Sequence.new
    end

    def create
        @sequence = current_user.sequences.build(sequence_params)
        if @sequence.save
            redirect_to new_sequence_posture_path(@sequence)
        else
            render :new
        end
    end

    private

    def sequence_params
        params.require(:sequence).permit(:name)
    end

end
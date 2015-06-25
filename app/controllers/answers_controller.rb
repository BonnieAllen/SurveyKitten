class AnswersController < ApplicationController

	def new
		@answers = Answers.new
		@question = Question.find params[:question_id]
	end

	def create
		@questions = Question.find params[:question_id]
		answers_params = params[:answer]
		@answers = current_user.answers.new(
			question_id: answers_params[:question_id],
			content: answers_params[:content]

			)

    if @answers.save
      redirect_to question_path(@questions), notice: "You've Got The Answer Sway!"
    else
      render :new
    end
  end
end
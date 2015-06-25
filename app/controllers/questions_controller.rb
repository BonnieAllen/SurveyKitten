class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all 
  end

  def new
      @question = Question.new
    end

  def show
    @question = Question.find params[:id]
    @answers = Answer.select { |a| a[:question_id] == @questions.id }
  end


  def create
    question_params = params[:question]
    @question = Question.new(
      title: question_params[:title],
      content: question_params[:content],
      )

    if @question.save
      redirect_to question_path(@question), notice: "You have the question!"
    else
      render :new
    end
  end
end
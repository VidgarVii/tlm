class ApplicationController < ActionController::Base

  private

  helper_method :tasks

  def tasks
    @tasks ||= Services::Task.new.run
  end
end

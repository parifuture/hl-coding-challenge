class AgentsController < ApplicationController
  DEFAULT_PAGINATION = 10 
  
  def show
    @agent = Agent.find(params[:id])
    @uploaded_transactions = @agent.all_transactions(DEFAULT_PAGINATION, params[:page])
  end

  def random_agent
    redirect_to agent_path(Agent.all.sample)
  end
end

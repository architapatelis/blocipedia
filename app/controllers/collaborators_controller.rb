class CollaboratorsController < ApplicationController
  def new
    # create a new collaborator object
    @collaborator = Collaborator.new
    # list of all the collaborators
    @collaborators = Collaborator.all
    # particular wiki collaborated on - find using id
    @wiki = Wiki.find(params[:wiki_id])

    # array of users collaborating on a particular wiki
    @collaborating_users   = @wiki.collaborators.map { |c| c.user }


    @current_collaborators = @wiki.collaborators

    # to display list under "Add Collaborators" in view
    @users_currently_not_collaborating = User.where.not(id: @collaborating_users.map {|user| user.id})

    @currently_not_collaborators = Collaborator.where.not(id: @current_collaborators.map {|c| c.id})
  end

  def create
    wiki_id = params[:wiki_id]
    collaborator_id = params[:user_id]

    collaborator = Collaborator.new(wiki_id: wiki_id, user_id: collaborator_id)
    puts collaborator

    if collaborator.save
      flash[:notice] = "Colaborator #{collaborator.user.email} has been saved."
    else
      flash[:alert] = " Collaborator #{collaborator.user.email} could not be saved, please try again."
    end
    redirect_to new_wiki_collaborator_path
  end

  def destroy
    collaborator = Collaborator.find(params[:id])

    if collaborator.destroy
      flash[:notice] = "Colaborator #{collaborator.user.email} was removed from wiki."
    else
      flash[:alert] = " Collaborator #{collaborator.user.email} could not be removed."
    end

    redirect_to new_wiki_collaborator_path
  end

end

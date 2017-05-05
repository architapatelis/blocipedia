class CollaboratorsController < ApplicationController

def new
  # create a new collaborator object
  @collaborator  = Collaborator.new

  # find the particular wiki that users are collaborating on
  @wiki = Wiki.find(params[:wiki_id])

  # create an array of users collaborating on a particular wiki
  @collaborating_users = @wiki.collaborators.map { |c| c.user }

  # grab info of collaborator id, user_id, wiki_id
  @current_collaborators = @wiki.collaborators

  # create a list of users that aren't collaborating on a particular wiki
  # listed under 'Add Collaborator'
  @users_currently_not_collaborating = User.where.not(id: @collaborating_users.map {|user| user.id})

end

def create
  wiki_id = params[:wiki_id]
  collaborator_id = params[:user_id]

  collaborator = Collaborator.new(wiki_id: wiki_id, user_id: collaborator_id)
  #puts collaborator

  if collaborator.save
    flash[:notice] = "Collaborator #{collaborator.user.email} saved."
  else
    flash[:alert] = " Collaborator #{collaborator.user.email} save failed."
  end
  redirect_to new_wiki_collaborator_path
end

def destroy
  collaborator = Collaborator.find(params[:id])

  if collaborator.destroy
    flash[:notice] = "Collaborator #{collaborator.user.email} was removed from wiki."
  else
    flash[:alert] = " Collaborator #{collaborator.user.email} could not be removed."
  end


  redirect_to new_wiki_collaborator_path
end
end

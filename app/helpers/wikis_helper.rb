module WikisHelper
  def user_is_authorized_to_delete?(wiki)

    current_user && (current_user == wiki.user || current_user.admin?)
  end

  def make_new_wiki_private?
    current_user.premium? || current_user.admin?
  end

  def edit_wiki_to_make_private?(wiki)
    (current_user.premium? && current_user == wiki.user) || current_user.admin?
  end
end

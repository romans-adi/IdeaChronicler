class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    if user.present?
      can :destroy, Post, author_id: user.id
      can :destroy, Comment, author_id: user.id

      if user.admin?
        can :destroy, Comment
      end
    end
  end
end

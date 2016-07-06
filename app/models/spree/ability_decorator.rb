class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
    can :create, Spree::Review  if user.respond_to?(:has_spree_role?) && user.has_spree_role?('user')
    can :rating, Spree::Review  if user.respond_to?(:has_spree_role?) && user.has_spree_role?('user')

    can :manage, Spree::Review  if user.respond_to?(:has_spree_role?) && user.has_spree_role?('admin')
  end
end

Spree::Ability.register_ability(AbilityDecorator)
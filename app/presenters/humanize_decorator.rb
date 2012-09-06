module HumanizeDecorator

  # See +ApplicationDecorator.humanize+
  def humanize(attribute, key = model.send(attribute), default = key.to_s.humanize)
    self.class.humanize attribute, key, default
  end

  # By default, humanize the attributes listed.
  #
  # Contrived Example:
  #
  #   class UserDecorator < ApplicationDecorator
  #     decorates :user
  #
  #     humanizes :activation_status, :plan_status
  #
  #     # Is a shortcut for:
  #
  #     def activation_status
  #       humanize :activation_status
  #     end
  #
  #     def plan_status
  #       humanize :plan_status
  #     end
  #   end
  #
  # See +ApplicationDecorator.humanize+ for a more detailed example.
  #
  # REVIEW: +humanizes+ could also define Decorator.#{ attr }_options (See
  #         +ApplicationDecorator.options_for_select_with_i18n+ for an example. However,
  #         doing so requires a bit more metaprogramming complexity and an assumption about
  #         where to find the available options.
  #
  def self.humanizes(*attrs)
    attrs.each do |attr|
      define_method attr do         # def status
        humanize attr               #   humanize :status
      end                           # end
    end
  end

  # Humanize an attribute using I18n, falling back to the humanized attributes value.
  #
  # I tend to store attributes like `status` or `role` as underscored strings (a string that
  # would be suitable for a method/variable name) sometimes a simple .humanize will do the
  # trick when it comes to displaying that value in the UI user but other times you need to
  # customize them a bit which is one reason I18n is great. This helps automate the usage of
  # I18n for such a purpose.
  #
  # Contrived Example:
  #
  #   # user_decorator.rb
  #   class UserDecorator < ApplicationDecorator
  #     decorates :user
  #
  #     def activation_status
  #       humanize :activation_status
  #     end
  #
  #     def plan_status
  #       humanize :plan_status
  #     end
  #   end
  #
  #   # en.yml
  #   en:
  #     active: Current
  #     user:
  #       activation_status:
  #         active: 'Activated'
  #
  #   # Examples:
  #   @user.activation_status = 'active';
  #   @user.decorator.activation_status # => 'Activated'
  #
  #   @user.plan_status = 'active'
  #   @user.decorator.plan_status # => 'Current'
  #
  #   @user.activation_status = 'inactive'
  #   @user.decorator.activation_status = 'Inactive'
  def self.humanize(attribute, key, default = key.to_s.humanize)
    i18n_with_scoped_defaults key, [model_name.i18n_key, attribute], default
  end


  # Try to translate a key with I18n and a scope but fallback to less-and-less scope.
  # An example will explain more clearly:
  #
  #   i18n_with_scoped_defaults(:some_key, [:foo, :bar, :baz])
  #
  # Will try the following I18n translations in order:
  # * foo.bar.baz.some_key
  # * foo.bar.some_key
  # * foo.some_key
  # * some_key
  #
  # And if none of the I18n keys translate, it will use the default param (which defaults to
  # humanizing the provided key).
  #
  # The final call to I18n will be:
  #
  #   I18n.t :'foo.bar.baz.some_key', defaults: [
  #     :'foo.bar.some_key', :'foo.some_key', :some_key, 'Some key'
  #   ]
  #
  # REVIEW: Should the root :some_key be used? or should i18n_with_scoped_defaults skip it?
  #
  def self.i18n_with_scoped_defaults(key, scope = [], default = key.to_s.humanize)
    scope << key
    key = scope.join('.').to_sym

    defaults = []
    defaults << scope.join('.').to_sym while scope.delete_at(-2)
    defaults << default

    I18n.t key, default: defaults
  end


  # Use humanize to generate select options for an attribute and given options.
  #
  # Example usage:
  #
  #   # user.rb
  #   class User < AR::Base
  #     ROLES = %w(admin user)
  #     ...
  #   end
  #
  #   # user_decorator.rb
  #   class UserDecorator < ApplicationDecorator
  #     humanizes :role
  #
  #     def self.role_options
  #       options_for_select_with_i18n :role, User::ROLE_OPTIONS
  #     end
  #   end
  #
  #   # admin/users/edit.html.erb
  #   <%= simple_form_for @user do |f| %>
  #     <%= f.input :role, collection: UserDecorator.role_options %>
  #   ...
  def self.options_for_select_with_i18n(attribute, options)
    options.map do |option|
      [ humanize(attribute, option), option ]
    end
  end
end
# frozen_string_literal: true

# name: discourse-plugin-name
# about: TODO
# version: 0.0.1
# authors: Discourse
# url: TODO
# required_version: 2.7.0
# transpile_js: true

enabled_site_setting :add_email_to_serializer_enabled

after_initialize do
  add_to_serializer(:current_user, :email) do
    email = object.email
  end
end

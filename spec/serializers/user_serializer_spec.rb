# frozen_string_literal: true

require 'rails_helper'

describe UserSerializer do
  fab!(:user) { Fabricate(:user, trust_level: 0) }

  context "as current user" do
    it "serializes current user with email" do
      # so we serialize more stuff
      SiteSetting.default_other_auto_track_topics_after_msecs = 0
      SiteSetting.default_other_notification_level_when_replying = 3
      SiteSetting.default_other_new_topic_duration_minutes = 60 * 24

      # user = Fabricate.build(:user,
      #                        id: 1,
      #                        user_profile: Fabricate.build(:user_profile),
      #                        user_option: UserOption.new(dynamic_favicon: true, skip_new_user_tips: true),
      #                        user_stat: UserStat.new
      #                       )

      json = UserSerializer.new(user, scope: Guardian.new(user), root: false).as_json

      expect(json[:email]).to eq(user.email)
    end
  end

end

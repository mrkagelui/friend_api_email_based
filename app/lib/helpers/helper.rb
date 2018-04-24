module Helpers
  module Helper
    def get_friends_of(email)
      friend2s = Friendship.where("friend1 = ?", email).collect(&:friend2)
      friend1s = Friendship.where("friend2 = ?", email).collect(&:friend1)
      friend1s | friend2s
    end

    def get_blockers_of(email)
      Blockade.where("blockee = ?", email).collect(&:blocker)
    end

    def get_followers_of(email)
      Following.where("source = ?", email).collect(&:audience)
    end
  end
end
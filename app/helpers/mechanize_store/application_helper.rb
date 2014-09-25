module MechanizeStore
  module ApplicationHelper
    def title(text)
      content_for(:title){ "#{text} | MechanizeStore" }
    end
  end
end

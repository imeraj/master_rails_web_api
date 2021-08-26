module PgSearch
  class DocumentPresenter < BasePresenter
    related_to    :searchable
    build_with    :content, :resource_url

    def resource_url
      polymorphic_url(object.searchable)
    end
  end
end
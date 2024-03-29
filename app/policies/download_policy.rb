class DownloadPolicy < ApplicationPolicy

  def show?
    user.admin? || user.books.pluck(:id).include?(record.id)
  end
end
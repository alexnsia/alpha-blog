class ArticleCategory < ApplicationRecord

  belongs_to :article
  belongs_to :Category

end

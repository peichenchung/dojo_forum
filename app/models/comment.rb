class Comment < ApplicationRecord
  belongs_to :user #每篇評論屬於特定的使用者
  belongs_to :article, counter_cache: true #每篇評論屬於特定文章
end

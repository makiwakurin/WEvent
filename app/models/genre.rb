class Genre < ActiveHash::Base
 self.data = [
  { id: 1, name: '--' },
  { id: 2, name: 'アウトドア' },
  { id: 3, name: 'ゲーム' },
  { id: 4, name: '飲食' },
  { id: 5, name: '旅行' }
]

  include ActiveHash::Associations
  has_many :events

end


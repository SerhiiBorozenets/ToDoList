class Task < ApplicationRecord
  belongs_to :project


  enum status: { high: 2, medium: 1, low: 0 }

  default_scope {order ('tasks.status DESC')}

end

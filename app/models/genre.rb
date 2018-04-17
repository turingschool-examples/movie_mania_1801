class Genre < ApplicationRecord
  validate_presence_of :name
end
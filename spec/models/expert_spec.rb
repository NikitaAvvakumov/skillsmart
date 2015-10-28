require 'rails_helper'
require 'models/shared_examples_for_users'

RSpec.describe Expert, type: :model do
  it_behaves_like 'any user'
end

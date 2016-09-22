require 'rails_helper'

describe Food do
  it { should belong_to :user }
end

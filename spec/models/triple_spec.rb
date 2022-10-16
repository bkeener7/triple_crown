require 'rails_helper'

RSpec.describe Triple do
    it {should have_many :winners}
end
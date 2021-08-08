require 'rails_helper'

RSpec.describe Publisher, type: :model do
  it "is invalid with a 'nil' name" do
    publisher = Publisher.new(name: nil)
    expect(publisher.valid?).to be false
  end

  it 'is invalid with a blank name' do
    publisher = Publisher.new(name: '')
    expect(publisher.valid?).to be false
  end

  it 'valid with a name' do
    publisher = Publisher.new(name: "O'Reilly")
    expect(publisher.valid?).to be true
  end
end

require "rails_helper"

RSpec.describe Game do

  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_presence_of :kind }

end

require "rails_helper"

RSpec.describe User do
  
  it { expect(subject).to validate_presence_of :first_name }
  it { expect(subject).to validate_presence_of :last_name }

end

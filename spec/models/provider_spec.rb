require "rails_helper"

RSpec.describe Provider do
  
  it { expect(subject).to validate_presence_of :uid }
  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_presence_of :token}
  it { expect(subject).to validate_uniqueness_of :uid }

end

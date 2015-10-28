RSpec.shared_examples 'any user' do
  let(:class_factory) { described_class.name.underscore.to_sym }

  describe 'validations' do
    context "when #{described_class} is persisted" do
      let(:user) { FactoryGirl.build_stubbed class_factory }

      it 'requires first_name' do
        user.first_name = nil

        expect(user).not_to be_valid
      end

      it 'requires last_name' do
        user.last_name = nil

        expect(user).not_to be_valid
      end
    end

    context "when #{described_class} is not persisted" do
      let(:user) { FactoryGirl.build class_factory }

      it 'does not require first_name' do
        user.first_name = nil

        expect(user).to be_valid
      end

      it 'does not require last_name' do
        user.last_name = nil

        expect(user).to be_valid
      end
    end

    describe 'email validation' do
      let(:user) { FactoryGirl.build_stubbed class_factory }

      it 'is required' do
        user.email = nil

        expect(user).not_to be_valid
      end

      it 'must be unique' do
        dup_user = user.dup
        dup_user.save

        expect(user).not_to be_valid
      end
    end
  end
end

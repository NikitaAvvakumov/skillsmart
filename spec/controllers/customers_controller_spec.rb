require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'before_actions' do
    controller do
      def show
        render text: 'show success'
      end

      def index
        render text: 'index success'
      end
    end

    let(:customer) { double 'customer' }

    before do
      allow(Customer).to receive(:find).with('1').and_return customer
    end

    specify 'set_customer assigns @customer' do
      get :show, id: 1

      expect(assigns(:customer)).to eq customer
    end

    describe 'authenticate_customer!' do
      context 'when not signed in' do
        example do
          get :show, id: 1

          expect(response).to redirect_to new_customer_session_path
        end
      end

      context 'when signed in' do
        example do
          sign_in FactoryGirl.create :customer

          get :show, id: 1

          expect(response.body).to eq 'show success'
        end
      end
    end

    describe 'authorize_customer!' do
      before { sign_in FactoryGirl.create :customer }

      context 'when not authorized' do
        example do
          allow(controller).to receive(:current_customer).
            and_return double

          get :index, id: 1

          expect(response).to redirect_to root_url
        end
      end

      context 'when authorized' do
        example do
          allow(controller).to receive(:current_customer).
            and_return customer

          get :index, id: 1

          expect(response.body).to eq 'index success'
        end
      end
    end
  end
end

require 'rails_helper'

RSpec.describe ExpertsController, type: :controller do
  describe 'before_actions' do
    controller do
      def edit
        render text: 'edit success'
      end

      def show
        render text: 'show success'
      end

      def index
        render text: 'index success'
      end
    end

    let(:expert) { double 'expert' }

    before do
      allow(Expert).to receive_message_chain(:includes, :find).
        with('1').and_return expert
    end

    specify 'set_expert assigns @expert' do
      get :edit, id: 1

      expect(assigns(:expert)).to eq expert
    end

    describe 'authenticate_user!' do
      context 'when not signed in' do
        example do
          get :show, id: 1

          # TODO: Where should this redirect?
          expect(response).to redirect_to new_customer_session_path
        end
      end

      context 'when signed in' do
        example do
          sign_in FactoryGirl.create :expert

          get :show, id: 1

          expect(response.body).to eq 'show success'
        end
      end
    end

    describe 'authorize_expert!' do
      before { sign_in FactoryGirl.create :expert }

      context 'when not authorized' do
        example do
          allow(controller).to receive(:current_expert).
            and_return double

          get :edit, id: 1

          expect(response).to redirect_to root_url
        end
      end

      context 'when authorized' do
        example do
          allow(controller).to receive(:current_expert).
            and_return expert

          get :index, id: 1

          expect(response.body).to eq 'index success'
        end
      end
    end
  end
end

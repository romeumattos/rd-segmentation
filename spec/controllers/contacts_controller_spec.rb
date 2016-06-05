require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  let(:valid_attributes) do
    { name: 'Paulo', email: 'paulo@test.com', state: 'Santa Catarina' }
  end

  let(:invalid_attributes) do
    { name: nil, email: nil, state: nil }
  end

  describe 'GET #index' do
    it "assigns all contacts as @contact" do
      contact = FactoryGirl.create(:contact)
      get :index
      expect(assigns(:contacts)).to eq([contact])
    end
    it "assigns contacts filter by name as @contact" do
      contact = FactoryGirl.create(:contact)
      get :index, name: contact.name
      expect(assigns(:contacts)).to eq([contact])
    end
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "renders the :index view" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Contact' do
        expect do
          post :create, contact: valid_attributes
        end.to change(Contact, :count).by(1)
      end
      it 'returns contact object' do
        post :create, contact: valid_attributes
        expect(assigns(:contact)).to eq(Contact.last)
      end
    end
  end

  context 'with invalid params' do
    it 'should not persist record' do
      expect do
        post :create, contact: invalid_attributes
      end.to change(Contact, :count).by(0)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { state: 'São Paulo' }
      end

      it 'updates the requested contact' do
        contact = FactoryGirl.create(:contact)
        put :update, { id: contact.to_param, contact: new_attributes }
        contact.reload
        expect(contact.state).to eq('São Paulo')
      end
      it 'assigns the requested contact as @contact' do
        contact = FactoryGirl.create(:contact)
        put :update, { id: contact.to_param, contact: valid_attributes }
        expect(assigns(:contact)).to eq(contact)
      end
    end

    context 'with invalid params' do
      it 'assigns the contact as @contact' do
        contact = FactoryGirl.create(:contact)
        put :update, { id: contact.to_param, contact: invalid_attributes }
        expect(assigns(:contact)).to eq(contact)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested contact' do
      contact = FactoryGirl.create(:contact)
      expect do
        delete :destroy, id: contact.to_param
      end.to change(Contact, :count).by(-1)
    end
  end
end

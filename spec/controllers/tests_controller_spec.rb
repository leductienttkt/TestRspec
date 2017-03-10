require 'rails_helper'

RSpec.describe TestsController, type: :controller do
	let(:test){FactoryGirl.create :test}

	
  context "GET #index" do
  	before do
      get :index
    end
    it_behaves_like "responds", :index
  end

  context "GET #edit" do
    before do
      get :edit, params: {id: test.id}
    end
    it_behaves_like "responds", :edit
  end

  context "GET #new" do
    before do
      get :new
    end
    it_behaves_like "responds", :new
  end

  context "GET #show" do 
    before do
      get :show, params: {id: test.id}
    end
    it_behaves_like "responds", :show
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new test" do
        expect{
          post :create, params: {test: FactoryGirl.attributes_for(:test)}
        }.to change(Test,:count).by(1)
        expect(response).to redirect_to Test.last
      end
    end

    context "with invalid attributes" do
      it "does not save test with invalid score" do
      	expect{
          post :create, params: {test: FactoryGirl.attributes_for(:test, score: nil)}
        }.to_not change(Test,:count)
        expect(response).to render_template :new
      end

      it "does not save test with invalid name" do
      	expect{
          post :create, params: {test: FactoryGirl.attributes_for(:test, name: nil)}
        }.to_not change(Test,:count)
        expect(response).to render_template :new
      end
    end 
  end	

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @contact's attributes" do
        put :update, 
          params: { id: test, 
            test: FactoryGirl.attributes_for(:test, name: "Nara", score: 100)}
        test.reload
        expect(test.name).to eq("Nara")
        expect(test.score).to eq(100)
      end

      it "redirect to test path" do
        put :update, params: {id: test, test: FactoryGirl.attributes_for(:test)}
        expect(response).to redirect_to test_path test
      end
    end

    context "with invalid attributes" do
      it "does not changes @contact's attributes invalid score" do
        put :update, 
          params: {id: test, 
            test: FactoryGirl.attributes_for(:test, name: "Nara", score: nil)}
        test.reload
        expect(test.name).not_to eq("Nara")
        expect(response).to render_template :edit
      end

      it "does not changes @contact's attributes invalid name" do
        put :update, 
          params: {id: test, 
            test: FactoryGirl.attributes_for(:test, name: nil, score: 1000)}
        test.reload
        expect(test.score).not_to eq(1000)
        expect(response).to render_template :edit
      end
    end
  end

  context "DELETE #destroy" do
  	test_del = FactoryGirl.create :test
    it "deletes the test" do
      expect{
        delete :destroy, params: {id: test_del}       
      }.to change(Test, :count).by(-1)
      expect(response).to redirect_to root_path
    end  
  end
end

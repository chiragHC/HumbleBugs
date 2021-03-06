require 'spec_helper'

describe :unverified do
  before :all do
    @user = FactoryGirl.create :user
    Authorization.current_user = @user
  end
  after :all do
    Authorization.current_user = nil
    @user.destroy
  end

  it 'should have the unverified role' do
    expect(Authorization.current_user.role_symbols).to eq([:unverified])
  end

  context :bundles do
    xit 'should be able to get a list of permissible bundles' do
      is_expected.to be_allowed_to :index, true
    end

    xit 'should be able to read active bundles' do
      bundle = FactoryGirl.create :bundle, :active
      expect(bundle).to be_allowed_to :read
    end

    Types::Bundle::STATES.each do |s|
      next if s.last == :active
      it "should not be able to read bundles in the #{s.last} state" do
        bundle = FactoryGirl.create :bundle, state: s.last.to_s
        expect(bundle).not_to be_allowed_to :read
      end
    end

    include_examples 'can not X to any', :create, :update, :delete
  end

  context :developers do
    include_examples 'can not X to any', :create, :read, :read_address, :update, :update_address, :delete
  end

  context :games do
    xit 'should be able to get a list of permissible games' do
      is_expected.to be_allowed_to :index, true
    end
    xit 'should be able to read those that are in an active bundle' do
      bundle = FactoryGirl.create :bundle, :active
      game = FactoryGirl.create :game, bundle: bundle
      expect(game).to be_allowed_to :read
    end
    Types::Bundle::STATES.each do |s|
      next if s.last == :active
      it 'should not be able to read those that are in an #{s.last} bundle' do
        bundle = FactoryGirl.create :bundle, state: s.last.to_s
        game = FactoryGirl.create :game, bundle: bundle
        expect(game).not_to be_allowed_to :read
      end
    end

    it 'can not read games in testing state' do
      game = FactoryGirl.create :game, :testing
      expect(game).not_to be_allowed_to :read
    end

    include_examples 'can not X to any', :create, :update, :delete
  end

  context :issues do
    include_examples 'can not X to any', :create, :read, :update, :delete
  end

  context :comments do
    include_examples 'can not X to any', :create, :read, :update, :delete
  end

  context :ports do
    include_examples 'can not X to any', :create, :read, :update, :delete
  end

  context :predefined_tags do
    include_examples 'can not X to any', :create, :read, :update, :delete
  end

  context :releases do
    include_examples 'can not X to any', :create, :read, :update, :delete
  end

  context :test_results do
    include_examples 'can not X to any', :create, :read, :update, :delete
  end

  context :users do
    include_examples 'edit my own user record'
    include_examples 'can not X to any', :nda
  end

  context :systems do
    include_examples 'can not X to any', :create, :read, :update, :delete
  end
end
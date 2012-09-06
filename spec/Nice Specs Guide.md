DRY specs:

http://benscheirman.com/2011/05/dry-up-your-rspec-files-with-subject-let-blocks

escribe Card do
  subject do
    Card.new(card_type)
  end
  
  describe "#value" do  
    context "Two of Hearts" do
      let(:card_type) { "2H" }
      its(:value) { should == 2 }
    end
  
    describe "Face Cards" do  
    
      context "King of Clubs" do
        let(:card_type) { "KC" }
        its(:value) { should == 13 }
      end

    context "Bad Value" do
      it "should raise StandardError" do
        expect { card = Card.new("ZZ") }.to raise_error(StandardError)
      end
    end

        

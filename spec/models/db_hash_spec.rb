require 'spec_helper'

describe DbHash do
  it "should return nil" do
    DbHash['email'].should be_nil
  end
  
  it "should create string" do
    DbHash['email'] = 'me@here.com'
    DbHash.count.should == 1
    DbHash['email'].should == 'me@here.com'
  end

  it "should save integer" do
    DbHash['cap'] = 100
    DbHash['cap'].should == 100
  end

  it "should save float" do
    DbHash['pi'] = 3.1415926
    DbHash['pi'].should == 3.1415926
  end

  it "should save boolean" do
    DbHash['neverdie'] = true
    DbHash['neverdie'].should == true
  end
      
  it "should update" do
    DbHash['email'] = 'me@here.com'
    DbHash.count.should == 1
    DbHash['email'] = 'you@here.com'
    DbHash.count.should == 1
    DbHash['email'].should == 'you@here.com'
  end
  
  it "should delete" do
    DbHash['email'] = 'me@here.com'
    val = DbHash.delete('email')
    DbHash.count.should == 0
    val.should == 'me@here.com'
  end
  
  it "should cache" do
    DbHash['email'] = 'me@here.com'
    DbHash.should_not_receive(:find_by_hkey)
    DbHash['email'].should == 'me@here.com'
  end
end
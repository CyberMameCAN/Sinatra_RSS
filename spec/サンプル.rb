describe '四則演算' do
  it '1 + 1は 2 になる事' do
    expect(1+1).to eq 2
  end
  it '10 - 1 は 9 になる事' do
    expect(10 -1).to eq 9
  end
end

describe '四則演算' do
  describe '足し算' do
    it '1+1は2になる事' do
      expect(1+1).to eq 2
    end
  end
  describe '引き算' do
    it '10-1は9になる事' do
      expect(10-1).to eq 9
    end
  end
end

-----------------------------------------------------------
class User
  def initialize(name:, age:)
    @name = name
    @age = age
  end
  
  def greet
    if @age <= 12
      "ぼくは#{@name}だよ。"
    else
      "僕は#{@name}です。"
    end
  end
end

describe User do
  describe '#greet' do
    before do
      @params = {name: 'たろう'}
    end
    context 'ひらがなで答える事' do
      before do
        @params.merge!(age:12)
      end
      it '12歳以下の場合' do
        user = User.new(@params)
        expect(user.greet).to eq 'ぼくはたろうだよ。'
      end
    end
    context '漢字で答える事' do
      before do
        @params.merge!(age:13)
      end
      it '13歳以上の場合' do
        user = User.new(@params)
        expect(user.greed).to eq '僕はたろうです。'
      end
    end
  end
end
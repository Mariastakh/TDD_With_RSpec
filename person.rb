class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    if !@middle_name.nil?
      return @first_name + ' ' + @middle_name + ' ' + @last_name
    else
      return  @first_name + ' ' + @last_name
    end
  end

  def full_name_with_middle_initial
    if !@middle_name.nil?
      return @first_name + ' ' + @middle_name[0] + ' ' + @last_name
    else
      return @first_name + ' ' + @last_name
    end
  end

  def initials
    if !@middle_name.nil?
      return @first_name[0] + ' ' + @middle_name[0] + ' ' + @last_name[0]
    else
      return @first_name[0] + ' ' + @last_name[0]
    end
  end

end

RSpec.describe Person do
  describe "#full_name" do

    it "concatenates first name, middle name, and last name with spaces" do
      p = Person.new(first_name: 'Maria', middle_name: 'Andreivna', last_name: 'Astakhova')
      expect(p.full_name()).to eq("#{p.instance_variable_get("@first_name")} #{p.instance_variable_get("@middle_name")} #{p.instance_variable_get("@last_name")}")
    end

    it "does not add extra spaced if middle name is missing" do
      p = Person.new(first_name:'Maria', last_name: 'Astakhova')
      expect(p.full_name()).to eq("#{p.instance_variable_get("@first_name")} #{p.instance_variable_get("@last_name")}")
    end
  end

  describe "#full_name_with_middle_initial" do
    it "Concatenates full name with a middle initial" do
      p = Person.new(first_name: 'James', middle_name: 'Duncan', last_name: 'MacPherson')
      expect(p.full_name_with_middle_initial()).to eq("#{p.instance_variable_get("@first_name")} #{p.instance_variable_get("@middle_name")[0]} #{p.instance_variable_get("@last_name")}")
    end

    it "Does not add extra spaces or a period when middle name is missing" do
      p = Person.new(first_name: 'James', last_name: 'MacPherson')
      expect(p.full_name_with_middle_initial()).to eq("#{p.instance_variable_get("@first_name")} #{p.instance_variable_get("@last_name")}")
    end
  end

  describe "#initials" do
    it "Concatenates all initials" do
      p = Person.new(first_name: 'James', middle_name: 'Duncan', last_name: 'MacPherson')
      expect(p.initials()).to eq("#{p.instance_variable_get("@first_name")[0]} #{p.instance_variable_get("@middle_name")[0]} #{p.instance_variable_get("@last_name")[0]}")
    end

    it "Concatenates the first and last name initials only" do
      p = Person.new(first_name: 'James', last_name: 'MacPherson')
      expect(p.initials()).to eq("#{p.instance_variable_get("@first_name")[0]} #{p.instance_variable_get("@last_name")[0]}")
    end
  end

end

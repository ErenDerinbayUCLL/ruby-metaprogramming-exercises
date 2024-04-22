# TODO: Write my_attr_reader
# TODO: Write my_attr_writer
# TODO: Write my_attr_accessor, preferably using my_attr_reader and my_attr_writer

class Singer
  def initialize(first_name, last_name, birth_year, greatest_hit)
    @first_name = first_name
    @last_name = last_name
    @birth_year = birth_year
    @greatest_hit = greatest_hit
  end

  # Define my_attr_reader method
  def my_attr_reader(variable)
    instance_variable_get("@#{variable}")
  end

  # Define my_attr_writer method
  def my_attr_writer(variable, value)
    instance_variable_set("@#{variable}", value)
  end

  # Define my_attr_accessor method
  def my_attr_accessor(*variables)
    variables.each do |variable|
      define_method(variable) do
        instance_variable_get("@#{variable}")
      end

      define_method("#{variable}=") do |value|
        instance_variable_set("@#{variable}", value)
      end
    end
  end

  # Usage example of my_attr_accessor
  # my_attr_accessor :birth_year, :greatest_hit

  # Usage example of my_attr_reader
  def first_name
    my_attr_reader(:first_name)
  end

  # Usage example of my_attr_writer
  def last_name=(value)
    my_attr_writer(:last_name, value)
  end

  def to_s
    "#{first_name} #{my_attr_reader(:last_name)}, born in #{my_attr_reader(:birth_year)}, greatest hit: \"#{my_attr_reader(:greatest_hit)}\""
  end
end


sinatra = Singer.new("Nancy", "Sinatra", 1940, "These Boots Are Made for Walkin'")

puts sinatra

sinatra.my_attr_writer(:first_name, "Frank")
sinatra.my_attr_writer(:birth_year, 1915)
sinatra.my_attr_writer(:greatest_hit, "My Way")

puts sinatra

class XmlWriter
  def initialize
    @xml = ""
    @indentation_level = 0
  end

  def to_s
    @xml
  end

  private def indent
    "  " * @indentation_level
  end

  private def method_missing(tag_name, *args, &block)
    # TODO: implement method_missing, you can either assume that a block was given,
    #       or that args contains a single string argument
    if block_given?
      @xml << indent << "<#{tag_name}>\n"
      @indentation_level += 1
      instance_eval(&block)
      @indentation_level -= 1
      @xml << indent << "</#{tag_name}>\n"
    else
      @xml << indent << "<#{tag_name}>#{args[0]}</#{tag_name}>\n"
    end
  end
end

xml = XmlWriter.new.singers do
  singer do
    first_name "Frank"
    last_name "Sinatra"
  end
  singer do
    first_name "Ella"
    last_name "Fitzgerald"
  end
end

puts xml

xml = XmlWriter.new.books do
  book do
    title "The Hitchhiker's Guide to the Galaxy"
    author "Douglas Adams"
  end
  book do
    title "The Stranger"
    author "Albert Camus"
  end
end

puts xml

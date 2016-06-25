require_relative "chisel_file"


class ListConverter

def convert_unordered_list(line)
   "<ul>\n" + line.gsub(/\* (.+)/, "<li>\\1</li>") + "\n</ul>\n"
end

def convert_ordered_list(line)
  "<ol>\n" + line.gsub(/^\d+\. (.+)/, "<li>\\1</li>") + "\n</ol>\n"
end

end

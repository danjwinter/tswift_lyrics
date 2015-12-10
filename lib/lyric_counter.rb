require 'pry'
class LyricCounter

  def self.lyric_count(file)
    file_content = File.read(file)
    formatted_file = file_content.gsub("\n", " ")
    shazam(formatted_file)
  end

  private

  def self.shazam(arg)
    sanitized_arg = sanitize(arg)
    sanitized_arg.uniq.length
  end

  def self.sanitize(arg)
    arg.downcase.split.map do |word|
      word.gsub(/\W+/, '')
    end
  end


end
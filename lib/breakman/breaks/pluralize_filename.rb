class Breakman
  class PluralizeFilename
    def initialize path
      @path = path
    end

    def file_name
      File.basename @path, ".rb"
    end

    def run!
      # TODO: what if these are the same? (e.g. models/sms.rb)
      new_path = @path.sub /#{file_name}.rb$/, "#{file_name.pluralize}.rb"
      FileUtils.mv @path, new_path
    end
  end
end

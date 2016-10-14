module DataGenerator

  MAJOR = 1
  MINOR = 0
  PATCH = ENV['PATCH_VERSION'] || 0

  private_constant :MAJOR, :MINOR, :PATCH

  VERSION = "#{MAJOR}.#{MINOR}.#{PATCH}"

end

require 'minitest/autorun'
require 'm1key_gallery_generator'

class FullTest < Minitest::Test

  def test_full
    bin_script = File.join(File.dirname(__FILE__), '..', 'bin', 'console')
    working_directory = File.join(File.dirname(__FILE__), '..', 'test', 'data')
    output_file = File.join(working_directory, 'index.html')
    expected_output_file = File.join(working_directory, 'expected_output.html')
    if File.exist?(output_file) then FileUtils.rm(output_file) end
    puts `ruby -Ilib #{bin_script} #{working_directory}`
    files_are_equal = FileUtils.compare_file(output_file, expected_output_file)
    unless files_are_equal then
      puts 'Handy comparison command: diff test/data/index.html test/data/expected_output.html'
    end
    assert files_are_equal, 'Generated index.html does not match expected_output.html.'
  end

  def test_full_10_photos
    bin_script = File.join(File.dirname(__FILE__), '..', 'bin', 'console')
    working_directory = File.join(File.dirname(__FILE__), '..', 'test', 'data_10')
    output_file = File.join(working_directory, 'index.html')
    expected_output_file = File.join(working_directory, 'expected_output.html')
    if File.exist?(output_file) then FileUtils.rm(output_file) end
    puts `ruby -Ilib #{bin_script} #{working_directory}`
    files_are_equal = FileUtils.compare_file(output_file, expected_output_file)
    unless files_are_equal then
      puts 'Handy comparison command: diff test/data_10/index.html test/data_10/expected_output.html'
    end
    assert files_are_equal, 'Generated index.html does not match expected_output.html.'
  end
end

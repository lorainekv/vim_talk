require 'minitest/autorun'
require_relative 'image_downloader'

class TestImageDownloader < Minitest::Test

  # Wrapper method
  def test_it_downloads_an_image_from_wikipedia
    article_name = "Frida Kahlo"
    ImageDownloader.download_wikipedia_image_for(article_name)
    filename = article_name.gsub(" ","_").downcase
    assert(File.file?("./#{filename}"))
    File.delete(filename)
  end

  def test_it_returns_a_wikipedia_image_url
    image_url = ImageDownloader.get_image_url_for("Frida Kahlo")
    assert(image_url.include?("Frida_Kahlo"))
  end

  def test_it_downloads_an_image_from_a_url
    article_name = "Frida Kahlo"
    image_url = ImageDownloader.get_image_url_for(article_name)
    filename = article_name.gsub(" ","_").downcase
    ImageDownloader.download_image(image_url, filename)
    assert(File.file?("./#{filename}"))
    File.delete(filename)
  end

end


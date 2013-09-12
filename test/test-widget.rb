require "mirelutter/widget"

class WidgetTest < Test::Unit::TestCase
  def test_image?
    assert_nil(Mirelutter::Widget.image?(__FILE__))
    assert_not_nil(Mirelutter::Widget.image?("test/fixtures/nijip.png"))
    assert_not_nil(Mirelutter::Widget.image?("hoge.PNG"))
    assert_not_nil(Mirelutter::Widget.image?("hoge.jpg"))
    assert_not_nil(Mirelutter::Widget.image?("hoge.jpeg"))
    assert_not_nil(Mirelutter::Widget.image?("hoge.gif"))
  end

  def test_buffer_from_file_of_text
    widget = Mirelutter::Widget.__send__(:buffer_from_file, __FILE__)
    assert_equal(GtkSource::Buffer, widget.class)
  end

  def test_buffer_from_file_of_binary
    assert_raise Mirelutter::Error do
      Mirelutter::Widget.__send__(:buffer_from_file, "test/fixtures/nijip.png")
    end
  end

  def test_buffer_from_text_of_utf8
    widget = Mirelutter::Widget.__send__(:buffer_from_text, "御庭番")
    assert_equal(GtkSource::Buffer, widget.class)
  end

  def test_buffer_from_text_of_sjis
    widget = Mirelutter::Widget.__send__(:buffer_from_text, "御庭番".encode("SJIS"))
    assert_equal(GtkSource::Buffer, widget.class)
  end
end

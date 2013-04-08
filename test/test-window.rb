require "mireru/window"

class TestWindow < Test::Unit::TestCase
  def setup
    @window = Mireru::Window.new
  end

  def test_add_from_file_of_scrollable
    file = __FILE__
    mock(Mireru::Widget).create(file) { Gtk::TextView.new }
    mock(@window).show_all
    @window.add_from_file(file)
    assert_equal(Gtk::ScrolledWindow, @window.child.class)
    assert_equal(Gtk::TextView, @window.child.child.class)
  end

  def test_add_from_file_of_no_scrollable
    file = "fixtures/nijip.png"
    mock(Mireru::Widget).create(file) { Gtk::Image.new }
    mock(@window).show_all
    @window.add_from_file(file)
    assert_equal(Gtk::ScrolledWindow, @window.child.class)
    assert_equal(Gtk::Viewport, @window.child.child.class)
    assert_equal(Gtk::Image, @window.child.child.child.class)
  end
end

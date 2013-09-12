require "mirelutter/video"
require "clutter-gtk"

class VideoTest < Test::Unit::TestCase
  def test_create
    filename = "XXX.ogm"
    widget = Mirelutter::Video.create(filename)
    assert_not_nil(widget)
    assert_equal(ClutterGtk::Embed, widget.class)
    widget.destroy
  end
end

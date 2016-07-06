require "test_helper"

class NotifactionTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Notifaction::VERSION
  end

  def test_success
    assert Notify.success("A test message")
  end

  def test_error
    user_conf = {}
    user_conf[:auto_quit] = false
    refute Notify.error("A test message", user_conf)
  end

  def test_warning
    assert Notify.warning("A test message")
  end

  def test_spacer
    assert Notify.spacer
  end

  def test_info
    assert Notify.info("A test message")
  end

  def test_note
    assert Notify.note("A test message")
  end

  def test_spit
    assert Notify.spit("A test message")
  end
end

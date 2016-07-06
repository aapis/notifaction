require 'test_helper'

class NotifactionTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::Notifaction::VERSION
  end

  def test_success
    assert Notify.success("A test message", { print: false })
  end

  def test_error
    refute Notify.error("A test message", { print: false, auto_quit: false })
  end

  def test_warning
    assert Notify.warning("A test message", { print: false })
  end

  def test_spacer
    assert Notify.spacer({ print: false })
  end

  def test_info
    assert Notify.info("A test message", { print: false })
  end

  def test_note
    assert Notify.note("A test message", { print: false })
  end

  def test_spit
    assert Notify.spit("A test message", { print: false })
  end

  def test_load_hooks
    refute Notifaction::Hooks.load_all().empty?, "You need to create and populate your ~/.notifaction.yml config file - see ..."
  end

end

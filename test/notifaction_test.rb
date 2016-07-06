require "test_helper"

class NotifactionTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Notifaction::VERSION
  end

  def test_success
    user_conf = {}
    user_conf[:print] = false
    assert Notify.success("A test message", user_conf)
  end

  def test_error
    user_conf = {}
    user_conf[:auto_quit] = false
    user_conf[:print] = false
    refute Notify.error("A test message", user_conf)
  end

  def test_warning
    user_conf = {}
    user_conf[:print] = false
    assert Notify.warning("A test message", user_conf)
  end

  def test_spacer
    user_conf = {}
    user_conf[:print] = false
    assert Notify.spacer(user_conf)
  end

  def test_info
    user_conf = {}
    user_conf[:print] = false
    assert Notify.info("A test message", user_conf)
  end

  def test_note
    user_conf = {}
    user_conf[:print] = false
    assert Notify.note("A test message", user_conf)
  end

  def test_spit
    user_conf = {}
    user_conf[:print] = false
    assert Notify.spit("A test message", user_conf)
  end

  def test_concurrency
    base = ::Notifaction::Type::Base.new

    10.times.map do |idx|
      assert base.fire_hooks({ method: __method__ }), "Do you have any hooks configured in ~/.notifaction.yml?"
    end
  end
end

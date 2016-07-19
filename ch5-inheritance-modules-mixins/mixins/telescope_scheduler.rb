require_relative 'observer_impl'

class TelescopeScheduler
  include Observable

  def initialize
    # This clashes with observer_list in the Observable mixin, with unpredictable results
    @observer_list = []
  end

  def add_viewer(viewer)
    @observer_list << viewer
  end
end

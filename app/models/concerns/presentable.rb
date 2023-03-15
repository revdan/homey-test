module Presentable
  def decorate
    "#{self.class.base_class}Presenter".constantize.new(self)
  end
end

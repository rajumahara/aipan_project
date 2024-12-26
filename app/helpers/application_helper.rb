module ApplicationHelper
  def flash_type(type)
    case type
    when "notice" then "bg-green-100 border-green-500 text-green-700"
    when "alert" then "bg-red-100 border-red-500 text-red-700"
    end
  end
end

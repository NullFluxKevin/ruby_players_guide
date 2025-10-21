class String
  # Text colors
  def black     = "\e[30m#{self}\e[0m"
  def red       = "\e[31m#{self}\e[0m"
  def green     = "\e[32m#{self}\e[0m"
  def yellow    = "\e[33m#{self}\e[0m"
  def blue      = "\e[34m#{self}\e[0m"
  def magenta   = "\e[35m#{self}\e[0m"
  def cyan      = "\e[36m#{self}\e[0m"
  def white     = "\e[37m#{self}\e[0m"

  # Bright text colors
  def bright_black   = "\e[90m#{self}\e[0m"
  def bright_red     = "\e[91m#{self}\e[0m"
  def bright_green   = "\e[92m#{self}\e[0m"
  def bright_yellow  = "\e[93m#{self}\e[0m"
  def bright_blue    = "\e[94m#{self}\e[0m"
  def bright_magenta = "\e[95m#{self}\e[0m"
  def bright_cyan    = "\e[96m#{self}\e[0m"
  def bright_white   = "\e[97m#{self}\e[0m"

  # Background colors
  def on_black     = "\e[40m#{self}\e[0m"
  def on_red       = "\e[41m#{self}\e[0m"
  def on_green     = "\e[42m#{self}\e[0m"
  def on_yellow    = "\e[43m#{self}\e[0m"
  def on_blue      = "\e[44m#{self}\e[0m"
  def on_magenta   = "\e[45m#{self}\e[0m"
  def on_cyan      = "\e[46m#{self}\e[0m"
  def on_white     = "\e[47m#{self}\e[0m"

  # Bright backgrounds
  def on_bright_black   = "\e[100m#{self}\e[0m"
  def on_bright_red     = "\e[101m#{self}\e[0m"
  def on_bright_green   = "\e[102m#{self}\e[0m"
  def on_bright_yellow  = "\e[103m#{self}\e[0m"
  def on_bright_blue    = "\e[104m#{self}\e[0m"
  def on_bright_magenta = "\e[105m#{self}\e[0m"
  def on_bright_cyan    = "\e[106m#{self}\e[0m"
  def on_bright_white   = "\e[107m#{self}\e[0m"

  # Text style modifiers
  def bold       = "\e[1m#{self}\e[22m"
  def dim        = "\e[2m#{self}\e[22m"
  def italic     = "\e[3m#{self}\e[23m"
  def underline  = "\e[4m#{self}\e[24m"
  def blink      = "\e[5m#{self}\e[25m"
  def inverse    = "\e[7m#{self}\e[27m"
  def hidden     = "\e[8m#{self}\e[28m"
  def strike_through = "\e[9m#{self}\e[29m"
end

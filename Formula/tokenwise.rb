class Tokenwise < Formula
  desc "Save 70-90% on AI API costs with smart model routing"
  homepage "https://github.com/chentang1127-hub/tokenwise"
  version "0.1.0"
  license "MIT"

  # Multi-architecture support — one binary per platform
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/chentang1127-hub/tokenwise/releases/download/v#{version}/tokenwise-macos-arm64.tar.gz"
      sha256 "e92a57e68d98a68938286652a16008bec82cd5c4e0cd33fb7daf498c8ed91947"
    else
      url "https://github.com/chentang1127-hub/tokenwise/releases/download/v#{version}/tokenwise-macos-amd64.tar.gz"
      sha256 "c11a4d5e9e52337f96264a53042d0a5669081348fa0052c616e5b7bf09a5d079"
    end
  elsif OS.linux?
    url "https://github.com/chentang1127-hub/tokenwise/releases/download/v#{version}/tokenwise-linux-amd64.tar.gz"
    sha256 "6bbb8061aeb82273fa63cf15735813d541918daf5ec301d28cc485ee300af556"
  end

  def install
    bin.install "tokenwise"
  end

  service do
    run [opt_bin/"tokenwise", "--config", etc/"tokenwise/config.yaml", "start"]
    keep_alive true
    log_path var/"log/tokenwise.log"
    error_log_path var/"log/tokenwise-error.log"
  end

  test do
    assert_match "TokenWise", shell_output("#{bin}/tokenwise --help")
  end
end

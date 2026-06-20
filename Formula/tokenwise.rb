class Tokenwise < Formula
  desc "Save 70-90% on AI API costs with smart model routing"
  homepage "https://github.com/chentang1127-hub/tokenwise"
  version "0.1.0"
  license "MIT"

  # Multi-architecture support — one binary per platform
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/chentang1127-hub/tokenwise/releases/download/v#{version}/tokenwise-macos-arm64.tar.gz"
      sha256 "PLACEHOLDER_macos_arm64"
    else
      url "https://github.com/chentang1127-hub/tokenwise/releases/download/v#{version}/tokenwise-macos-amd64.tar.gz"
      sha256 "PLACEHOLDER_macos_amd64"
    end
  elsif OS.linux?
    url "https://github.com/chentang1127-hub/tokenwise/releases/download/v#{version}/tokenwise-linux-amd64.tar.gz"
    sha256 "PLACEHOLDER_linux_amd64"
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

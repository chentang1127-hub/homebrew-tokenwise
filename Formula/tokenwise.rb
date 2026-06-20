class Tokenwise < Formula
  desc "Save 70-90% on AI API costs with smart model routing"
  homepage "https://github.com/chentang1127-hub/tokenwise"
  version "0.2.0"
  license "MIT"

  # Multi-architecture support — one binary per platform
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/chentang1127-hub/tokenwise/releases/download/v#{version}/tokenwise-macos-arm64.tar.gz"
      sha256 "792e404c22ac10979841b8e2e1eca6363d55a48507332f4f7e48568ed4ce8ab3"
    else
      url "https://github.com/chentang1127-hub/tokenwise/releases/download/v#{version}/tokenwise-macos-amd64.tar.gz"
      sha256 "6621fb15c63ef82094def7b17adb7dccf01a4bc44902264e64b953f4684a1087"
    end
  elsif OS.linux?
    url "https://github.com/chentang1127-hub/tokenwise/releases/download/v#{version}/tokenwise-linux-amd64.tar.gz"
    sha256 "8ccf901f01a77356e3e5fdff318ec712d8a2829226e91a5ff481d3b009b5fb6b"
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

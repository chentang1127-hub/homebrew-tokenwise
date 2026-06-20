class Tokenwise < Formula
  desc "Save 70-90% on AI API costs with smart model routing"
  homepage "https://github.com/chentang1127-hub/tokenwise"
  version "0.1.1"
  license "MIT"

  # Multi-architecture support — one binary per platform
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/chentang1127-hub/tokenwise/releases/download/v#{version}/tokenwise-macos-arm64.tar.gz"
      sha256 "8e511b230d335a38cc0be05ffcebbd4bea0d92b580b0a5b1aa10d29d156898ed"
    else
      url "https://github.com/chentang1127-hub/tokenwise/releases/download/v#{version}/tokenwise-macos-amd64.tar.gz"
      sha256 "456d5bb2b5f69f1fa5ca3476a8a51d4c8030ea36b95548493bb8d17d2326ff2a"
    end
  elsif OS.linux?
    url "https://github.com/chentang1127-hub/tokenwise/releases/download/v#{version}/tokenwise-linux-amd64.tar.gz"
    sha256 "ae188d040b787c0c374f6b892423bb85874d5e8e6eed2f506735cdfa5b8b78c2"
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

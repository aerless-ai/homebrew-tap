class Aerless < Formula
  desc "Aerless, picture tool and coding assistant for the terminal"
  homepage "https://aerless.io"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.0/aerless-darwin-arm64"
      sha256 "06d1786d798e2e73953fa9055d18e631d897932fa64551d9fd9442ec4f6d5109"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.0/aerless-code-darwin-arm64"
        sha256 "55923261b062859861b23f070c134776a8e8d78a5163eb8f32feb5e5b89ce2ec"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.0/aerless-darwin-x64"
      sha256 "da4a38a7a3bdf5861772318ff277c11edc7ca3a6200c0f136e3789058d3051d9"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.0/aerless-code-darwin-x64"
        sha256 "e4d7f145d84619e1a6a669329ecba2787e2ffeb1a276f0f32e6ae965a091e943"
      end
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.0/aerless-linux-arm64"
      sha256 "22ffc42bafd97b836516708eeae7618efe9de8913f6e14fe1126ac6d6205e93b"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.0/aerless-code-linux-arm64"
        sha256 "ee77457f568725d03b9030c82e33ca6a4f99143037b0cbd0e3086d3a87c88adc"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.0/aerless-linux-x64"
      sha256 "4d6b640622abf505dec2381b6797f020d0fe435178bcd24a660d8916b9e9799b"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.0/aerless-code-linux-x64"
        sha256 "703cdd62d56e3d9549a38ae8f66650662482b1fa44763433a51cbeaaaa4ba2c7"
      end
    end
  end

  def install
    bin.install Dir["aerless-*"].first => "aerless"
    resource("aerless-code").stage { bin.install Dir["aerless-code-*"].first => "aerless-code" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aerless --version")
  end
end

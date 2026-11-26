class Aerless < Formula
  desc "Aerless, picture tool and coding assistant for the terminal"
  homepage "https://aerless.io"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.1/aerless-darwin-arm64"
      sha256 "9be1970dff70f4aecc756f79196e242d5afa2e2f19052e699569d1c26fa669e1"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.1/aerless-code-darwin-arm64"
        sha256 "e52636c9e3ce584671c58694613ddbd2d4df368314465e6f91016da246682ef6"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.1/aerless-darwin-x64"
      sha256 "2a020f2ed7707020f8c8098af27355b1ef76b41fdc78a771c1b69d3e2980cfa1"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.1/aerless-code-darwin-x64"
        sha256 "7bd124dc084fa26a1e228e86993a080cb6ffec4419ac90c52b78a97842c87120"
      end
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.1/aerless-linux-arm64"
      sha256 "0f6893845061b04e797870430d8430cb62ccafaab8d0b635d91bd958bfc6a164"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.1/aerless-code-linux-arm64"
        sha256 "b3ec54a98248740f64a18f9adef207c169fe85e7bafd139f744f2e20e6b2728d"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.1/aerless-linux-x64"
      sha256 "66170cf48053d7965a23ec5e0f8d3ca9cda695ba277563056cb32cd727ba7d73"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.1/aerless-code-linux-x64"
        sha256 "854898064a00b7dce93362705e4c371bbf53cfdd77a2372635d599e2a607e2a0"
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

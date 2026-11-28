class Aerless < Formula
  desc "Aerless, picture tool and coding assistant for the terminal"
  homepage "https://aerless.ai"
  version "0.2.7"

  on_macos do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.7/aerless-darwin-arm64"
      sha256 "023088e51f16d239a5491a118673c97f1fc79318c15596d29cecaeef0317b197"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.7/aerless-code-darwin-arm64"
        sha256 "ac68168d6ad549c721d1bce3ea3b64da099e06695ea82c0775b243b292f350bd"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.7/aerless-darwin-x64"
      sha256 "b1c0c03c121e7524022a433525db6bfb5e1c5046d92890070a729ec7e81223f7"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.7/aerless-code-darwin-x64"
        sha256 "22719ef24e0a38fd753dbd44171aef0df6e2666f1d22f3f345faecd796816326"
      end
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.7/aerless-linux-arm64"
      sha256 "15a332eab058c211d1da1322ebe1610d3c20593bfec42d79cf1e603c08a16b91"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.7/aerless-code-linux-arm64"
        sha256 "e6dd7e9682f861af1788271b22e31aaa7df741a41e0c5dab9cfb286b5f34f6d7"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.7/aerless-linux-x64"
      sha256 "cf24d5973cde14d88a9cf1c0bb8899171a750f4850b4b0f398955ec2adb6f9d7"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.7/aerless-code-linux-x64"
        sha256 "2f5f230c6797764661b4d3d9c4a343addcbd4c858b419b5e9e3629ebc09f552c"
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

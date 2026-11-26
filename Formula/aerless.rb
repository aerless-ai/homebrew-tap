class Aerless < Formula
  desc "Aerless, picture tool and coding assistant for the terminal"
  homepage "https://aerless.io"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.2/aerless-darwin-arm64"
      sha256 "c2bee37ad46cbdcfaa1f54e478d76dc4e713744a11adaf0887a84da4879f8047"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.2/aerless-code-darwin-arm64"
        sha256 "22b2d58bfe82be9d7603dcdb8125ecfd82a0117f2aec6025e12a27b962443142"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.2/aerless-darwin-x64"
      sha256 "bdcd49cc0203a63580f926b8309404a16124633ce40a3fe51840fc47339fc1d8"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.2/aerless-code-darwin-x64"
        sha256 "70db01346aa6de8912714082687323fcc0cfd92e5cfd5b3f2ab746b225659d55"
      end
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.2/aerless-linux-arm64"
      sha256 "2a8aec14bb3d1e8d014b9b83d02a6bc4bf54254bc9e61f5cc032fe5dfa57a461"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.2/aerless-code-linux-arm64"
        sha256 "a128b5da0bb2fe2abf85234cf2e2570ffd085f2dd62f41374e96dda392da50f8"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.2/aerless-linux-x64"
      sha256 "d06873994d17d0fd4348744e3bc95ee01e17999c10aa70dc68632b843fc0cfa7"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.2/aerless-code-linux-x64"
        sha256 "f33b83401eb7bb34e163d4eb89141f60bd3e3009681ebcfebd83d335cfae3845"
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

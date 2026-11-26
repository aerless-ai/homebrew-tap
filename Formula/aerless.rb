class Aerless < Formula
  desc "Aerless, picture tool and coding assistant for the terminal"
  homepage "https://aerless.io"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.4/aerless-darwin-arm64"
      sha256 "97f72384948c731d63d14c09e4e5ba584f1a0ce94521c2d6010dfb892b997979"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.4/aerless-code-darwin-arm64"
        sha256 "6ffdc52feb77937be2a77874a3be38911d3d19dc6c4532a36fb714e8d8b2ac91"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.4/aerless-darwin-x64"
      sha256 "db0370a8139a726c078a64de2a9cf05f39bcac8817364dc1ed5c0ec2e402dad2"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.4/aerless-code-darwin-x64"
        sha256 "bd079a9fd3991fcfc588b5b6e6c7e8b80202beea3d66032ad91b1a762238cfe0"
      end
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.4/aerless-linux-arm64"
      sha256 "d1e4453582cdd5c4264124c995e20635ba06e924b9a206c3a92eb7d88f591f57"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.4/aerless-code-linux-arm64"
        sha256 "2fc7fafeeb6713911cc1cbd21b99078bd2bb29ea0ce6cc20aee98f86f914ddce"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.4/aerless-linux-x64"
      sha256 "6c1871e6e2af6a96b600e7f6a9db3008fdd074392ea0fa932f61746c61238ebd"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.4/aerless-code-linux-x64"
        sha256 "57fa7388291ca4657d62d1f84e05dfa8bf9d0c0acf10d8674732664caa690731"
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

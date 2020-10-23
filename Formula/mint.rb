class Mint < Formula
  desc "Dependency manager that installs and runs Swift command-line tool packages"
  homepage "https://github.com/yonaskolb/Mint"
  url "https://github.com/yonaskolb/Mint/archive/0.15.0.tar.gz"
  sha256 "ad792e792a79d8bc89511a83d3fdd6a4ea9ec3779f2e848aba58fb02ecadcfc6"
  license "MIT"

  bottle do
    cellar :any_skip_relocation
    sha256 "cc7a17ee517fe97f12852c71252896c9ca30dfe8236f816f2990b2d0553ff5b3" => :catalina
    sha256 "f70e96558839243a845c67f15defbd8718ad5a9e094ae1c1b998ac9faf4399b0" => :mojave
  end

  depends_on xcode: ["12.0", :build]

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    # Test by showing the help scree
    system "#{bin}/mint", "help"
    # Test showing list of installed tools
    system "#{bin}/mint", "list"
  end
end

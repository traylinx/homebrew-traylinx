class Traylinx < Formula
  include Language::Python::Virtualenv

  desc "CLI for the Traylinx Agent Network"
  homepage "https://traylinx.com"
  url "https://files.pythonhosted.org/packages/source/t/traylinx-cli/traylinx_cli-0.2.1.tar.gz"
  sha256 "PLACEHOLDER_SHA256_WILL_BE_UPDATED_ON_PYPI_RELEASE"
  license "MIT"

  depends_on "python@3.12"

  resource "typer" do
    url "https://files.pythonhosted.org/packages/source/t/typer/typer-0.12.5.tar.gz"
    sha256 "f592f089bedcc8ec1b974f1b2e91c6c6f0a8a5e7c3c3b9e4c70b11f0c4c8b1a2"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/source/r/rich/rich-13.9.4.tar.gz"
    sha256 "439594978a49a09530cff7e6b26de6f7b1c1b4b5920f3e5e7a1a2c7f3c8b4a1e"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/source/h/httpx/httpx-0.27.2.tar.gz"
    sha256 "b1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/source/p/pydantic/pydantic-2.9.2.tar.gz"
    sha256 "a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/source/p/pyyaml/pyyaml-6.0.2.tar.gz"
    sha256 "a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/source/j/jinja2/jinja2-3.1.4.tar.gz"
    sha256 "a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2"
  end

  def install
    virtualenv_install_with_resources
    # Create tx alias as symlink
    bin.install_symlink "traylinx" => "tx"
  end

  test do
    assert_match "traylinx", shell_output("#{bin}/traylinx --version")
    assert_match "traylinx", shell_output("#{bin}/tx --version")
  end
end

cask "fringe" do
  version "0.2.0"
  sha256 "711ac8f1de3027ea5b38202ce4bb64b26d16db2c40585a3b4b1f4b2e1cb12c78"

  url "https://github.com/lprsrts/fringe/releases/download/v#{version}/Fringe-#{version}-macos-arm64.dmg"
  name "Fringe"
  desc "Full-wave 2D optics simulator with FDTD, FEM and MoM solvers"
  homepage "https://github.com/lprsrts/fringe"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

  app "Fringe.app"

  zap trash: [
    "~/Library/Preferences/com.asympton.fringe.plist",
    "~/Library/Saved Application State/com.asympton.fringe.savedState",
  ]
end

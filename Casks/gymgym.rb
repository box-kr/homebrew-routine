cask "gymgym" do
  version "1.13"
  sha256 "d3600373b58cba3c3fe8d1d3c69fcb084e393b65628208de6152c015609839da"

  url "https://github.com/box-kr/gymgym/releases/download/v#{version}/GymGym-#{version}.zip"
  name "GymGym"
  desc "macOS Menu Bar Utility for monitoring system resources and displaying animated runners"
  homepage "https://github.com/box-kr/gymgym"

  app "GymGym.app"

  # 다운로드 후 Gatekeeper에서 '손상된 앱'으로 인식되는 것을 방지합니다.
  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/GymGym.app"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/com.andrew.GymGym.plist",
  ]
end

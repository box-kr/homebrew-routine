cask "routine" do
  version "1.0.8"
  sha256 "ba4d57cbd0aa8400019e773d6a1ee57f83e159ca61fd60366895629346a4ec71"

  url "https://github.com/box-kr/routine/releases/download/v#{version}/Routine-#{version}.zip"
  name "Routine"
  desc "macOS automation system based on user patterns (Time, Wi-Fi, Battery, etc.)"
  homepage "https://github.com/box-kr/routine"

  app "Routine.app"

  # 다운로드 후 Gatekeeper에서 '손상된 앱'으로 인식되는 것을 방지합니다.
  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/Routine.app"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/kr.box.apps.macos.routine.plist",
  ]
end

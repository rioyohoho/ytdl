const defaultConfig = {
  language: "en",
  theme: "dark",
  fontFamily: "system-ui, sans-serif",
  fontSize: 13,
  textColor: "#ffffff",
  accentColor: "#0099ff",
  bgColorHex: "#0f172a",
  bgOpacity: 0.95,
  bgColor: "rgba(15, 23, 42, 0.95)",
  bgImageUrl: "",
  bgImageOpacity: 0.15,
  borderSize: 1,
  borderColor: "#ffffff",
  borderRadius: 8
};

function getAppConfig() {
  const saved = localStorage.getItem("ytdl_config");
  return saved ? { ...defaultConfig, ...JSON.parse(saved) } : defaultConfig;
}

function saveAppConfig(config) {
  localStorage.setItem("ytdl_config", JSON.stringify(config));
}
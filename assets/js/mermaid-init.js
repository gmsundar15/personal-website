/* ================================
   Mermaid Init with Catppuccin Latte/Mocha
   ================================ */

function getThemeVars(flavor) {
  const styles = getComputedStyle(document.documentElement);
  return {
    background: styles.getPropertyValue(`--ctp-${flavor}-base`).trim(),
    primaryColor: styles.getPropertyValue(`--ctp-${flavor}-accent`).trim(),
    primaryTextColor: styles.getPropertyValue(`--ctp-${flavor}-text`).trim(),
    lineColor: styles.getPropertyValue(`--ctp-${flavor}-subtext0`).trim(),
    secondaryColor: styles.getPropertyValue(`--ctp-${flavor}-surface0`).trim(),
    tertiaryColor: styles.getPropertyValue(`--ctp-${flavor}-surface1`).trim(),
    noteBkgColor: styles.getPropertyValue(`--ctp-${flavor}-mantle`).trim(),
    noteTextColor: styles.getPropertyValue(`--ctp-${flavor}-text`).trim(),
  };
}

function initMermaid() {
  const computedTheme = determineComputedTheme(); // "dark" | "light"
  const flavor = computedTheme === "dark" ? "mocha" : "latte";

  mermaid.initialize({
    startOnLoad: true,
    theme: "base",
    themeVariables: getThemeVars(flavor),
  });

  // Re-render any already rendered diagrams
  mermaid.init(undefined, document.querySelectorAll(".mermaid"));
}

// Initial run
initMermaid();

/* Re-initialize on system theme change */
const computedTheme = determineComputedTheme(); // "dark" | "light"
window.matchMedia(computedTheme).addEventListener("change", () => {
  initMermaid();
});

/* Mermaid Init with Catppuccin Latte/Mocha */
(function () {
  const getComputedTheme = () => {
    if (typeof determineComputedTheme === "function") {
      return determineComputedTheme();
    }

    return document.documentElement.getAttribute("data-theme") || "light";
  };

  const getThemeVars = (flavor) => {
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
  };

  const getMermaidConfig = (theme) => ({
    startOnLoad: false,
    theme: "base",
    themeVariables: getThemeVars(theme === "dark" ? "mocha" : "latte"),
  });

  const prepareMermaidNodes = () => {
    document.querySelectorAll("pre > code.language-mermaid").forEach((elem) => {
      const backup = elem.parentElement;
      if (backup.dataset.mermaidProcessed === "true") return;

      backup.dataset.mermaidProcessed = "true";
      backup.classList.add("unloaded");

      const mermaidNode = document.createElement("pre");
      mermaidNode.classList.add("mermaid");
      mermaidNode.dataset.mermaidSource = elem.textContent;
      mermaidNode.textContent = elem.textContent;
      backup.after(mermaidNode);
    });
  };

  const resetMermaidNodes = () => {
    document.querySelectorAll(".mermaid").forEach((elem) => {
      const source = elem.dataset.mermaidSource || elem.previousElementSibling?.querySelector("code.language-mermaid")?.textContent;
      if (!source) return;

      elem.dataset.mermaidSource = source;
      elem.removeAttribute("data-processed");
      elem.textContent = source;
    });
  };

  const addMermaidZoom = () => {
    if (typeof d3 === "undefined") return;

    d3.selectAll(".mermaid svg").each(function () {
      if (this.dataset.zoomBound === "true") return;
      this.dataset.zoomBound = "true";

      const svg = d3.select(this);
      svg.html(`<g>${svg.html()}</g>`);
      const inner = svg.select("g");
      const zoom = d3.zoom().on("zoom", (event) => {
        inner.attr("transform", event.transform);
      });
      svg.call(zoom);
    });
  };

  const renderMermaid = async (theme = getComputedTheme()) => {
    if (typeof mermaid === "undefined") return;

    prepareMermaidNodes();
    resetMermaidNodes();
    mermaid.initialize(getMermaidConfig(theme));

    const nodes = document.querySelectorAll(".mermaid");
    if (typeof mermaid.run === "function") {
      await mermaid.run({ nodes });
    } else {
      mermaid.init(undefined, nodes);
    }

    addMermaidZoom();
  };

  window.setMermaidTheme = renderMermaid;

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", () => renderMermaid());
  } else {
    renderMermaid();
  }

  window.matchMedia("(prefers-color-scheme: dark)").addEventListener("change", () => renderMermaid());
})();

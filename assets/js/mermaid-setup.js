/* Create mermaid diagram as another node and hide the code block, appending the mermaid node after it
    this is done to enable retrieving the code again when changing theme between light/dark */
document.addEventListener("readystatechange", () => {
  if (document.readyState === "complete") {
    document.querySelectorAll("pre>code.language-mermaid").forEach((elem) => {
      const svgCode = elem.textContent;
      const backup = elem.parentElement;
      backup.classList.add("unloaded");
      /* create mermaid node */
      let mermaid = document.createElement("pre");
      mermaid.classList.add("mermaid");
      const text = document.createTextNode(svgCode);
      mermaid.appendChild(text);
      backup.after(mermaid);
    });

    // inside mermaid-setup.js
    initMermaid();

    /* Zoomable mermaid diagrams */
    if (typeof d3 !== "undefined") {
      window.addEventListener("load", function () {
        var svgs = d3.selectAll(".mermaid svg");
        svgs.each(function () {
          var svg = d3.select(this);
          svg.html("<g>" + svg.html() + "</g>");
          var inner = svg.select("g");
          /* fix whitepace around svg by tightening viewBox*/
          var bbox = this.getBBox();
          svg.attr("viewBox", `${bbox.x} ${bbox.y} ${bbox.width} ${bbox.height}`);
          svg.style("width", "100%").style("height", "auto");
          svg.attr("preserveAspectRatio", "xMidYMid meet");

          /* Set initial zoom transform (e.g., zoomed out to 100%, and centered) */
          var initialScale = 1.0;
          var svgWidth = svg.node().clientWidth;
          var svgHeight = svg.node().clientHeight;

          /* Centering translation */
          var translateX = (svgWidth * (1 - initialScale)) / 2;
          var translateY = (svgHeight * (1 - initialScale)) / 2;

          /* Apply initial transform: translate + scale */
          inner.attr("transform", `translate(${translateX}, ${translateY}) scale(${initialScale})`);
          var zoom = d3.zoom().on("zoom", function (event) {
            inner.attr("transform", event.transform);
          });
          svg.call(zoom);
        });
      });
    }
  }
});

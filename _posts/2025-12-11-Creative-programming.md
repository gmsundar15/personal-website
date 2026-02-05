---
layout: post
title: Creating Generative Geometric Art in Python
date: 2025-12-12 13:34:50 +0530
description: Using scientific computing primitives to generate custom geometric art for my home.
tags: scientific-computing art python
categories: programming art 2025
images:
  slider: true
toc:
  begining: true
---

## The Challenge

I am a firm believer that anything and everything you learn can shape your life
in the most unexpected way. Thinking "out-of-the-box" is usually just applying
what you have learnt in a seemingly unrelated domain to the problem at hand.

The problem was simple, I had to design digital art for glass doors to be
installed in my living room to match the abstract art painted on one of its
walls. Initially, I was distracted by the standard tools for the job, digital
art tools such as [Krita](https://krita.org/) or
[INKSCAPE](https://inkscape.org). But frustrated by the amount of time needed to
learn digital art as someone with no experience, I was motivated to think
outside the box. And then I had a flash of inspiration:
the python library `plotly` is capable of generating SVG files and an abstract
triangular pattern is nothing more than a randomly seeded triangular mesh.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/glass-design/wall.jpg"
        title="Wall" width=400 class="img-fluid rounded z-depth-1 d-block
        mx-auto" %}
    </div>
</div>
<div class="caption">
    The pattern on my wall.
</div>

I have always been drawn to the idea of _Creative Programming_, having been
introduced to it by the [creativecoding
subreddit](https://www.reddit.com/r/creativecoding/). This was the perfect
opportunity to try my hand it, without falling into the rabbit hole of exploring
mathematics and computer science way beyond what I already know.

---

## The Solution

### Delaunay Triangulation

Delaunay triangulation is a method to generate triangles in a given space while
avoiding "sliver triangle" i.e. triangles with at least one of the interior
angles being very small. This is achieved mathematically by generating a set of
points such that the circumcircle of any triangle does not contain any points
other than the three points of the triangle, hence ensuring that the minimum
interior angles of the triangles are maximised and slivers are avoided.

Delaunay triangulation is widely used in mesh generation algorithms in FEA. This
is because the geometry of sliver triangles doesn't work very well with FEA
formulations and their presence brings down the quality of the solution.
Because of its widespread use in meshing, implementation of
the Delaunay triangulation algorithm is readily available in the `scipy`
package, making the initial implementation easy.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        <div style="color: var(--global-text-color);">
            <svg class="main-svg img-fluid  d-block mx-auto" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="400" height="400" style="" viewBox="0 0 800 800"><rect x="0" y="0" width="800" height="800" style="fill: var(--global-text-color); fill-opacity: 0;"/><defs id="defs-cc3a66"><g class="clips"><clipPath id="clipcc3a66xyplot" class="plotclip"><rect width="800" height="800"/></clipPath><clipPath class="axesclip" id="clipcc3a66x"><rect x="0" y="0" width="800" height="800"/></clipPath><clipPath class="axesclip" id="clipcc3a66y"><rect x="0" y="0" width="800" height="800"/></clipPath><clipPath class="axesclip" id="clipcc3a66xy"><rect x="0" y="0" width="800" height="800"/></clipPath></g><g class="gradients"/><g class="patterns"/></defs><g class="bglayer"><rect class="bg" x="0" y="0" width="800" height="800" style="fill: rgb(0, 0, 0); fill-opacity: 0; stroke-width: 0;"/></g><g class="layer-below"><g class="imagelayer"/><g class="shapelayer"/></g><g class="cartesianlayer"><g class="subplot xy"><g class="layer-subplot"><g class="shapelayer"/><g class="imagelayer"/></g><g class="minor-gridlayer"><g class="x"/><g class="y"/></g><g class="gridlayer"><g class="x"/><g class="y"/></g><g class="zerolinelayer"/><g class="layer-between"><g class="shapelayer"/><g class="imagelayer"/></g><path class="xlines-below"/><path class="ylines-below"/><g class="overlines-below"/><g class="xaxislayer-below"/><g class="yaxislayer-below"/><g class="overaxes-below"/><g class="overplot"><g class="xy" transform="" clip-path="url(#clipcc3a66xyplot)"><g class="scatterlayer mlayer"><g class="trace scatter trace34c651" style="stroke-miterlimit: 2; opacity: 1;"><g class="fills"/><g class="errorbars"/><g class="lines"><path class="js-line" d="M792.85,685.57L360.9,623.18L21.54,739.27L792.85,685.57" style="vector-effect: none; fill: none; stroke: currentColor; stroke-opacity: 1; stroke-width: 4px; opacity: 1;"/></g><g class="points"/><g class="text"/></g><g class="trace scatter trace168050" style="stroke-miterlimit: 2; opacity: 1;"><g class="fills"/><g class="errorbars"/><g class="lines"><path class="js-line" d="M360.9,623.18L79.89,320.46L21.54,739.27L360.9,623.18" style="vector-effect: none; fill: none; stroke: currentColor; stroke-opacity: 1; stroke-width: 4px; opacity: 1;"/></g><g class="points"/><g class="text"/></g><g class="trace scatter trace378b42" style="stroke-miterlimit: 2; opacity: 1;"><g class="fills"/><g class="errorbars"/><g class="lines"><path class="js-line" d="M527.55,6.35L651.09,344.15L792.85,685.57L527.55,6.35" style="vector-effect: none; fill: none; stroke: currentColor; stroke-opacity: 1; stroke-width: 4px; opacity: 1;"/></g><g class="points"/><g class="text"/></g><g class="trace scatter traceb44bac" style="stroke-miterlimit: 2; opacity: 1;"><g class="fills"/><g class="errorbars"/><g class="lines"><path class="js-line" d="M651.09,344.15L360.9,623.18L792.85,685.57L651.09,344.15" style="vector-effect: none; fill: none; stroke: currentColor; stroke-opacity: 1; stroke-width: 4px; opacity: 1;"/></g><g class="points"/><g class="text"/></g><g class="trace scatter tracebf711d" style="stroke-miterlimit: 2; opacity: 1;"><g class="fills"/><g class="errorbars"/><g class="lines"><path class="js-line" d="M79.89,320.46L651.09,344.15L527.55,6.35L79.89,320.46" style="vector-effect: none; fill: none; stroke: currentColor; stroke-opacity: 1; stroke-width: 4px; opacity: 1;"/></g><g class="points"/><g class="text"/></g><g class="trace scatter tracec78012" style="stroke-miterlimit: 2; opacity: 1;"><g class="fills"/><g class="errorbars"/><g class="lines"><path class="js-line" d="M651.09,344.15L79.89,320.46L360.9,623.18L651.09,344.15" style="vector-effect: none; fill: none; stroke: currentColor; stroke-opacity: 1; stroke-width: 4px; opacity: 1;"/></g><g class="points"/><g class="text"/></g></g></g></g><g class="zerolinelayer-above"/><path class="xlines-above crisp" d="M0,0" style="fill: none;"/><path class="ylines-above crisp" d="M0,0" style="fill: none;"/><g class="overlines-above"/><g class="xaxislayer-above"/><g class="yaxislayer-above"/><g class="overaxes-above"/></g></g><g class="polarlayer"/><g class="smithlayer"/><g class="ternarylayer"/><g class="geolayer"/><g class="funnelarealayer"/><g class="pielayer"/><g class="iciclelayer"/><g class="treemaplayer"/><g class="sunburstlayer"/><g class="glimages"/><defs id="topdefs-cc3a66"><g class="clips"/></defs><g class="layer-above"><g class="imagelayer"/><g class="shapelayer"><g class="shape-group" data-index="0" clip-path="url(#clipcc3a66xy)"><path data-index="0" fill-rule="evenodd" d="M1308.2,1465.9499999999998A848.5350000000001,848.54 0 1,1 459.665,617.4099999999999A848.5350000000001,848.54 0 0,1 1308.2,1465.9499999999998Z" style="opacity: 1; stroke: currentColor; stroke-opacity: 1; fill: rgb(0, 0, 0); fill-opacity: 0; stroke-dasharray: 9px, 9px; stroke-width: 2px;"/></g><g class="shape-group" data-index="1" clip-path="url(#clipcc3a66xy)"><path data-index="1" fill-rule="evenodd" d="M375.28999999999996,542.845A231.41,231.41499999999996 0 1,1 143.88,311.43000000000006A231.41,231.41499999999996 0 0,1 375.28999999999996,542.845Z" style="opacity: 1; stroke: currentColor; stroke-opacity: 1; fill: rgb(0, 0, 0); fill-opacity: 0; stroke-dasharray: 9px, 9px; stroke-width: 2px;"/></g><g class="shape-group" data-index="2" clip-path="url(#clipcc3a66xy)"><path data-index="2" fill-rule="evenodd" d="M17053.340000000004,-2740.5299999999997A8491.185000000001,8491.18 0 1,1 8562.155,-11231.71A8491.185000000001,8491.18 0 0,1 17053.340000000004,-2740.5299999999997Z" style="opacity: 1; stroke: currentColor; stroke-opacity: 1; fill: rgb(0, 0, 0); fill-opacity: 0; stroke-dasharray: 9px, 9px; stroke-width: 2px;"/></g><g class="shape-group" data-index="3" clip-path="url(#clipcc3a66xy)"><path data-index="3" fill-rule="evenodd" d="M823.3200000000002,570.045A234.26500000000004,234.265 0 1,1 589.0550000000001,335.78A234.26500000000004,234.265 0 0,1 823.3200000000002,570.045Z" style="opacity: 1; stroke: currentColor; stroke-opacity: 1; fill: rgb(0, 0, 0); fill-opacity: 0; stroke-dasharray: 9px, 9px; stroke-width: 2px;"/></g><g class="shape-group" data-index="4" clip-path="url(#clipcc3a66xy)"><path data-index="4" fill-rule="evenodd" d="M664.54,255.95000000000002A295.885,295.88 0 1,1 368.655,-39.92999999999998A295.885,295.88 0 0,1 664.54,255.95000000000002Z" style="opacity: 1; stroke: currentColor; stroke-opacity: 1; fill: rgb(0, 0, 0); fill-opacity: 0; stroke-dasharray: 9px, 9px; stroke-width: 2px;"/></g><g class="shape-group" data-index="5" clip-path="url(#clipcc3a66xy)"><path data-index="5" fill-rule="evenodd" d="M651.17,337.33000000000004A285.89,285.89 0 1,1 365.28,51.440000000000055A285.89,285.89 0 0,1 651.17,337.33000000000004Z" style="opacity: 1; stroke: currentColor; stroke-opacity: 1; fill: rgb(0, 0, 0); fill-opacity: 0; stroke-dasharray: 9px, 9px; stroke-width: 2px;"/></g></g></g><g class="infolayer"><g class="g-gtitle"/></g></svg>
        </div>
    </div>
</div>
<div class="caption">
    A visualisation of Delanuay triangles with circumcircles.
    <a href="https://github.com/neuroconvergent/py-art/blob/main/backup/delanuay_vis/delanuay_vis.py">
    [Code]</a>
</div>

The first version of the script is pretty simple and straightforward. A set of
random points are generated, triangulated and plotted with `plotly`.
Unfortunately, `plotly` doesn't provide shape primitives for polygons other than
rectangles, so the triangles are drawn using scatter traces as suggested in
[`plotly` docs](https://plotly.com/python/shapes/). The triangles are coloured
with the hex representation of the 4 colours on my wall, taken from the website
of the paint manufacturer.

<details markdown="1" class="custom-details">
<summary class="custom-summary"><b>Simple Delaunay Triangulation
Implementation</b></summary>

```python
import numpy as np
from scipy.spatial import Delaunay
import plotly.graph_objects as go


def main():

    # 1. Random points
    pts = np.random.rand(200, 2)

    # 2. Delaunay triangulation
    tri = Delaunay(pts)

    # 4 colours to choose from
    palette = ["#fece8b", "#b49370", "#95CC84", "#f7b4c3"]

    fig = go.Figure()

    # For each triangle
    for simplex in tri.simplices:
        vertices = pts[simplex]
        x = vertices[:, 0]
        y = vertices[:, 1]

        # close the polygon
        x = np.append(x, x[0])
        y = np.append(y, y[0])

        fig.add_trace(
            go.Scatter(
                x=x,
                y=y,
                fill="toself",
                mode="lines",
                line=dict(color="white", width=6),
                fillcolor=np.random.choice(palette),
            )
        )

    fig.update_layout(
        showlegend=False,
        xaxis=dict(visible=False),
        yaxis=dict(visible=False),
        margin=dict(l=0, r=0, t=0, b=0),
        plot_bgcolor="white",
        paper_bgcolor="white",
    )
    _ = fig.update_xaxes(range=[0, 1])
    _ = fig.update_yaxes(range=[0, 1])

    fig.write_image("triangulation.svg")
    fig.write_image("triangulation.png")


if __name__ == "__main__":
    main()
```

</details>

This creates a simple Delaunay triangulation over the 2D space and colours them
randomly. However, as seen in the following image, the points are generated
completely randomly so there is no guarantee that the edges will be completely
covered.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid
        path="assets/img/glass-design/triangulation.png" title="Implementation
        with simple Delaunay triangulation" width=600 class="img-fluid rounded
        z-depth-1 d-block
        mx-auto" %}
    </div>
</div>
<div class="caption">
    Implementation with simple Delaunay triangulation.
</div>

The solution for fixing the edges is quite simple, the triangulation just needs
to be done for a larger region than the domain of the image. This will generate
very natural looking edges as `plotly` does not clip the triangles and generates
a clean edge.

```python
# For example, change the image domain to:
_ = fig.update_xaxes(range=[0.33, 0.66])
_ = fig.update_yaxes(range=[0.33, 0.66])
```

---

### Colour Clumping

A not so simple issue to solve is colour clumping which might occur through
random colour distribution. Neighbouring triangles can be allocated the same
colour which can lead to _clumps_ of the same colour forming.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid
        path="assets/img/glass-design/triangulation_crop.png" title="Colour
        clumping" width=400 class="img-fluid rounded z-depth-1 d-block mx-auto"
        %}
    </div>
</div>
<div class="caption">
    Colour clumping due to random colour distribution. 
</div>

To avoid this, an adjacency list needs to be created. This is a two
dimensional vector where each row corresponds to a list of triangles that
neighbour it, i.e. share an edge with it. The most efficient way to create this
is to create a map of edges and triangles. We simply loop through all triangles
and check all edges; if the edge already exists in the map, both triangles are
marked as neighbours, else the edge is just added to the map for future
comparisons. Once the adjacency matrix is created, we can just ensure that a
triangle is never allotted the same colour as its adjacent triangles.

<details markdown="1" class="custom-details">
<summary><b>Anti-Clumping Implementation</b></summary>
<br>

```py
palette = ["#fece8b", "#b49370", "#95CC84", "#f7b4c3"]
triangle_colours = [None] * len(tri.simplices)
adj = [[] for _ in tri.simplices]
edges = {}

for i, s in enumerate(tri.simplices):
    for a, b in [(s[0], s[1]), (s[1], s[2]), (s[2], s[0])]:
        key = tuple(sorted((a, b)))
        if key in edges:
            j = edges[key]
            adj[i].append(j)
            adj[j].append(i)
        else:
            edges[key] = i

# Assign colours with anti-clumping

for i in range(len(tri.simplices)):
    neighbors = adj[i]
    disallowed = {
        triangle_colours[n] for n in neighbors if triangle_colours[n] is not None
    }

    # Retry random colours until one fits
    for _ in range(10):
        c = np.random.choice(palette)
        if c not in disallowed:
            triangle_colours[i] = c
            break
    else:
        # fallback
        triangle_colours[i] = np.random.choice(palette)
```

As a good practice, this algorithm has a fallback but with a 4 colour palette,
this should never happen as a triangle can only have 3 neighbours.

</details>

---

### Poisson-Disc Sampling

Another significant issue with the initial script is that the distribution of
the points is uneven, which creates triangles of very different sizes which is
not visually pleasing.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid
        path="assets/img/glass-design/triangulation_poisson.png" title="Uneven
        point sampling" width=400 class="img-fluid rounded z-depth-1 d-block
        mx-auto" %}
    </div>
</div>
<div class="caption">
    Uneven point sampling due to random distribution. 
</div>

The solution for this is to use _Poisson-Disc sampling_, which is a method to
sample points in space with a defined minimum separation instead of purely
random sampling. Poisson-Disc is a very well studied method and the [Bridson's
algorithm](http://www.cs.ubc.ca/~rbridson/docs/bridson-siggraph07-poissondisk.pdf)
can generate them in $O(n)$ time. Unfortunately, the known `python`
implementation of this algorithm
[`poisson-disc`](https://pypi.org/project/poisson-disc/) is severely outdated and
doesn't work with recent versions of `numpy`. Hence, I ended up creating a very
[simple implementation of the algorithm
myself](https://github.com/neuroconvergent/py-art/blob/5c23018444db525c7bc1921506d4194ddbfa1e8b/main.py#L20).

<details markdown="1" class="custom-details">
<summary><b>Poisson-Disc Sampling Implementation</b></summary>
<br>

```python
def poisson_disc_samples(width, height, r, k=30):
    """
    Bridson's Poisson-disc sampling algorithm.

    width, height : sampling area
    r             : minimum distance between samples
    k             : number of candidate attempts per active point
    """
    cell_size = r / np.sqrt(2)
    grid_width = int(np.ceil(width / cell_size))
    grid_height = int(np.ceil(height / cell_size))

    # Grid to store sample indices (-1 means empty)
    grid = -np.ones((grid_height, grid_width), dtype=int)

    samples = []
    active = []

    # Start with a random point
    p = np.array([np.random.uniform(0, width), np.random.uniform(0, height)])
    samples.append(p)
    active.append(0)

    gx = int(p[0] // cell_size)
    gy = int(p[1] // cell_size)
    grid[gy, gx] = 0

    while active:
        idx = np.random.choice(active)
        base = samples[idx]
        found = False

        # Try k random points around `base`
        for _ in range(k):
            theta = np.random.uniform(0, 2 * np.pi)
            rad = np.random.uniform(r, 2 * r)
            candidate = base + rad * np.array([np.cos(theta), np.sin(theta)])

            # Discard if outside the domain
            if not (0 <= candidate[0] < width and 0 <= candidate[1] < height):
                continue

            # Check neighbouring cells for conflicts
            cgx = int(candidate[0] // cell_size)
            cgy = int(candidate[1] // cell_size)

            ok = True
            for yy in range(max(0, cgy - 2), min(grid_height, cgy + 3)):
                for xx in range(max(0, cgx - 2), min(grid_width, cgx + 3)):
                    si = grid[yy, xx]
                    if si != -1:
                        if np.linalg.norm(samples[si] - candidate) < r:
                            ok = False
                            break
                if not ok:
                    break

            if ok:
                samples.append(candidate)
                active.append(len(samples) - 1)
                grid[cgy, cgx] = len(samples) - 1
                found = True
                break

        if not found:
            active.remove(idx)

    return np.array(samples)
```

</details>

---

## The Results

After putting everything together and refactoring the code to make it more
modular, I was able to generate a set of images and picked the ones that I
liked. The full code is available on [GitHub](https://github.com/neuroconvergent/py-art/).

<swiper-container class="glass-swiper" keyboard="true" navigation="true" pagination="true" pagination-clickable="true" pagination-type="fraction" rewind="true">
  <swiper-slide>
  {% include figure.liquid loading="eager"
  path="assets/img/glass-design/triangular_pattern_3.png"
  title="triangular_pattern_3" width=200 class="img-fluid rounded z-depth-1
  d-block mx-auto" %}
  </swiper-slide>
  <swiper-slide>
  {% include figure.liquid loading="eager"
  path="assets/img/glass-design/triangular_pattern_5.png"
  title="triangular_pattern_5" width=200 class="img-fluid rounded z-depth-1
  d-block mx-auto" %}
  </swiper-slide>
  <swiper-slide>
  {% include figure.liquid loading="eager"
  path="assets/img/glass-design/triangular_pattern_7.png"
  title="triangular_pattern_7" width=200 class="img-fluid rounded z-depth-1
  d-block mx-auto" %}
  </swiper-slide>
</swiper-container>
<div class="caption">
    Generated triangular patterns using the final script. 
</div>

This project reminded me that the numerical tools we use in engineering and
simulation are often directly applicable to creative expression. The boundary
between computational geometry and digital art is far thinner than we imagine.

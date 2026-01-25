#let date = datetime.today()
#let month-names = (
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
)
#let highlight-color = rgb(0, 51, 102)
#let link-color = blue

#set page(
  "a4",
  margin: 2cm,
  numbering: "1/1",
  number-align: center,
  header: context [
    #set text(8pt)
    #smallcaps[Sundar Gurumurthy]
    #h(1fr)
    #date.day() #month-names.at(date.month() - 1), #date.year()
  ],
  footer: context [
    #set text(8pt)
    #link("https://www.sundar.guru")[https://www.sundar.guru]
    #h(1fr)
    Page #counter(page).display("1 of 1", both: true)
  ],
)

#set text(font: "Roboto", size: 10pt)

#show heading.where(level: 1): it => [
  #set text(highlight-color, 18pt, weight: "bold")
  #block(it.body)
]

#show heading.where(level: 2): it => [
  #set text(highlight-color, 12pt, weight: "semibold")
  #block(it.body)
]

#show link: it => [
  #set text(link-color, hyphenate: true)
  #underline(it)
]

#let icon(path, replace: "#000000", size: 10pt, color: link-color) = {
  let svg = read(path).replace(replace, color.to-hex())
  box(image(bytes(svg), format: "svg", height: size), baseline: 0.1em)
}

#let mail-image = icon("assets/mail-svgrepo-com.svg")
#let phone-image = icon("assets/phone-svgrepo-com.svg", replace: "#1C274C")
#let web-image = icon("assets/internet-svgrepo-com.svg")
#let linkedin-image = icon("assets/icons8-linkedin.svg", replace: "#0288D1")
#let github-image = icon("assets/github-mark.svg", replace: "#24292f")

#align(center)[
  #text(24pt, weight: "bold", fill: highlight-color)[Sundar Gurumurthy] \
  #link("mailto:sundar@sundar.guru")[#mail-image sundar\@sundur.guru] •
  #link("tel:+447442278370")[#phone-image (+44) 7442278370] •
  #link("https://sundar.guru/")[#web-image Personal Website] • \
  #link("https://linkedin.com/in/sundar-guru")[#linkedin-image LinkedIn] •
  #link("https://github.com/neuroconvergent")[#github-image GitHub]
]

= Professional Summary
Simulation engineer specialising in *first-principles, physics-based modelling* and *scientific software development* for complex manufacturing and mechanical systems. Experienced in deriving and implementing *thermal, mechanical, and phase-transformation models governed by PDEs*, and translating them into *robust, reduced-order simulation tools* for engineering decision-making. Strong background in *Python/C++ development, numerical methods, multi-objective optimisation,* and *statistical analysis*, with hands-on experience bridging *theory, experiments, and production-grade software*.

= Core Competencies
#grid(
  columns: 2,
  gutter: 0.9cm,
  [
    *Simulation & Modelling*
    - Physics-based modelling (thermal, mechanical, non-linear, contact)
    - PDE-based modelling; sparse numerical solvers (SuiteSparse); Monte Carlo methods
    - Governing equations and first-principles model formulation
    - Reduced-order and surrogate modelling
  ],
  [
    *Programming & Data Science*
    - Numerical optimisation, inverse problems, regression, uncertainty analysis
    - Structured scientific data pipelines
    - Automating decision-making through physics- and data-driven models.
  ],
)
= Technical Skills
#grid(
  columns: 2,
  gutter: 0.9cm,
  [
    *Languages and Frameworks*
    - *Languages*: Python, C++, Bash/Linux, Rust, Fortran
    - *Data Science/ML*: Scikit-learn, PyTorch3D, Pandas, Polars
    - *Visualisation*: Plotly, Matplotlib, Seaborn, PyVista, VisPy, GNUplot
  ],
  [
    *Other Tools*
    - *DevOps*: GitLab CI/CD, GitHub Actions, Docker, Apptainer, PBS (HPC
      Scheduler)
    - *Databases*: MariaDB, HDF5
    - *Version Control*: Git, UV, Poetry, cargo (Rust)
    - *CAD/PLM*: Siemens NX, CATIA V5, Teamcenter
    - *FEA Solvers*: Abaqus, LS-Dyna, Ansys, Nastran
  ],
)

= Projects & Applied Modelling
== Geometry–Linked Manufacturing Acceptance Criteria for Stress Performance
*Cranfield University* #h(1fr) 2025 – Present
- Developed *geometry-based acceptance limits* linking surface profile metrics to tensile response and distortion behaviour.
- Integrated *physics-based simulation, laser scanning,* and *mechanical testing* into lightweight validation workflows.
- Replaced repeated high-fidelity simulations with a *fast, model-informed decision framework*.

== Python Library for WAAM & Scan-Based Qualification
*Cranfield University* #h(1fr) 2025 – Present
- Designed a modular Python package for *laser-scan processing, geometric feature extraction,* and *statistical evaluation*.
- Implemented *MVEE-based process window estimation* and deviation mapping for qualification workflows.
- Automated end-to-end pipelines from *scan acquisition → analysis → reporting*.
- Delivered *interactive 2D/3D dashboards* used by industrial partners for process qualification decisions.

\
== Process-Driven WAAM Simulation & Optimisation
*Cranfield University* #h(1fr) 2024 – Present
- Built *thermal–mechanical simulation models* to study process sensitivities and parameter interactions.
- Designed *DOE-based studies* to quantify process–response relationships.
- Provided modelling insight for aerospace and energy components under development.

= Work Experience
== Research Assistant
*Cranfield University, UK* #h(1fr) Jun 2024 – Present
- Developed *Python/C++ simulation automation pipelines* for thermal–mechanical analysis and sensitivity studies.
- Formulated *phase-transformation strain models* using test-driven fitting and thermal expansion datasets.
- Integrated *laser-scan geometry* into simulation workflows for deviation-driven modelling.
- Implemented *rapid reduced-order approaches* delivering engineering results in minutes.
- Developed *FORTRAN heat-source models* and *C++ Abaqus subroutines* for non-standard physics.
- Communicated results via *technical reports, validation studies,* and multidisciplinary reviews.

== Graduate Engineering Trainee
*Sona Comstar, India* #h(1fr) Jul 2021 – Jul 2022
- Developed *custom simulation software* for mechanical contact analysis of complex gear geometries.
- Implemented *continuum-mechanics–based contact and deformation models*, solving governing equations for elastic material response under load.
- Modelled *load-dependent surface contact, stress distribution, and transmission behaviour* using discretised contact formulations.
- Integrated analysis workflows with *Siemens NX* for parametric geometry generation and *Teamcenter* for versioned data management.

== Student Trainee – Crash Structures
*Mercedes-Benz R&D India* #h(1fr) Feb 2021 – Jun 2021
- Built *LS-Dyna models* for tyre, rim, and composite crash scenarios.
- Optimised *Lagrangian contact formulations* for fibre-reinforced rubber composites.
- Automated *ANSA meshing workflows* using Python.
- Supported *test–simulation correlation* for impact and modal behaviour.

= Education
== MSc by Research, Manufacturing
*Cranfield University* #h(1fr) Jan 2023 – Oct 2024 \
*Thesis: Improving the Inherent Strain Method for WAAM Simulation*
- Reduced distortion prediction error *14% → 3%* through algorithmic model improvements.
- Developed *fast inherent-strain workflows* reducing simulation runtime from days to minutes.

== B.E. Mechanical Engineering
*BITS Pilani* #h(1fr) Aug 2017 – Jun 2021
- CGPA: 7.71/10 (First Class)

= Awards
- AIAA/USU SmallSat Travel Award (Blue Origin Sponsored)

= References
Available on request.

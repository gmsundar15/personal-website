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
Simulation engineer specialising in *Python/C++ development,
  FEA, physics-based modelling, data-driven simulation,* and *statistical
  analysis* for complex manufacturing and structural processes.
Experience includes *process modelling, multi-objective
  optimisation, DOE, MVEE analysis,* and integration of *laser-scan
  data* with simulation workflows. Proficient in *scikit-learn,
  PyTorch3D, pandas, polars,* and custom simulation tooling.
Practical hands-on experience in *WAAM
  robots, CNC-based scanning operations,* and experimental design.
Motivated to apply scientific computing and analytical modelling
to *autonomous manufacturing, process optimisation,* and
*physics-based digital workflows*.

= Technical Skills
#grid(
  columns: 2,
  gutter: 0.9cm,

  [
    *Simulation & Modelling*
    - Physics-based modelling (thermal-mechanical, nonlinear, contact)
    - Parameterisable first-principles modelling
    - Data-driven surrogate models
    - FEA: Abaqus, LS-Dyna, ANSA (automation)
    - Multi-objective optimisation (parameter sweeps, process windows)

    *Programming & Data Science*
    - Python (automation, modelling, ML/statistics)
    - C++, Bash/Linux, Rust
    - Scikit-learn, PyTorch3D, Pandas, Polars
    - DOE, MVEE, regression, correlation, uncertainty analysis
    - Data pipelines, structured scientific datasets
  ],

  [
    *Manufacturing & Automation*
    - WAAM: process modelling, bead geometry analysis, distortion prediction
    - 6-axis robot programming, CNC laser scanning automation
    - DfM/DfAM for forging, machining (soft → hard), broaching, grinding, polishing, casting reviews

    *Tools & Infrastructure*
    - Plotly, Matplotlib, Seaborn, PyVista, VisPy, GNUplot for scientific visualisation
    - Siemens NX, CATIA V5, Teamcenter
    - GitLab CI/CD, PBS scheduler
    - HDF5, basic MariaDB/SQL , structured data formats
  ],
)

= Projects & Applied Modelling
== Geometry–Linked Manufacturing Acceptance Criteria for Stress Performance \
*Cranfield University* #h(1fr) 2025 – Present
- Developed *geometry-based acceptance limits* linking surface profile metrics to tensile and distortion behaviour.
- Integrated *simulation, laser scanning,* and *tensile testing* into lightweight validation workflows.
- Reduced dependency on full physics simulations by building a *fast, data-driven criteria framework*.

== Python Library for WAAM & Scan-Based Qualification \
*Cranfield University* #h(1fr) 2025 – Present
- Built tools for *laser-scan processing, MVEE analysis, deviation
    mapping,* and geometric feature extraction using ML and
  conventional methods.
- Automated entire process from *scan acquisition → data
    processing → statistical analysis → reporting*.
- Implemented *interactive 2D/3D dashboards* (Plotly) for manufacturing engineering reviews.
- Used by project partners for *process qualification, defect assessment,* and *data-driven manufacturability decisions*.

\
== Process-Driven WAAM Simulation & Optimisation \
*Cranfield University* #h(1fr) 2024 – Present
- Applied *thermal/mechanical modelling* to identify optimal deposition parameters.
- Designed *DOE-based sensitivity studies* to analyse process–response behaviour.
- Provided modelling guidance for aerospace and energy components.

= Work Experience
== Research Assistant \
*Cranfield University, UK* #h(1fr) Jun 2024 – Present
- Built *Python/C++ simulation automation pipelines* for thermal-mechanical modelling and process-window analysis.
- Developed *phase-transformation strain models* using test-driven statistical fitting and thermal-expansion datasets.
- Integrated *laser-scan data* with simulation workflows for geometric conformity assessment and deviation-driven modelling.
- Implemented *rapid reduced-order approaches* producing industry-usable simulation results in minutes.
- Developed *FORTRAN heat-source models* and *C++ Abaqus subroutines* for nonstandard material/process cases.
- Delivered *technical reports, experimental analyses,* and multi-stakeholder design reviews.

== Graduate Engineering Trainee \
*Sona Comstar, India* #h(1fr) Jul 2021 – Jul 2022
- Performed *fatigue, structural and tolerance assessments* for drivetrain and differential systems.
- Conducted *forging DfM,* and manufacturing reviews for *machining (soft → hard machining), broaching, grinding, polishing,* and *casting*.
- Defined *operational load cases* from torque maps and test data.
- Automated *CAD→FEA pipelines* using Python/VBA, improving turnaround.
- Delivered *stress reports, DFMEA documentation* and supplier handover packages.

== Student Trainee – Crash Structures \
*Mercedes-Benz R&D India* #h(1fr) Feb 2021 – Jun 2021
- Built *LS-Dyna models* for tyre, rim and composite crash scenarios.
- Worked on *Lagrangian contact optimisation* for fibre-reinforced rubber composites.
- Automated *ANSA meshing* using Python scripts.
- Supported *test–simulation correlation* for modal/impact behaviour.

= Education
== MSc by Research, Manufacturing \
*Cranfield University* #h(1fr) Jan 2023 – Oct 2024 \
*Thesis: Improving the Inherent Strain Method for WAAM Simulation*
- Reduced distortion error *14% → 3%* via algorithmic optimisation.
- Developed *fast inherent-strain simulation* reducing runtime from days to minutes.

== B.E. Mechanical Engineering \
*BITS Pilani* #h(1fr) Aug 2017 – Jun 2021
- CGPA: 7.71/10 (First Class)

= Awards
- AIAA/USU SmallSat Travel Award (Blue Origin Sponsored)


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
  #set text(link-color)
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
#let github-image = icon("assets/github-mark.svg",replace: "#24292f")


#align(center)[
  #text(24pt, weight: "bold", fill: highlight-color)[Sundar Gurumurthy] \
  #link("mailto:sundar@sundar.guru")[#mail-image sundar\@sundar.guru] • 
  #link("tel:+447442278370")[#phone-image (+44) 7442278370] •
  #link("https://sundar.guru")[#web-image Personal Website] •
  #link("https://linkedin.com/in/sundar-guru")[#linkedin-image LinkedIn] •
  #link("https://github.com/divergentrain")[#github-image GitHub]
]

= Professional Summary
Mechanical Engineer and Computational Scientist with 2.5+ years of
experience in *CAE, structural mechanics, and engineering software
  development*. Skilled in *FEA (static/dynamic, fatigue, thermal,
  modal), first principles engineering, and computational
  automation*. Experienced with *Python, C++, MATLAB, FORTRAN*, and
proficient in *CI/CD pipelines, deal.II, and GUI development
  (Qt6/Tkinter)*. Proven ability to *translate requirements into
  load cases, build validated models, and deliver compliance
  evidence*. Eligible to work in the UK on a *Graduate Visa until
  October 2026* (after which I qualify for *new entrant points*
under Skilled Worker).

= Work Experience
== Research Assistant
_*Cranfield University, UK*_ #h(1fr) _Jun 2024 – Present_
- Developed *thermo-mechanical FEA workflows* for additive manufactured aero-engine components (WAAM casings).
- Created new algorithms for *heat source modelling* in FORTRAN.
- Designed and maintained *Python/C++ toolchains* for laser-scan analysis and FEA automation, used for *simulation validation and compliance*.
- Conducted *static, dynamic, fatigue, and thermal analyses* in ABAQUS and deal.II; correlated models with *3D scanning, XRD, SEM, and thermal imaging*.
- Built *C++ user subroutines* and *Python CI/CD workflows* for solver automation and result traceability.

== Graduate Engineering Trainee
_*Sona Comstar, India*_ #h(1fr) _Jul 2021 – Jul 2022_
- Designed *drivetrain and e-axle components* using Siemens NX, performing fatigue, tolerance, and lifecycle analyses.
- Created *Python and VBA automation scripts* for CAD/FEA integration (NX and Simcentre Nastran).
- Delivered *S–N curves, LTCA, and gear analysis*, applying *first principles and simulation correlation*.

== Student Trainee – Crash Structures
_*Mercedes-Benz R&D India*_ #h(1fr) _Feb 2021 – Jun 2021_
- Built *LS-Dyna crash and composite models* of fibre-reinforced tyre–rim assemblies.
- Automated *meshing and preprocessing* via Python–ANSA macros.
- Gained experience in *modal/dynamic behaviour* and *simulation validation with experimental data*.

= Education
== MSc by Research in Manufacturing
_*Cranfield University, UK*_ #h(1fr) _Jan 2023 – Oct 2024_

Thesis: _Improving the Inherent Strain Method for WAAM Simulation_
- Reduced distortion prediction error from 14% → 3% via algorithmic optimisation.
- Applied *thermo-mechanical modelling, fatigue life estimation, and experimental calibration* for aerospace structures.

== B.E. Mechanical Engineering
_*BITS Pilani, India*_ #h(1fr) _Aug 2017 – Jun 2021_
- CGPA: 7.71 / 10 (First class)

= Technical Skills
- *Simulation & CAE:* ABAQUS, LS-Dyna, MSC Nastran/Patran, ANSA, ANSYS; static/dynamic FEA, fatigue, modal, NVH, thermal-mechanical coupling, composites
- *Programming & Automation:* Python (NumPy, SciPy, pandas, CI/CD automation), C++ (deal.II, Abaqus subroutines), FORTRAN, Rust, Bash, Git
- *CI/CD & Workflows:* GitLab CI/CD, GitHub Actions, HPC job schedulers (SLURM), unit/versioning (UV) for Python projects
- *GUI Development:* Qt6, Tkinter for engineering applications
- *CAD & Design:* Siemens NX, CATIA V5, Fusion 360; GD&T and tolerance analysis
- *Manufacturing:* Welding & WAAM (PTA, MIG, CWGMA, Laser), Forging,
  Machining
- *Validation Tools:* 3D Scanning, XRD, EBSD, Thermal Imaging

= Additional Skills
- Strong *documentation and reporting* for compliance and design reviews
- Mentoring and training students in *simulation and automation*
- Adaptable to *multi-sector engineering* (aerospace, automotive, energy, manufacturing)

= Awards
- *AIAA/USU SmallSat Travel Award* – Sponsored by Blue Origin

= Selected Projects

== Rapid Simulation of WAAM of Al-Mg-Sc Alloys for launch vehicles
_*Cranfield University, UK*_ #h(1fr) _Sep 2025 – Present_
- Developing rapid prediction FEA models for aluminium alloy WAAM to predict cracking and defects in weld beads.

== Python library for tolerance and process variation analysis of laser scanned components
_*Cranfield University, UK*_ #h(1fr) _Jul 2025 – Present_
- Developing a comprehensive Python library for quality control
  and process window analysis with laser scan point clouds.

== Thermal and microstructural analysis of WAAM for aero-engine components
_*Cranfield University, UK*_ #h(1fr) _Oct 2024 – Present_
- Predicting thermal profiles and microstructure evolution in WAAM
  components using FEA.

= Publications
Full list: #link("https://sundar.guru/publications")[https://sundar.guru/publications]
//#bibliography("papers.bib", title:none, full:true)

= References
// Available on request.
- *Dr. Pradeptta Taraphdar*, Manufacturing Research Engineer, Jaguar Land Rover \
  #link("mailto:pkumarta@jaguarlandrover.com")[pkumarta\@jaguarlandrover.com] – Okay to contact immediately
- *Dr. Yongle Sun*, Lecturer, Cranfield University \
  #link("mailto:yongle.sun@cranfield.ac.uk")[yongle.sun\@cranfield.ac.uk] – Do not contact without asking

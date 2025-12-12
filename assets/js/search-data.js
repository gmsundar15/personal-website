// get the ninja-keys element
const ninja = document.querySelector('ninja-keys');

// add the home and posts menu items
ninja.data = [{
    id: "nav-about",
    title: "about",
    section: "Navigation",
    handler: () => {
      window.location.href = "/";
    },
  },{id: "nav-blog",
          title: "blog",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/blog/";
          },
        },{id: "nav-publications",
          title: "publications",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/publications/";
          },
        },{id: "nav-projects",
          title: "projects",
          description: "A curated collection of projects I worked on in my free time, focused on learning and experimentation.",
          section: "Navigation",
          handler: () => {
            window.location.href = "/projects/";
          },
        },{id: "nav-cv",
          title: "cv",
          description: "I suggest viewing my detailed CV on this webpage. A summarised 2-page PDF is available for download at the top.",
          section: "Navigation",
          handler: () => {
            window.location.href = "/cv/";
          },
        },{id: "post-creating-generative-geometric-art-in-python",
        
          title: "Creating Generative Geometric Art in Python",
        
        description: "Using scientific computing primitives to generate custom geometric art for my home.",
        section: "Posts",
        handler: () => {
          
            window.location.href = "/blog/2025/Creative-programming/";
          
        },
      },{id: "post-london-through-my-lens-2025",
        
          title: "London through my lens (2025)",
        
        description: "My photoadventures in London in 2025.",
        section: "Posts",
        handler: () => {
          
            window.location.href = "/blog/2025/London-through-my-lens/";
          
        },
      },{id: "post-why-rust-isn-t-ready-for-engineering-software-yet",
        
          title: "Why Rust Isn’t Ready for Engineering Software (Yet)",
        
        description: "Why Rust isn’t yet ready for CAE software development, from library gaps to HPC and GPU limitations.",
        section: "Posts",
        handler: () => {
          
            window.location.href = "/blog/2025/Rust-sucks-for-cae/";
          
        },
      },{id: "post-what-i-do-amp-why",
        
          title: "What I do &amp; why",
        
        description: "A longer introduction about me for those who have the time.",
        section: "Posts",
        handler: () => {
          
            window.location.href = "/blog/2025/What-and-why/";
          
        },
      },{id: "news-after-successful-submission-of-my-msc-thesis-for-review-i-have-started-working-as-a-research-assistant-at-cranfield-university",
          title: 'After successful submission of my MSc thesis for review, I have started working...',
          description: "",
          section: "News",},{id: "projects-kinetic-monte-carlo-integration-into-fea",
          title: 'Kinetic Monte Carlo integration into FEA',
          description: "A proof on concept for kMCFEA of Additive Manufacturing",
          section: "Projects",handler: () => {
              window.location.href = "/projects/1_kMC_FEA/";
            },},{
        id: 'social-cv',
        title: 'CV',
        section: 'Socials',
        handler: () => {
          window.open("/assets/pdf/example_pdf.pdf", "_blank");
        },
      },{
        id: 'social-email',
        title: 'email',
        section: 'Socials',
        handler: () => {
          window.open("mailto:%73%75%6E%64%61%72@%73%75%6E%64%61%72.%67%75%72%75", "_blank");
        },
      },{
        id: 'social-github',
        title: 'GitHub',
        section: 'Socials',
        handler: () => {
          window.open("https://github.com/neuroconvergent", "_blank");
        },
      },{
        id: 'social-linkedin',
        title: 'LinkedIn',
        section: 'Socials',
        handler: () => {
          window.open("https://www.linkedin.com/in/sundar-guru", "_blank");
        },
      },{
        id: 'social-orcid',
        title: 'ORCID',
        section: 'Socials',
        handler: () => {
          window.open("https://orcid.org/0000-0001-5388-8785", "_blank");
        },
      },{
        id: 'social-researchgate',
        title: 'ResearchGate',
        section: 'Socials',
        handler: () => {
          window.open("https://www.researchgate.net/profile/Sundar-Gurumurthy/", "_blank");
        },
      },{
        id: 'social-rss',
        title: 'RSS Feed',
        section: 'Socials',
        handler: () => {
          window.open("/feed.xml", "_blank");
        },
      },{
        id: 'social-scholar',
        title: 'Google Scholar',
        section: 'Socials',
        handler: () => {
          window.open("https://scholar.google.com/citations?user=a1rJKy4AAAAJ", "_blank");
        },
      },{
        id: 'social-scopus',
        title: 'Scopus',
        section: 'Socials',
        handler: () => {
          window.open("https://www.scopus.com/authid/detail.uri?authorId=57214797861", "_blank");
        },
      },{
      id: 'light-theme',
      title: 'Change theme to light',
      description: 'Change the theme of the site to Light',
      section: 'Theme',
      handler: () => {
        setThemeSetting("light");
      },
    },
    {
      id: 'dark-theme',
      title: 'Change theme to dark',
      description: 'Change the theme of the site to Dark',
      section: 'Theme',
      handler: () => {
        setThemeSetting("dark");
      },
    },
    {
      id: 'system-theme',
      title: 'Use system default theme',
      description: 'Change the theme of the site to System Default',
      section: 'Theme',
      handler: () => {
        setThemeSetting("system");
      },
    },];

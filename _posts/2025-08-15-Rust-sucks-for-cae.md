---
layout: post
title: Why Rust Isn’t Ready for Engineering Software (Yet)
giscus_comments: true
date: 2025-08-15 12:38:53 +0000
description: Why Rust isn’t yet ready for CAE software development, from library gaps to HPC and GPU limitations.
tags: CAE Scientific-Computing Rust C++ HPC
categories: Simulation-tools Programming
---

I wanted to develop a feature-rich, open-source CAE application in Rust. Easy memory safety _and_ performance a tier above garbage-collected languages?
Sign me up. Finally, a way to escape the data races and the tyranny of C++ compilers that think `"segmentation fault"` is an acceptable personality
trait.

I was ready to go all in — maybe even color my hair blue before writing my first lines in Rust. Rust seemed like my ticket to a modern, sane, productive
development experience. Sure, I expected a few bumps along the way, but hey, Rust is supposed to make large projects _easy_, right? No big deal.

Then I started looking for Rust packages and libraries to actually _build_ my software… and the cracks appeared fast. The options were mostly
half-finished `"work in progress"` crates or abandoned passion projects that haven’t seen a commit since the end of COVID-19 lock down.

Need a CAD kernel like [OpenCascade](https://www.opencascade.com/)? Nope. A meshing library like [Gmsh](https://gmsh.info/)? Try again. A robust GUI
toolkit like [Qt](https://www.qt.io/)? Not unless you’re ready to wrap it yourself and pray it compiles.

And then there’s integration with **C++** or **Fortran** code — the stuff where decades of CAE development already live. What’s the point of jumping
through hoops for Rust’s memory safety if you have to bind it to massive, battle-scarred codebases that _don’t_ provide that safety?

It didn’t take long to realize my “options” in Rust were:

1. Write every single library I need from scratch.
2. Use `unsafe` bindings to the C++/Fortran libraries — completely defeating the whole point of using Rust in the first place.

So instead of reinventing the wheel, I grabbed my trusty C++ toolkit and got back to writing actual code — because at least there, I can get work done
without pretending my build system is a research project.

Here’s why.

---

## 1. Interoperability With C++ and Fortran is a Minefield

Rust’s `FFI` works fine for plain C, but CAE libraries don’t live in a happy little C-shaped world. They live in C++ (templates, overloaded operators,
inheritance) or Fortran (fresh hell arrays, anyone?).

Wrapping these in Rust means:

- Writing hundreds of lines of `unsafe` glue code
- Losing half the API because the C++ parts are too complex to map
- Debugging segfaults that magically ignore Rust’s advertised memory safety

Examples:

- Wrapping [OpenCascade](https://www.opencascade.com/) for geometry modeling? Weeks of header wrangling.
- Calling [PETSc](https://petsc.org/) or [Trilinos](https://trilinos.github.io/) from Rust? Back to the C API — less functionality, worse performance.

At that point, why not just write in C++ or Fortran?

---

## 2. MPI and HPC Support: Still Stuck in Hobby Mode

Most CAE solvers run on clusters — **MPI** isn’t optional. Rust has [rsmpi](https://github.com/rsmpi/rsmpi), a thin wrapper over the C API, but:

- No idiomatic integration with Rust’s `async` model
- Spotty support for MPI-3 features like remote memory access and non-blocking collectives
- Minimal adoption on vendor-tuned compilers ([Intel MPI](https://www.intel.com/content/www/us/en/developer/tools/oneapi/mpi-library.html), [Cray
  MPI](https://docs.nersc.gov/development/parallel-programming/mpi/))

Technically possible, practically painful.

---

## 3. GPU Acceleration: Brace Yourself

Modern CAE codes rely heavily on GPUs. CUDA, OpenGL, DirectX, Vulkan — GPU integration in Rust is still “aspirational.”

- CUDA bindings ([rust-cuda](https://github.com/Rust-GPU/Rust-CUDA)) are incomplete or lag NVIDIA releases
- HIP and SYCL support? Almost nonexistent
- Vendor math libraries like [cuBLAS](https://developer.nvidia.com/cublas), [cuSPARSE](https://developer.nvidia.com/cusparse),
  [cuFFT](https://developer.nvidia.com/cufft) have no idiomatic Rust wrappers

You can write GPU kernels in Rust — if you want to reinvent half the CUDA driver API in `unsafe`. At that point, C++ is simpler.

---

## 4. Missing Mature Geometry, Meshing, and Visualization Libraries

CAE software is geometry and meshes. Rust’s ecosystem is sparse:

- No Rust-native equivalents to [OpenCascade](https://www.opencascade.com/), [Gmsh](https://gmsh.info/), or [CGAL](https://www.cgal.org/)
- No production-ready bindings for [VTK](https://vtk.org/) or [ParaView](https://www.paraview.org/)

Want cutting planes, mesh overlays, stress maps? Either code them yourself in [wgpu](https://wgpu.rs/) or wrap a C++ library — back in `unsafe` land.

---

## 5. Large-Scale Build & Tooling Woes

CAE projects combine Fortran solvers, C++ kernels, and potentially Rust. `Cargo` is great, but:

- Poor integration with [CMake](https://cmake.org/), [Bazel](https://bazel.build/), and other multi-language systems
- Debugging mixed Rust/C++ stacks is awkward with [gdb](https://www.sourceware.org/gdb/) or [lldb](https://lldb.llvm.org/)
- Profiling tools like [Intel VTune](https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler.html) or [Arm
  MAP](https://www.arm.com/products/development-tools/server-and-hpc/arm-forge/map) have weaker Rust support

When your workflow is “fight the build system” instead of “write features,” productivity suffers.

---

## 6. Long-Term Stability and Industry Risk

CAE software often lasts 10–20 years. Rust’s ecosystem moves fast:

- Crates can break between releases
- No guarantee today’s “best” bindings will exist in five years

Conservative CAE companies avoid constant rewrites. Stability matters more than novelty.

---

## 7. A Hopeful Future

Rust is growing. Rust still doesn't have the production ready plug and play engineering libraries but it has seen rapid development in tools for
building those libraries such as:

- Graphics: [wgpu](https://wgpu.rs/), [ash](https://github.com/ash-rs/ash), [vulkano](https://vulkano.rs/)
- Linear algebra: [nalgebra](https://nalgebra.org/), [ndarray](https://github.com/rust-ndarray/ndarray)
- Parallel computation: [rayon](https://github.com/rayon-rs/rayon), [crossbeam](https://github.com/crossbeam-rs/crossbeam)
- C API interop: [bindgen](https://rust-lang.github.io/rust-bindgen/), [cxx](https://cxx.rs/)

The community is actively building engineering capabilities — much like Python’s growth in scientific computing. Python succeeded for ease of use but
faltered in runtime performance, which is why C++ and Fortran still dominate CAE backends but Python has taken over a large chunk of the less intensive
frontends and data processing APIs. But Rust could challenge or even upend C++ and Fortran in the coming decades thanks to its combination of safety and
high performance.

There are still some promising Rust projects that I am watching out for:

- A developing CAD kernel: [Truck](https://github.com/ricosjp/truck?tab=readme-ov-file)
- A good but not great GUI toolkit: [gtk-rs](https://gtk-rs.org/)

Challenges remain in engineering-focused meshing libraries and Rust-native MPI support.

---

## Conclusion

Rust is exciting, safe, modern, and _fun_. But for CAE — where performance, interoperability, and mature ecosystems matter — it’s not ready.

Today, serious CAE projects thrive in C++/Fortran. Rust may eventually become a viable alternative, but for now, the tooling and ecosystem aren’t there
yet.

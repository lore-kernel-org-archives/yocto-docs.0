Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web08.12368.1604059374093323948
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 05:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FP8wwdQE;
 spf=pass (domain: linaro.org, ip: 209.85.219.182, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f182.google.com with SMTP id a12so4871346ybg.9
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2020 05:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=47JazGey04wqlis3TgDM0TTlYci4SrR5+neRToPwc4k=;
        b=FP8wwdQES+U00ITXrpLyK2foD4ADNlJ1LggHPEw2EpjWd0asFhY7ug9ZosHQF2m1bS
         4fGglonARY3j27Z4wTgvDUG4FScksCpcsqJOkvK6bt5VyzMphCaYcjncyBrSDGwHh/Ag
         hLUoNQEB/gIUPxGhCfpPUgswnIIR/BG3ehpeyxus/ePrBERg1a0ONhe1BjS6VRrIm6i7
         uLdqSYRyeh3iYU5+S/GheavlcVTb+hDRaLhWsvyaZKdNsvtE6DNrFVgCpaLtKWjgNEbc
         M71CCUlNU7Trl6epAt/GCEQzf7/26TAy/2QY6zaY0MymmWdToUx/kM97WVN7e1Cot+ts
         bbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=47JazGey04wqlis3TgDM0TTlYci4SrR5+neRToPwc4k=;
        b=d/YkN612zWfI83RP1gKnEMReRqgThdsINSTiX/DKVFwb0bhG7wQ393ju0ZGLXG0Mhv
         Rn2yQ8xoekpOE6uCrtGgjiWw3Grz0qlmCt8ieVj9XnKFgkQVkXh+WjtBa5ODMu1SMk+5
         HRwZCS8WWXSs0rgAsRuSTGk/E0Z1q4XMu6801+xNDM3Rul81pRdkLNQVnhBrx/OkaVHz
         Tnm+39S9JImN38LB8IBlYleJdUi7/CzxFI+iOiQzDFuhPQPM1HkiHwiXZ5kOe3eqWoyS
         vCQCpRpR3t5FB7KhkFPxImBzigKepCFlNGX5gk9kFYX0/pD/8sFsXQouOqH2nAmAU5pn
         9GPg==
X-Gm-Message-State: AOAM532ivhEJ8rc9Br0UNYFr7uj8bHy+t2gOIH0qvNQCrBOn183m2YEQ
	ZLSdVn2OgBIEHRawqt7QN3GJ1P+UQP4t0+vZKKqdFA==
X-Google-Smtp-Source: ABdhPJxm8gt8/YSkE5uTjWmUgj7PI7GwRTMhJL+sP/8+7+dMVPX3B8t2JVWGtWBD+s3PSwzzcRUCVKOeTy+DEswBXIM=
X-Received: by 2002:a25:80cd:: with SMTP id c13mr3273082ybm.371.1604059371452;
 Fri, 30 Oct 2020 05:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <532f9817-d5ba-b38a-aa64-7a7f6d2765ef@crashcourse.ca>
In-Reply-To: <532f9817-d5ba-b38a-aa64-7a7f6d2765ef@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 30 Oct 2020 13:02:39 +0100
Message-ID: <CAP71WjzfwKuxox9PbfO2ArhJhyhSo5q2KDkPgt4-y5YnkyEvzQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] adt-manual: delete obsolete ADT manual, and related content
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 10:35 AM Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
>
> Since the ADT manual has long been superseded by the SDK manual,
> remove the entire adt-manual directory, and the references to it in
> the two top-level files "conf.py" and "poky.yaml".
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

thanks for the patch. It looks good, however I am unable to apply it
locally (and Richard as well can't). Can you please check and resend?

>
> ---
>
> diff --git a/documentation/adt-manual/adt-command.rst b/documentation/ad=
t-manual/adt-command.rst
> deleted file mode 100644
> index d348adfcc..000000000
> --- a/documentation/adt-manual/adt-command.rst
> +++ /dev/null
> @@ -1,180 +0,0 @@
> -.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> -
> -**********************
> -Using the Command Line
> -**********************
> -
> -Recall that earlier the manual discussed how to use an existing
> -toolchain tarball that had been installed into the default installation
> -directory, ``/opt/poky/DISTRO``, which is outside of the :term:`Build D=
irectory`
> -(see the section
> -"`Using a Cross-Toolchain
> -Tarball) <#using-an-existing-toolchain-tarball>`__". And, that sourcing
> -your architecture-specific environment setup script initializes a
> -suitable cross-toolchain development environment.
> -
> -During this setup, locations for the compiler, QEMU scripts, QEMU
> -binary, a special version of ``pkgconfig`` and other useful utilities
> -are added to the ``PATH`` variable. Also, variables to assist
> -``pkgconfig`` and ``autotools`` are also defined so that, for example,
> -``configure.sh`` can find pre-generated test results for tests that nee=
d
> -target hardware on which to run. You can see the "`Setting Up the
> -Cross-Development
> -Environment <#setting-up-the-cross-development-environment>`__" section
> -for the list of cross-toolchain environment variables established by th=
e
> -script.
> -
> -Collectively, these conditions allow you to easily use the toolchain
> -outside of the OpenEmbedded build environment on both Autotools-based
> -projects and Makefile-based projects. This chapter provides information
> -for both these types of projects.
> -
> -Autotools-Based Projects
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> -
> -Once you have a suitable cross-toolchain installed, it is very easy to
> -develop a project outside of the OpenEmbedded build system. This sectio=
n
> -presents a simple "Helloworld" example that shows how to set up,
> -compile, and run the project.
> -
> -Creating and Running a Project Based on GNU Autotools
> ------------------------------------------------------
> -
> -Follow these steps to create a simple Autotools-based project:
> -
> -1.  *Create your directory:* Create a clean directory for your project
> -    and then make that directory your working location: $ mkdir
> -    $HOME/helloworld $ cd $HOME/helloworld
> -
> -2.  *Populate the directory:* Create ``hello.c``, ``Makefile.am``, and
> -    ``configure.in`` files as follows:
> -
> -    -  For ``hello.c``, include these lines: #include <stdio.h> main() =
{
> -       printf("Hello World!\n"); }
> -
> -    -  For ``Makefile.am``, include these lines: bin_PROGRAMS =3D hello
> -       hello_SOURCES =3D hello.c
> -
> -    -  For ``configure.in``, include these lines: AC_INIT(hello.c)
> -       AM_INIT_AUTOMAKE(hello,0.1) AC_PROG_CC AC_PROG_INSTALL
> -       AC_OUTPUT(Makefile)
> -
> -3.  *Source the cross-toolchain environment setup file:* Installation o=
f
> -    the cross-toolchain creates a cross-toolchain environment setup
> -    script in the directory that the ADT was installed. Before you can
> -    use the tools to develop your project, you must source this setup
> -    script. The script begins with the string "environment-setup" and
> -    contains the machine architecture, which is followed by the string
> -    "poky-linux". Here is an example that sources a script from the
> -    default ADT installation directory that uses the 32-bit Intel x86
> -    Architecture and the DISTRO_NAME Yocto Project release: $ source
> -    /opt/poky/DISTRO/environment-setup-i586-poky-linux
> -
> -4.  *Generate the local aclocal.m4 files and create the configure
> -    script:* The following GNU Autotools generate the local
> -    ``aclocal.m4`` files and create the configure script: $ aclocal $
> -    autoconf
> -
> -5.  *Generate files needed by GNU coding standards:* GNU coding
> -    standards require certain files in order for the project to be
> -    compliant. This command creates those files: $ touch NEWS README
> -    AUTHORS ChangeLog
> -
> -6.  *Generate the configure file:* This command generates the
> -    ``configure``: $ automake -a
> -
> -7.  *Cross-compile the project:* This command compiles the project usin=
g
> -    the cross-compiler. The
> -    :term:`CONFIGURE_FLAGS`
> -    environment variable provides the minimal arguments for GNU
> -    configure: $ ./configure ${CONFIGURE_FLAGS}
> -
> -8.  *Make and install the project:* These two commands generate and
> -    install the project into the destination directory: $ make $ make
> -    install DESTDIR=3D./tmp
> -
> -9.  *Verify the installation:* This command is a simple way to verify
> -    the installation of your project. Running the command prints the
> -    architecture on which the binary file can run. This architecture
> -    should be the same architecture that the installed cross-toolchain
> -    supports. $ file ./tmp/usr/local/bin/hello
> -
> -10. *Execute your project:* To execute the project in the shell, simply
> -    enter the name. You could also copy the binary to the actual target
> -    hardware and run the project there as well: $ ./hello As expected,
> -    the project displays the "Hello World!" message.
> -
> -Passing Host Options
> ---------------------
> -
> -For an Autotools-based project, you can use the cross-toolchain by just
> -passing the appropriate host option to ``configure.sh``. The host optio=
n
> -you use is derived from the name of the environment setup script found
> -in the directory in which you installed the cross-toolchain. For
> -example, the host option for an ARM-based target that uses the GNU EABI
> -is ``armv5te-poky-linux-gnueabi``. You will notice that the name of the
> -script is ``environment-setup-armv5te-poky-linux-gnueabi``. Thus, the
> -following command works to update your project and rebuild it using the
> -appropriate cross-toolchain tools: $ ./configure
> ---host=3Darmv5te-poky-linux-gnueabi \\ --with-libtool-sysroot=3Dsysroot=
_dir
> -
> -.. note::
> -
> -   If the
> -   configure
> -   script results in problems recognizing the
> -   --with-libtool-sysroot=3D
> -   sysroot-dir
> -   option, regenerate the script to enable the support by doing the
> -   following and then run the script again:
> -   ::
> -
> -           $ libtoolize --automake
> -           $ aclocal -I ${OECORE_NATIVE_SYSROOT}/usr/share/aclocal \
> -              [-I dir_containing_your_project-specific_m4_macros]
> -           $ autoconf
> -           $ autoheader
> -           $ automake -a
> -
> -
> -Makefile-Based Projects
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -For Makefile-based projects, the cross-toolchain environment variables
> -established by running the cross-toolchain environment setup script are
> -subject to general ``make`` rules.
> -
> -To illustrate this, consider the following four cross-toolchain
> -environment variables:
> -:term:`CC`\ =3Di586-poky-linux-gcc -m32
> --march=3Di586 --sysroot=3D/opt/poky/1.8/sysroots/i586-poky-linux
> -:term:`LD`\ =3Di586-poky-linux-ld
> ---sysroot=3D/opt/poky/1.8/sysroots/i586-poky-linux
> -:term:`CFLAGS`\ =3D-O2 -pipe -g
> --feliminate-unused-debug-types
> -:term:`CXXFLAGS`\ =3D-O2 -pipe -g
> --feliminate-unused-debug-types Now, consider the following three cases:
> -
> --  *Case 1 - No Variables Set in the ``Makefile``:* Because these
> -   variables are not specifically set in the ``Makefile``, the variable=
s
> -   retain their values based on the environment.
> -
> --  *Case 2 - Variables Set in the ``Makefile``:* Specifically setting
> -   variables in the ``Makefile`` during the build results in the
> -   environment settings of the variables being overwritten.
> -
> --  *Case 3 - Variables Set when the ``Makefile`` is Executed from the
> -   Command Line:* Executing the ``Makefile`` from the command line
> -   results in the variables being overwritten with command-line content
> -   regardless of what is being set in the ``Makefile``. In this case,
> -   environment variables are not considered unless you use the "-e" fla=
g
> -   during the build: $ make -e file If you use this flag, then the
> -   environment values of the variables override any variables
> -   specifically set in the ``Makefile``.
> -
> -.. note::
> -
> -   For the list of variables set up by the cross-toolchain environment
> -   setup script, see the "
> -   Setting Up the Cross-Development Environment
> -   " section.
> diff --git a/documentation/adt-manual/adt-intro.rst b/documentation/adt-=
manual/adt-intro.rst
> deleted file mode 100644
> index 92c157099..000000000
> --- a/documentation/adt-manual/adt-intro.rst
> +++ /dev/null
> @@ -1,138 +0,0 @@
> -.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> -
> -*****************************************
> -The Application Development Toolkit (ADT)
> -*****************************************
> -
> -Part of the Yocto Project development solution is an Application
> -Development Toolkit (ADT). The ADT provides you with a custom-built,
> -cross-development platform suited for developing a user-targeted produc=
t
> -application.
> -
> -Fundamentally, the ADT consists of the following:
> -
> --  An architecture-specific cross-toolchain and matching sysroot both
> -   built by the :term:`OpenEmbedded Build System`.
> -   The toolchain and
> -   sysroot are based on a `Metadata <&YOCTO_DOCS_DEV_URL;#metadata>`__
> -   configuration and extensions, which allows you to cross-develop on
> -   the host machine for the target hardware.
> -
> --  The Eclipse IDE Yocto Plug-in.
> -
> --  The Quick EMUlator (QEMU), which lets you simulate target hardware.
> -
> --  Various user-space tools that greatly enhance your application
> -   development experience.
> -
> -The Cross-Development Toolchain
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -The `Cross-Development
> -Toolchain <&YOCTO_DOCS_DEV_URL;#cross-development-toolchain>`__ consist=
s
> -of a cross-compiler, cross-linker, and cross-debugger that are used to
> -develop user-space applications for targeted hardware. This toolchain i=
s
> -created either by running the ADT Installer script, a toolchain
> -installer script, or through a :term:`Build Directory`
> -that is based on
> -your Metadata configuration or extension for your targeted device. The
> -cross-toolchain works with a matching target sysroot.
> -
> -Sysroot
> -=3D=3D=3D=3D=3D=3D=3D
> -
> -The matching target sysroot contains needed headers and libraries for
> -generating binaries that run on the target architecture. The sysroot is
> -based on the target root filesystem image that is built by the
> -OpenEmbedded build system and uses the same Metadata configuration used
> -to build the cross-toolchain.
> -
> -.. _eclipse-overview:
> -
> -Eclipse Yocto Plug-in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -The Eclipse IDE is a popular development environment and it fully
> -supports development using the Yocto Project. When you install and
> -configure the Eclipse Yocto Project Plug-in into the Eclipse IDE, you
> -maximize your Yocto Project experience. Installing and configuring the
> -Plug-in results in an environment that has extensions specifically
> -designed to let you more easily develop software. These extensions allo=
w
> -for cross-compilation, deployment, and execution of your output into a
> -QEMU emulation session. You can also perform cross-debugging and
> -profiling. The environment also supports a suite of tools that allows
> -you to perform remote profiling, tracing, collection of power data,
> -collection of latency data, and collection of performance data.
> -
> -For information about the application development workflow that uses th=
e
> -Eclipse IDE and for a detailed example of how to install and configure
> -the Eclipse Yocto Project Plug-in, see the "`Working Within
> -Eclipse <&YOCTO_DOCS_DEV_URL;#adt-eclipse>`__" section of the Yocto
> -Project Development Manual.
> -
> -The QEMU Emulator
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -The QEMU emulator allows you to simulate your hardware while running
> -your application or image. QEMU is made available a number of ways:
> -
> --  If you use the ADT Installer script to install ADT, you can specify
> -   whether or not to install QEMU.
> -
> --  If you have cloned the ``poky`` Git repository to create a
> -   :term:`Source Directory` and you have
> -   sourced the environment setup script, QEMU is installed and
> -   automatically available.
> -
> --  If you have downloaded a Yocto Project release and unpacked it to
> -   create a :term:`Source Directory`
> -   and you have sourced the environment setup script, QEMU is installed
> -   and automatically available.
> -
> --  If you have installed the cross-toolchain tarball and you have
> -   sourced the toolchain's setup environment script, QEMU is also
> -   installed and automatically available.
> -
> -User-Space Tools
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -User-space tools are included as part of the Yocto Project. You will
> -find these tools helpful during development. The tools include
> -LatencyTOP, PowerTOP, OProfile, Perf, SystemTap, and Lttng-ust. These
> -tools are common development tools for the Linux platform.
> -
> --  *LatencyTOP:* LatencyTOP focuses on latency that causes skips in
> -   audio, stutters in your desktop experience, or situations that
> -   overload your server even when you have plenty of CPU power left.
> -
> --  *PowerTOP:* Helps you determine what software is using the most
> -   power. You can find out more about PowerTOP at
> -   https://01.org/powertop/.
> -
> --  *OProfile:* A system-wide profiler for Linux systems that is capable
> -   of profiling all running code at low overhead. You can find out more
> -   about OProfile at http://oprofile.sourceforge.net/about/. For
> -   examples on how to setup and use this tool, see the
> -   "`OProfile <&YOCTO_DOCS_PROF_URL;#profile-manual-oprofile>`__"
> -   section in the Yocto Project Profiling and Tracing Manual.
> -
> --  *Perf:* Performance counters for Linux used to keep track of certain
> -   types of hardware and software events. For more information on these
> -   types of counters see https://perf.wiki.kernel.org/. For
> -   examples on how to setup and use this tool, see the
> -   "`perf <&YOCTO_DOCS_PROF_URL;#profile-manual-perf>`__" section in th=
e
> -   Yocto Project Profiling and Tracing Manual.
> -
> --  *SystemTap:* A free software infrastructure that simplifies
> -   information gathering about a running Linux system. This information
> -   helps you diagnose performance or functional problems. SystemTap is
> -   not available as a user-space tool through the Eclipse IDE Yocto
> -   Plug-in. See http://sourceware.org/systemtap for more
> -   information on SystemTap. For examples on how to setup and use this
> -   tool, see the
> -   "`SystemTap <&YOCTO_DOCS_PROF_URL;#profile-manual-systemtap>`__"
> -   section in the Yocto Project Profiling and Tracing Manual.
> -
> --  *Lttng-ust:* A User-space Tracer designed to provide detailed
> -   information on user-space activity. See http://lttng.org/ust
> -   for more information on Lttng-ust.
> diff --git a/documentation/adt-manual/adt-manual-intro.rst b/documentati=
on/adt-manual/adt-manual-intro.rst
> deleted file mode 100644
> index 2c840fdf0..000000000
> --- a/documentation/adt-manual/adt-manual-intro.rst
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> -
> -************
> -Introduction
> -************
> -
> -Welcome to the Yocto Project Application Developer's Guide. This manual
> -provides information that lets you begin developing applications using
> -the Yocto Project.
> -
> -The Yocto Project provides an application development environment based
> -on an Application Development Toolkit (ADT) and the availability of
> -stand-alone cross-development toolchains and other tools. This manual
> -describes the ADT and how you can configure and install it, how to
> -access and use the cross-development toolchains, how to customize the
> -development packages installation, how to use command-line development
> -for both Autotools-based and Makefile-based projects, and an
> -introduction to the Eclipse IDE Yocto Plug-in.
> -
> -.. note::
> -
> -   The ADT is distribution-neutral and does not require the Yocto
> -   Project reference distribution, which is called Poky. This manual,
> -   however, uses examples that use the Poky distribution.
> diff --git a/documentation/adt-manual/adt-manual.rst b/documentation/adt=
-manual/adt-manual.rst
> deleted file mode 100644
> index b61f59e0f..000000000
> --- a/documentation/adt-manual/adt-manual.rst
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> -
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Yocto Project Application Developer's Guide
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -|
> -
> -.. toctree::
> -   :caption: Table of Contents
> -   :numbered:
> -
> -   adt-manual-intro
> -   adt-intro
> -   adt-prepare
> -   adt-package
> -   adt-command
> diff --git a/documentation/adt-manual/adt-package.rst b/documentation/ad=
t-manual/adt-package.rst
> deleted file mode 100644
> index a722453ec..000000000
> --- a/documentation/adt-manual/adt-package.rst
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> -
> -************************************************************
> -Optionally Customizing the Development Packages Installation
> -************************************************************
> -
> -Because the Yocto Project is suited for embedded Linux development, it
> -is likely that you will need to customize your development packages
> -installation. For example, if you are developing a minimal image, then
> -you might not need certain packages (e.g. graphics support packages).
> -Thus, you would like to be able to remove those packages from your
> -target sysroot.
> -
> -Package Management Systems
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> -
> -The OpenEmbedded build system supports the generation of sysroot files
> -using three different Package Management Systems (PMS):
> -
> --  *OPKG:* A less well known PMS whose use originated in the
> -   OpenEmbedded and OpenWrt embedded Linux projects. This PMS works wit=
h
> -   files packaged in an ``.ipk`` format. See
> -   http://en.wikipedia.org/wiki/Opkg for more information about
> -   OPKG.
> -
> --  *RPM:* A more widely known PMS intended for GNU/Linux distributions.
> -   This PMS works with files packaged in an ``.rpm`` format. The build
> -   system currently installs through this PMS by default. See
> -   http://en.wikipedia.org/wiki/RPM_Package_Manager for more
> -   information about RPM.
> -
> --  *Debian:* The PMS for Debian-based systems is built on many PMS
> -   tools. The lower-level PMS tool ``dpkg`` forms the base of the Debia=
n
> -   PMS. For information on dpkg see
> -   http://en.wikipedia.org/wiki/Dpkg.
> -
> -Configuring the PMS
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Whichever PMS you are using, you need to be sure that the
> -:term:`PACKAGE_CLASSES`
> -variable in the ``conf/local.conf`` file is set to reflect that system.
> -The first value you choose for the variable specifies the package file
> -format for the root filesystem at sysroot. Additional values specify
> -additional formats for convenience or testing. See the
> -``conf/local.conf`` configuration file for details.
> -
> -.. note::
> -
> -   For build performance information related to the PMS, see the "
> -   package.bbclass
> -   " section in the Yocto Project Reference Manual.
> -
> -As an example, consider a scenario where you are using OPKG and you wan=
t
> -to add the ``libglade`` package to the target sysroot.
> -
> -First, you should generate the IPK file for the ``libglade`` package an=
d
> -add it into a working ``opkg`` repository. Use these commands: $ bitbak=
e
> -libglade $ bitbake package-index
> -
> -Next, source the cross-toolchain environment setup script found in the
> -:term:`Source Directory`. Follow
> -that by setting up the installation destination to point to your sysroo=
t
> -as sysroot_dir. Finally, have an OPKG configuration file conf_file that
> -corresponds to the ``opkg`` repository you have just created. The
> -following command forms should now work: $ opkg-cl =E2=80=93f conf_file=
 -o
> -sysroot_dir update $ opkg-cl =E2=80=93f cconf_file -o sysroot_dir \\
> ---force-overwrite install libglade $ opkg-cl =E2=80=93f cconf_file -o
> -sysroot_dir \\ --force-overwrite install libglade-dbg $ opkg-cl =E2=80=
=93f
> -conf_file> -osysroot_dir> \\ --force-overwrite install libglade-dev
> diff --git a/documentation/adt-manual/adt-prepare.rst b/documentation/ad=
t-manual/adt-prepare.rst
> deleted file mode 100644
> index 3e5c6ae94..000000000
> --- a/documentation/adt-manual/adt-prepare.rst
> +++ /dev/null
> @@ -1,752 +0,0 @@
> -.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> -
> -*************************************
> -Preparing for Application Development
> -*************************************
> -
> -In order to develop applications, you need set up your host development
> -system. Several ways exist that allow you to install cross-development
> -tools, QEMU, the Eclipse Yocto Plug-in, and other tools. This chapter
> -describes how to prepare for application development.
> -
> -.. _installing-the-adt:
> -
> -Installing the ADT and Toolchains
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -The following list describes installation methods that set up varying
> -degrees of tool availability on your system. Regardless of the
> -installation method you choose, you must ``source`` the cross-toolchain
> -environment setup script, which establishes several key environment
> -variables, before you use a toolchain. See the "`Setting Up the
> -Cross-Development
> -Environment <#setting-up-the-cross-development-environment>`__" section
> -for more information.
> -
> -.. note::
> -
> -   Avoid mixing installation methods when installing toolchains for
> -   different architectures. For example, avoid using the ADT Installer
> -   to install some toolchains and then hand-installing cross-developmen=
t
> -   toolchains by running the toolchain installer for different
> -   architectures. Mixing installation methods can result in situations
> -   where the ADT Installer becomes unreliable and might not install the
> -   toolchain.
> -
> -   If you must mix installation methods, you might avoid problems by
> -   deleting ``/var/lib/opkg``, thus purging the ``opkg`` package
> -   metadata.
> -
> --  *Use the ADT installer script:* This method is the recommended way t=
o
> -   install the ADT because it automates much of the process for you. Fo=
r
> -   example, you can configure the installation to install the QEMU
> -   emulator and the user-space NFS, specify which root filesystem
> -   profiles to download, and define the target sysroot location.
> -
> --  *Use an existing toolchain:* Using this method, you select and
> -   download an architecture-specific toolchain installer and then run
> -   the script to hand-install the toolchain. If you use this method, yo=
u
> -   just get the cross-toolchain and QEMU - you do not get any of the
> -   other mentioned benefits had you run the ADT Installer script.
> -
> --  *Use the toolchain from within the Build Directory:* If you already
> -   have a :term:`Build Directory`,
> -   you can build the cross-toolchain within the directory. However, lik=
e
> -   the previous method mentioned, you only get the cross-toolchain and
> -   QEMU - you do not get any of the other benefits without taking
> -   separate steps.
> -
> -Using the ADT Installer
> ------------------------
> -
> -To run the ADT Installer, you need to get the ADT Installer tarball, be
> -sure you have the necessary host development packages that support the
> -ADT Installer, and then run the ADT Installer Script.
> -
> -For a list of the host packages needed to support ADT installation and
> -use, see the "ADT Installer Extras" lists in the "`Required Packages fo=
r
> -the Host Development
> -System <&YOCTO_DOCS_REF_URL;#required-packages-for-the-host-development=
-system>`__"
> -section of the Yocto Project Reference Manual.
> -
> -Getting the ADT Installer Tarball
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -The ADT Installer is contained in the ADT Installer tarball. You can ge=
t
> -the tarball using either of these methods:
> -
> --  *Download the Tarball:* You can download the tarball from
> -   ` <&YOCTO_ADTINSTALLER_DL_URL;>`__ into any directory.
> -
> --  *Build the Tarball:* You can use
> -   :term:`BitBake` to generate the
> -   tarball inside an existing :term:`Build Directory`.
> -
> -   If you use BitBake to generate the ADT Installer tarball, you must
> -   ``source`` the environment setup script
> -   (````` <&YOCTO_DOCS_REF_URL;#structure-core-script>`__ or
> -   ```oe-init-build-env-memres`` <&YOCTO_DOCS_REF_URL;#structure-memres=
-core-script>`__)
> -   located in the Source Directory before running the ``bitbake``
> -   command that creates the tarball.
> -
> -   The following example commands establish the
> -   :term:`Source Directory`, check out the
> -   current release branch, set up the build environment while also
> -   creating the default Build Directory, and run the ``bitbake`` comman=
d
> -   that results in the tarball
> -   ``poky/build/tmp/deploy/sdk/adt_installer.tar.bz2``:
> -
> -   .. note::
> -
> -      Before using BitBake to build the ADT tarball, be sure to make
> -      sure your
> -      local.conf
> -      file is properly configured. See the "
> -      User Configuration
> -      " section in the Yocto Project Reference Manual for general
> -      configuration information.
> -
> -   $ cd ~ $ git clone git://git.yoctoproject.org/poky $ cd poky $ git
> -   checkout -b DISTRO_NAME origin/DISTRO_NAME $ source oe-init-build-en=
v $
> -   bitbake adt-installer
> -
> -Configuring and Running the ADT Installer Script
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -Before running the ADT Installer script, you need to unpack the tarball=
.
> -You can unpack the tarball in any directory you wish. For example, this
> -command copies the ADT Installer tarball from where it was built into
> -the home directory and then unpacks the tarball into a top-level
> -directory named ``adt-installer``: $ cd ~ $ cp
> -poky/build/tmp/deploy/sdk/adt_installer.tar.bz2 $HOME $ tar -xjf
> -adt_installer.tar.bz2 Unpacking it creates the directory
> -``adt-installer``, which contains the ADT Installer script
> -(``adt_installer``) and its configuration file (``adt_installer.conf``)=
.
> -
> -Before you run the script, however, you should examine the ADT Installe=
r
> -configuration file and be sure you are going to get what you want. Your
> -configurations determine which kernel and filesystem image are
> -downloaded.
> -
> -The following list describes the configurations you can define for the
> -ADT Installer. For configuration values and restrictions, see the
> -comments in the ``adt-installer.conf`` file:
> -
> --  ``YOCTOADT_REPO``: This area includes the IPKG-based packages and th=
e
> -   root filesystem upon which the installation is based. If you want to
> -   set up your own IPKG repository pointed to by ``YOCTOADT_REPO``, you
> -   need to be sure that the directory structure follows the same layout
> -   as the reference directory set up at
> -   http://adtrepo.yoctoproject.org. Also, your repository needs
> -   to be accessible through HTTP.
> -
> --  ``YOCTOADT_TARGETS``: The machine target architectures for which you
> -   want to set up cross-development environments.
> -
> --  ``YOCTOADT_QEMU``: Indicates whether or not to install the emulator
> -   QEMU.
> -
> --  ``YOCTOADT_NFS_UTIL``: Indicates whether or not to install user-mode
> -   NFS. If you plan to use the Eclipse IDE Yocto plug-in against QEMU,
> -   you should install NFS.
> -
> -   .. note::
> -
> -      To boot QEMU images using our userspace NFS server, you need to b=
e
> -      running
> -      portmap
> -      or
> -      rpcbind
> -      . If you are running
> -      rpcbind
> -      , you will also need to add the
> -      -i
> -      option when
> -      rpcbind
> -      starts up. Please make sure you understand the security
> -      implications of doing this. You might also have to modify your
> -      firewall settings to allow NFS booting to work.
> -
> --  ``YOCTOADT_ROOTFS_``\ arch: The root filesystem images you want to
> -   download from the ``YOCTOADT_IPKG_REPO`` repository.
> -
> --  ``YOCTOADT_TARGET_SYSROOT_IMAGE_``\ arch: The particular root
> -   filesystem used to extract and create the target sysroot. The value
> -   of this variable must have been specified with
> -   ``YOCTOADT_ROOTFS_``\ arch. For example, if you downloaded both
> -   ``minimal`` and ``sato-sdk`` images by setting
> -   ``YOCTOADT_ROOTFS_``\ arch to "minimal sato-sdk", then
> -   ``YOCTOADT_ROOTFS_``\ arch must be set to either "minimal" or
> -   "sato-sdk".
> -
> --  ``YOCTOADT_TARGET_SYSROOT_LOC_``\ arch: The location on the
> -   development host where the target sysroot is created.
> -
> -After you have configured the ``adt_installer.conf`` file, run the
> -installer using the following command: $ cd adt-installer $
> -./adt_installer Once the installer begins to run, you are asked to ente=
r
> -the location for cross-toolchain installation. The default location is
> -``/opt/poky/``\ release. After either accepting the default location or
> -selecting your own location, you are prompted to run the installation
> -script interactively or in silent mode. If you want to closely monitor
> -the installation, choose "I" for interactive mode rather than "S" for
> -silent mode. Follow the prompts from the script to complete the
> -installation.
> -
> -Once the installation completes, the ADT, which includes the
> -cross-toolchain, is installed in the selected installation directory.
> -You will notice environment setup files for the cross-toolchain in the
> -installation directory, and image tarballs in the ``adt-installer``
> -directory according to your installer configurations, and the target
> -sysroot located according to the ``YOCTOADT_TARGET_SYSROOT_LOC_``\ arch
> -variable also in your configuration file.
> -
> -.. _using-an-existing-toolchain-tarball:
> -
> -Using a Cross-Toolchain Tarball
> --------------------------------
> -
> -If you want to simply install a cross-toolchain by hand, you can do so
> -by running the toolchain installer. The installer includes the pre-buil=
t
> -cross-toolchain, the ``runqemu`` script, and support files. If you use
> -this method to install the cross-toolchain, you might still need to
> -install the target sysroot by installing and extracting it separately.
> -For information on how to install the sysroot, see the "`Extracting the
> -Root Filesystem <#extracting-the-root-filesystem>`__" section.
> -
> -Follow these steps:
> -
> -1. *Get your toolchain installer using one of the following methods:*
> -
> -   -  Go to ` <&YOCTO_TOOLCHAIN_DL_URL;>`__ and find the folder that
> -      matches your host development system (i.e. ``i686`` for 32-bit
> -      machines or ``x86_64`` for 64-bit machines).
> -
> -      Go into that folder and download the toolchain installer whose
> -      name includes the appropriate target architecture. The toolchains
> -      provided by the Yocto Project are based off of the
> -      ``core-image-sato`` image and contain libraries appropriate for
> -      developing against that image. For example, if your host
> -      development system is a 64-bit x86 system and you are going to us=
e
> -      your cross-toolchain for a 32-bit x86 target, go into the
> -      ``x86_64`` folder and download the following installer:
> -      poky-glibc-x86_64-core-image-sato-i586-toolchain-DISTRO.sh
> -
> -   -  Build your own toolchain installer. For cases where you cannot us=
e
> -      an installer from the download area, you can build your own as
> -      described in the "`Optionally Building a Toolchain
> -      Installer <#optionally-building-a-toolchain-installer>`__"
> -      section.
> -
> -2. *Once you have the installer, run it to install the toolchain:*
> -
> -   .. note::
> -
> -      You must change the permissions on the toolchain installer script
> -      so that it is executable.
> -
> -   The following command shows how to run the installer given a
> -   toolchain tarball for a 64-bit x86 development host system and a
> -   32-bit x86 target architecture. The example assumes the toolchain
> -   installer is located in ``~/Downloads/``. $
> -   ~/Downloads/poky-glibc-x86_64-core-image-sato-i586-toolchain-DISTRO.=
sh
> -   The first thing the installer prompts you for is the directory into
> -   which you want to install the toolchain. The default directory used
> -   is ``/opt/poky/DISTRO``. If you do not have write permissions for th=
e
> -   directory into which you are installing the toolchain, the toolchain
> -   installer notifies you and exits. Be sure you have write permissions
> -   in the directory and run the installer again.
> -
> -   When the script finishes, the cross-toolchain is installed. You will
> -   notice environment setup files for the cross-toolchain in the
> -   installation directory.
> -
> -.. _using-the-toolchain-from-within-the-build-tree:
> -
> -Using BitBake and the Build Directory
> --------------------------------------
> -
> -A final way of making the cross-toolchain available is to use BitBake t=
o
> -generate the toolchain within an existing :term:`Build Directory`.
> -This method does
> -not install the toolchain into the default ``/opt`` directory. As with
> -the previous method, if you need to install the target sysroot, you mus=
t
> -do that separately as well.
> -
> -Follow these steps to generate the toolchain into the Build Directory:
> -
> -1. *Set up the Build Environment:* Source the OpenEmbedded build
> -   environment setup script (i.e.
> -   ````` <&YOCTO_DOCS_REF_URL;#structure-core-script>`__ or
> -   ```oe-init-build-env-memres`` <&YOCTO_DOCS_REF_URL;#structure-memres=
-core-script>`__)
> -   located in the :term:`Source Directory`.
> -
> -2. *Check your Local Configuration File:* At this point, you should be
> -   sure that the :term:`MACHINE`
> -   variable in the ``local.conf`` file found in the ``conf`` directory
> -   of the Build Directory is set for the target architecture. Comments
> -   within the ``local.conf`` file list the values you can use for the
> -   ``MACHINE`` variable. If you do not change the ``MACHINE`` variable,
> -   the OpenEmbedded build system uses ``qemux86`` as the default target
> -   machine when building the cross-toolchain.
> -
> -   .. note::
> -
> -      You can populate the Build Directory with the cross-toolchains fo=
r
> -      more than a single architecture. You just need to edit the
> -      MACHINE
> -      variable in the
> -      local.conf
> -      file and re-run the
> -      bitbake
> -      command.
> -
> -3. *Make Sure Your Layers are Enabled:* Examine the
> -   ``conf/bblayers.conf`` file and make sure that you have enabled all
> -   the compatible layers for your target machine. The OpenEmbedded buil=
d
> -   system needs to be aware of each layer you want included when
> -   building images and cross-toolchains. For information on how to
> -   enable a layer, see the "`Enabling Your
> -   Layer <&YOCTO_DOCS_DEV_URL;#enabling-your-layer>`__" section in the
> -   Yocto Project Development Manual.
> -
> -4. *Generate the Cross-Toolchain:* Run ``bitbake meta-ide-support`` to
> -   complete the cross-toolchain generation. Once the ``bitbake`` comman=
d
> -   finishes, the cross-toolchain is generated and populated within the
> -   Build Directory. You will notice environment setup files for the
> -   cross-toolchain that contain the string "``environment-setup``" in
> -   the Build Directory's ``tmp`` folder.
> -
> -   Be aware that when you use this method to install the toolchain, you
> -   still need to separately extract and install the sysroot filesystem.
> -   For information on how to do this, see the "`Extracting the Root
> -   Filesystem <#extracting-the-root-filesystem>`__" section.
> -
> -Setting Up the Cross-Development Environment
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Before you can develop using the cross-toolchain, you need to set up th=
e
> -cross-development environment by sourcing the toolchain's environment
> -setup script. If you used the ADT Installer or hand-installed
> -cross-toolchain, then you can find this script in the directory you
> -chose for installation. For this release, the default installation
> -directory is ````. If you installed the toolchain in the
> -:term:`Build Directory`, you can find the
> -environment setup script for the toolchain in the Build Directory's
> -``tmp`` directory.
> -
> -Be sure to run the environment setup script that matches the
> -architecture for which you are developing. Environment setup scripts
> -begin with the string "``environment-setup``" and include as part of
> -their name the architecture. For example, the toolchain environment
> -setup script for a 64-bit IA-based architecture installed in the defaul=
t
> -installation directory would be the following:
> -YOCTO_ADTPATH_DIR/environment-setup-x86_64-poky-linux When you run the
> -setup script, many environment variables are defined:
> -:term:`SDKTARGETSYSROOT` -
> -The path to the sysroot used for cross-compilation
> -:term:`PKG_CONFIG_PATH` - The
> -path to the target pkg-config files
> -:term:`CONFIG_SITE` - A GNU
> -autoconf site file preconfigured for the target
> -:term:`CC` - The minimal command and
> -arguments to run the C compiler
> -:term:`CXX` - The minimal command and
> -arguments to run the C++ compiler
> -:term:`CPP` - The minimal command and
> -arguments to run the C preprocessor
> -:term:`AS` - The minimal command and
> -arguments to run the assembler :term:`LD`
> -- The minimal command and arguments to run the linker
> -:term:`GDB` - The minimal command and
> -arguments to run the GNU Debugger
> -:term:`STRIP` - The minimal command and
> -arguments to run 'strip', which strips symbols
> -:term:`RANLIB` - The minimal command
> -and arguments to run 'ranlib'
> -:term:`OBJCOPY` - The minimal command
> -and arguments to run 'objcopy'
> -:term:`OBJDUMP` - The minimal command
> -and arguments to run 'objdump' :term:`AR`
> -- The minimal command and arguments to run 'ar'
> -:term:`NM` - The minimal command and
> -arguments to run 'nm'
> -:term:`TARGET_PREFIX` - The
> -toolchain binary prefix for the target tools
> -:term:`CROSS_COMPILE` - The
> -toolchain binary prefix for the target tools
> -:term:`CONFIGURE_FLAGS` - The
> -minimal arguments for GNU configure
> -:term:`CFLAGS` - Suggested C flags
> -:term:`CXXFLAGS` - Suggested C++
> -flags :term:`LDFLAGS` - Suggested
> -linker flags when you use CC to link
> -:term:`CPPFLAGS` - Suggested
> -preprocessor flags
> -
> -Securing Kernel and Filesystem Images
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -You will need to have a kernel and filesystem image to boot using your
> -hardware or the QEMU emulator. Furthermore, if you plan on booting your
> -image using NFS or you want to use the root filesystem as the target
> -sysroot, you need to extract the root filesystem.
> -
> -Getting the Images
> -------------------
> -
> -To get the kernel and filesystem images, you either have to build them
> -or download pre-built versions. For an example of how to build these
> -images, see the "`Buiding
> -Images <&YOCTO_DOCS_QS_URL;#qs-buiding-images>`__" section of the Yocto
> -Project Quick Start. For an example of downloading pre-build versions,
> -see the "`Example Using Pre-Built Binaries and
> -QEMU <#using-pre-built>`__" section.
> -
> -The Yocto Project ships basic kernel and filesystem images for several
> -architectures (``x86``, ``x86-64``, ``mips``, ``powerpc``, and ``arm``)
> -that you can use unaltered in the QEMU emulator. These kernel images
> -reside in the release area - ` <&YOCTO_MACHINES_DL_URL;>`__ and are
> -ideal for experimentation using Yocto Project. For information on the
> -image types you can build using the OpenEmbedded build system, see the
> -":ref:`ref-manual/ref-images:Images`" chapter in the Yocto
> -Project Reference Manual.
> -
> -If you are planning on developing against your image and you are not
> -building or using one of the Yocto Project development images (e.g.
> -``core-image-*-dev``), you must be sure to include the development
> -packages as part of your image recipe.
> -
> -If you plan on remotely deploying and debugging your application from
> -within the Eclipse IDE, you must have an image that contains the Yocto
> -Target Communication Framework (TCF) agent (``tcf-agent``). You can do
> -this by including the ``eclipse-debug`` image feature.
> -
> -.. note::
> -
> -   See the "
> -   Image Features
> -   " section in the Yocto Project Reference Manual for information on
> -   image features.
> -
> -To include the ``eclipse-debug`` image feature, modify your
> -``local.conf`` file in the :term:`Build Directory`
> -so that the
> -:term:`EXTRA_IMAGE_FEATURES`
> -variable includes the "eclipse-debug" feature. After modifying the
> -configuration file, you can rebuild the image. Once the image is
> -rebuilt, the ``tcf-agent`` will be included in the image and is launche=
d
> -automatically after the boot.
> -
> -Extracting the Root Filesystem
> -------------------------------
> -
> -If you install your toolchain by hand or build it using BitBake and you
> -need a root filesystem, you need to extract it separately. If you use
> -the ADT Installer to install the ADT, the root filesystem is
> -automatically extracted and installed.
> -
> -Here are some cases where you need to extract the root filesystem:
> -
> --  You want to boot the image using NFS.
> -
> --  You want to use the root filesystem as the target sysroot. For
> -   example, the Eclipse IDE environment with the Eclipse Yocto Plug-in
> -   installed allows you to use QEMU to boot under NFS.
> -
> --  You want to develop your target application using the root filesyste=
m
> -   as the target sysroot.
> -
> -To extract the root filesystem, first ``source`` the cross-development
> -environment setup script to establish necessary environment variables.
> -If you built the toolchain in the Build Directory, you will find the
> -toolchain environment script in the ``tmp`` directory. If you installed
> -the toolchain by hand, the environment setup script is located in
> -``/opt/poky/DISTRO``.
> -
> -After sourcing the environment script, use the ``runqemu-extract-sdk``
> -command and provide the filesystem image.
> -
> -Following is an example. The second command sets up the environment. In
> -this case, the setup script is located in the ``/opt/poky/DISTRO``
> -directory. The third command extracts the root filesystem from a
> -previously built filesystem that is located in the ``~/Downloads``
> -directory. Furthermore, this command extracts the root filesystem into
> -the ``qemux86-sato`` directory: $ cd ~ $ source
> -/opt/poky/DISTRO/environment-setup-i586-poky-linux $ runqemu-extract-sd=
k
> -\\ ~/Downloads/core-image-sato-sdk-qemux86-2011091411831.rootfs.tar.bz2
> -\\ $HOME/qemux86-sato You could now point to the target sysroot at
> -``qemux86-sato``.
> -
> -Optionally Building a Toolchain Installer
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -As an alternative to locating and downloading a toolchain installer, yo=
u
> -can build the toolchain installer if you have a :term:`Build Directory`=
.
> -
> -.. note::
> -
> -   Although not the preferred method, it is also possible to use
> -   bitbake meta-toolchain
> -   to build the toolchain installer. If you do use this method, you mus=
t
> -   separately install and extract the target sysroot. For information o=
n
> -   how to install the sysroot, see the "
> -   Extracting the Root Filesystem
> -   " section.
> -
> -To build the toolchain installer and populate the SDK image, use the
> -following command: $ bitbake image -c populate_sdk The command results
> -in a toolchain installer that contains the sysroot that matches your
> -target root filesystem.
> -
> -Another powerful feature is that the toolchain is completely
> -self-contained. The binaries are linked against their own copy of
> -``libc``, which results in no dependencies on the target system. To
> -achieve this, the pointer to the dynamic loader is configured at instal=
l
> -time since that path cannot be dynamically altered. This is the reason
> -for a wrapper around the ``populate_sdk`` archive.
> -
> -Another feature is that only one set of cross-canadian toolchain
> -binaries are produced per architecture. This feature takes advantage of
> -the fact that the target hardware can be passed to ``gcc`` as a set of
> -compiler options. Those options are set up by the environment script an=
d
> -contained in variables such as :term:`CC`
> -and :term:`LD`. This reduces the space
> -needed for the tools. Understand, however, that a sysroot is still
> -needed for every target since those binaries are target-specific.
> -
> -Remember, before using any BitBake command, you must source the build
> -environment setup script (i.e.
> -````` <&YOCTO_DOCS_REF_URL;#structure-core-script>`__ or
> -```oe-init-build-env-memres`` <&YOCTO_DOCS_REF_URL;#structure-memres-co=
re-script>`__)
> -located in the Source Directory and you must make sure your
> -``conf/local.conf`` variables are correct. In particular, you need to b=
e
> -sure the :term:`MACHINE` variable
> -matches the architecture for which you are building and that the
> -:term:`SDKMACHINE` variable is
> -correctly set if you are building a toolchain designed to run on an
> -architecture that differs from your current development host machine
> -(i.e. the build machine).
> -
> -When the ``bitbake`` command completes, the toolchain installer will be
> -in ``tmp/deploy/sdk`` in the Build Directory.
> -
> -.. note::
> -
> -   By default, this toolchain does not build static binaries. If you
> -   want to use the toolchain to build these types of libraries, you nee=
d
> -   to be sure your image has the appropriate static development
> -   libraries. Use the
> -   IMAGE_INSTALL
> -   variable inside your
> -   local.conf
> -   file to install the appropriate library packages. Following is an
> -   example using
> -   glibc
> -   static development libraries:
> -   ::
> -
> -           IMAGE_INSTALL_append =3D " glibc-staticdev"
> -
> -
> -Optionally Using an External Toolchain
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -You might want to use an external toolchain as part of your development=
.
> -If this is the case, the fundamental steps you need to accomplish are a=
s
> -follows:
> -
> --  Understand where the installed toolchain resides. For cases where yo=
u
> -   need to build the external toolchain, you would need to take separat=
e
> -   steps to build and install the toolchain.
> -
> --  Make sure you add the layer that contains the toolchain to your
> -   ``bblayers.conf`` file through the
> -   :term:`BBLAYERS` variable.
> -
> --  Set the
> -   :term:`EXTERNAL_TOOLCHAIN`
> -   variable in your ``local.conf`` file to the location in which you
> -   installed the toolchain.
> -
> -A good example of an external toolchain used with the Yocto Project is
> -Mentor Graphics Sourcery G++ Toolchain. You can see information on how
> -to use that particular layer in the ``README`` file at
> -http://github.com/MentorEmbedded/meta-sourcery/. You can find
> -further information by reading about the
> -:term:`TCMODE` variable in the Yocto
> -Project Reference Manual's variable glossary.
> -
> -.. _using-pre-built:
> -
> -Example Using Pre-Built Binaries and QEMU
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -If hardware, libraries and services are stable, you can get started by
> -using a pre-built binary of the filesystem image, kernel, and toolchain
> -and run it using the QEMU emulator. This scenario is useful for
> -developing application software.
> -
> -|Using a Pre-Built Image|
> -
> -For this scenario, you need to do several things:
> -
> --  Install the appropriate stand-alone toolchain tarball.
> -
> --  Download the pre-built image that will boot with QEMU. You need to b=
e
> -   sure to get the QEMU image that matches your target machine's
> -   architecture (e.g. x86, ARM, etc.).
> -
> --  Download the filesystem image for your target machine's architecture=
.
> -
> --  Set up the environment to emulate the hardware and then start the
> -   QEMU emulator.
> -
> -Installing the Toolchain
> -------------------------
> -
> -You can download a tarball installer, which includes the pre-built
> -toolchain, the ``runqemu`` script, and support files from the
> -appropriate directory under ` <&YOCTO_TOOLCHAIN_DL_URL;>`__. Toolchains
> -are available for 32-bit and 64-bit x86 development systems from the
> -``i686`` and ``x86_64`` directories, respectively. The toolchains the
> -Yocto Project provides are based off the ``core-image-sato`` image and
> -contain libraries appropriate for developing against that image. Each
> -type of development system supports five or more target architectures.
> -
> -The names of the tarball installer scripts are such that a string
> -representing the host system appears first in the filename and then is
> -immediately followed by a string representing the target architecture.
> -
> -::
> -
> -        poky-glibc-host_system-image_type-arch-toolchain-release_versio=
n.sh
> -
> -        Where:
> -            host_system is a string representing your development syste=
m:
> -
> -                       i686 or x86_64.
> -
> -            image_type is a string representing the image you wish to
> -                   develop a Software Development Toolkit (SDK) for use=
 against.
> -                   The Yocto Project builds toolchain installers using =
the
> -                   following BitBake command:
> -
> -                       bitbake core-image-sato -c populate_sdk
> -
> -            arch is a string representing the tuned target architecture=
:
> -
> -                       i586, x86_64, powerpc, mips, armv7a or armv5te
> -
> -            release_version is a string representing the release number=
 of the
> -                   Yocto Project:
> -
> -                       DISTRO, DISTRO+snapshot
> -
> -
> -For example, the following toolchain installer is for a 64-bit
> -development host system and a i586-tuned target architecture based off
> -the SDK for ``core-image-sato``:
> -poky-glibc-x86_64-core-image-sato-i586-toolchain-DISTRO.sh
> -
> -Toolchains are self-contained and by default are installed into
> -``/opt/poky``. However, when you run the toolchain installer, you can
> -choose an installation directory.
> -
> -The following command shows how to run the installer given a toolchain
> -tarball for a 64-bit x86 development host system and a 32-bit x86 targe=
t
> -architecture. You must change the permissions on the toolchain installe=
r
> -script so that it is executable.
> -
> -The example assumes the toolchain installer is located in
> -``~/Downloads/``.
> -
> -.. note::
> -
> -   If you do not have write permissions for the directory into which yo=
u
> -   are installing the toolchain, the toolchain installer notifies you
> -   and exits. Be sure you have write permissions in the directory and
> -   run the installer again.
> -
> -$ ~/Downloads/poky-glibc-x86_64-core-image-sato-i586-toolchain-DISTRO.s=
h
> -
> -For more information on how to install tarballs, see the "`Using a
> -Cross-Toolchain
> -Tarball <&YOCTO_DOCS_ADT_URL;#using-an-existing-toolchain-tarball>`__"
> -and "`Using BitBake and the Build
> -Directory <&YOCTO_DOCS_ADT_URL;#using-the-toolchain-from-within-the-bui=
ld-tree>`__"
> -sections in the Yocto Project Application Developer's Guide.
> -
> -Downloading the Pre-Built Linux Kernel
> ---------------------------------------
> -
> -You can download the pre-built Linux kernel suitable for running in the
> -QEMU emulator from ` <&YOCTO_QEMU_DL_URL;>`__. Be sure to use the kerne=
l
> -that matches the architecture you want to simulate. Download areas exis=
t
> -for the five supported machine architectures: ``qemuarm``, ``qemumips``=
,
> -``qemuppc``, ``qemux86``, and ``qemux86-64``.
> -
> -Most kernel files have one of the following forms: \*zImage-qemuarch.bi=
n
> -vmlinux-qemuarch.bin Where: arch is a string representing the target
> -architecture: x86, x86-64, ppc, mips, or arm.
> -
> -You can learn more about downloading a Yocto Project kernel in the
> -"`Yocto Project Kernel <&YOCTO_DOCS_DEV_URL;#local-kernel-files>`__"
> -bulleted item in the Yocto Project Development Manual.
> -
> -Downloading the Filesystem
> ---------------------------
> -
> -You can also download the filesystem image suitable for your target
> -architecture from ` <&YOCTO_QEMU_DL_URL;>`__. Again, be sure to use the
> -filesystem that matches the architecture you want to simulate.
> -
> -The filesystem image has two tarball forms: ``ext3`` and ``tar``. You
> -must use the ``ext3`` form when booting an image using the QEMU
> -emulator. The ``tar`` form can be flattened out in your host developmen=
t
> -system and used for build purposes with the Yocto Project.
> -core-image-profile-qemuarch.ext3 core-image-profile-qemuarch.tar.bz2
> -Where: profile is the filesystem image's profile: lsb, lsb-dev, lsb-sdk=
,
> -lsb-qt3, minimal, minimal-dev, sato, sato-dev, or sato-sdk. For
> -information on these types of image profiles, see the
> -":ref:`ref-manual/ref-images:Images`" chapter in the Yocto
> -Project Reference Manual. arch is a string representing the target
> -architecture: x86, x86-64, ppc, mips, or arm.
> -
> -Setting Up the Environment and Starting the QEMU Emulator
> ----------------------------------------------------------
> -
> -Before you start the QEMU emulator, you need to set up the emulation
> -environment. The following command form sets up the emulation
> -environment. $ source
> -YOCTO_ADTPATH_DIR/environment-setup-arch-poky-linux-if Where: arch is a
> -string representing the target architecture: i586, x86_64, ppc603e,
> -mips, or armv5te. if is a string representing an embedded application
> -binary interface. Not all setup scripts include this string.
> -
> -Finally, this command form invokes the QEMU emulator $ runqemu qemuarch
> -kernel-image filesystem-image Where: qemuarch is a string representing
> -the target architecture: qemux86, qemux86-64, qemuppc, qemumips, or
> -qemuarm. kernel-image is the architecture-specific kernel image.
> -filesystem-image is the .ext3 filesystem image.
> -
> -Continuing with the example, the following two commands setup the
> -emulation environment and launch QEMU. This example assumes the root
> -filesystem (``.ext3`` file) and the pre-built kernel image file both
> -reside in your home directory. The kernel and filesystem are for a
> -32-bit target architecture. $ cd $HOME $ source
> -YOCTO_ADTPATH_DIR/environment-setup-i586-poky-linux $ runqemu qemux86
> -bzImage-qemux86.bin \\ core-image-sato-qemux86.ext3
> -
> -The environment in which QEMU launches varies depending on the
> -filesystem image and on the target architecture. For example, if you
> -source the environment for the ARM target architecture and then boot th=
e
> -minimal QEMU image, the emulator comes up in a new shell in command-lin=
e
> -mode. However, if you boot the SDK image, QEMU comes up with a GUI.
> -
> -.. note::
> -
> -   Booting the PPC image results in QEMU launching in the same shell in
> -   command-line mode.
> -
> -.. |Using a Pre-Built Image| image:: figures/using-a-pre-built-image.pn=
g
> diff --git a/documentation/adt-manual/figures/adt-title.png b/documentat=
ion/adt-manual/figures/adt-title.png
> deleted file mode 100644
> index 6e71e41f1..000000000
> Binary files a/documentation/adt-manual/figures/adt-title.png and /dev/n=
ull differ
> diff --git a/documentation/adt-manual/figures/using-a-pre-built-image.pn=
g b/documentation/adt-manual/figures/using-a-pre-built-image.png
> deleted file mode 100644
> index b03130d12..000000000
> Binary files a/documentation/adt-manual/figures/using-a-pre-built-image.=
png and /dev/null differ
> diff --git a/documentation/conf.py b/documentation/conf.py
> index ebc26aa3b..9a0186f35 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -53,8 +53,7 @@ templates_path =3D ['_templates']
>  # List of patterns, relative to source directory, that match files and
>  # directories to ignore when looking for source files.
>  # This pattern also affects html_static_path and html_extra_path.
> -exclude_patterns =3D ['_build', 'Thumbs.db', '.DS_Store', 'boilerplate.=
rst',
> -                    'adt-manual/*.rst']
> +exclude_patterns =3D ['_build', 'Thumbs.db', '.DS_Store', 'boilerplate.=
rst']
>
>  # master document name. The default changed from contents to index. so =
better
>  # set it ourselves.
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 895864b99..e39c403fe 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -43,7 +43,6 @@ YOCTO_QEMU_DL_URL : "&YOCTO_MACHINES_DL_URL;/qemu"
>  YOCTO_PYTHON-i686_DL_URL : "&YOCTO_DL_URL;/releases/miscsupport/python-=
nativesdk-standalone-i686.tar.bz2"
>  YOCTO_PYTHON-x86_64_DL_URL : "&YOCTO_DL_URL;/releases/miscsupport/pytho=
n-nativesdk-standalone-x86_64.tar.bz2"
>  YOCTO_DOCS_QS_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/yocto-project=
-qs/yocto-project-qs.html"
> -YOCTO_DOCS_ADT_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/adt-manual/a=
dt-manual.html"
>  YOCTO_DOCS_REF_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/ref-manual/r=
ef-manual.html"
>  YOCTO_DOCS_BSP_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/bsp-guide/bs=
p-guide.html"
>  YOCTO_DOCS_DEV_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/dev-manual/d=
ev-manual.html"
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>=20
>

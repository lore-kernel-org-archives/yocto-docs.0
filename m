Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.4195.1607031549637201751
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fuoR4T0j;
 spf=pass (domain: linaro.org, ip: 209.85.128.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f43.google.com with SMTP id a6so4004162wmc.2
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9nUOou1kQ6EP6BHGYmAlyn0GdRlJGvUmPwqT3nw/lk0=;
        b=fuoR4T0jslGT3ireVs/MrGudYPBJtP2wGFkZil0VNK4FSs7luIxJaYQ4L+cr4KNbrK
         4QJ2VCxZvaw5qNVTM5SG1wXZ6lwBwXq4f81GBDNFs2PQk9h2se3wbQGJKitGfKTOrwEe
         Ar1kZxHgmNxH77RiFD0gThmEMW5a1j1LPcdzrbVOMlSRKbQrnDRJKuhKWCflOgm7wwIq
         nui/nz86pLY5MSTI1RGq5btxFnHOJ6VinFL67BQyTtOJdXabuCvRLMx6Dg3eMWJ8BNBh
         Pxi8Umil4UlHzWsmUxzW15b/gGR68v9BOm/Pfz/hDQzGLS2Vi2CQDgMQueE4GLPWcIFZ
         4n3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9nUOou1kQ6EP6BHGYmAlyn0GdRlJGvUmPwqT3nw/lk0=;
        b=ONRKKIBGQJhJo9v+NTeO/O2lSWIgraMXMy2pwVkvq1LmI5Cxe51rNpwz5YNrg4a7nv
         jKKptOdp6gN0WgzKgoLewqqzFijQG5S+qWpuBxcMqaK7P1d0S7i5nXFnXqF72x8xjoGK
         JOqJQ/tBE0XMjA5ISYevgrMBvgwjkAgfkGtASpf3wrgLvtH+zpTwg9ZRL7sYV+72BKSE
         3eK+jM0X5wUenuuuInSHGcOeB5UI/XFwS/6ZHhZNNDPuJZOJUyDpBLdnYeUVreSrr+rh
         3XlXQugaHh8kE+qVuFgo8LXA9NPjNkBwqN/odoCRhHN7fPANuXPFwHaUTmgenj9HEk7W
         K4qw==
X-Gm-Message-State: AOAM531ANbGS9rJm3sKMQDDGHjoh0uQGXgab5zmJ22OOzgiHodhUwqY6
	2DfeE5WIU1ucp+BfGqdT5sMTIvQkprm+v3aC
X-Google-Smtp-Source: ABdhPJy46O1+8O4OF+IiylM0CLC9kOvY9qEyEZwViZnl7LwJbow+KHVAEYM/ZQFgcLXNrWv05mOwzg==
X-Received: by 2002:a1c:9ac6:: with SMTP id c189mr789833wme.137.1607031546357;
        Thu, 03 Dec 2020 13:39:06 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id y7sm886214wrp.3.2020.12.03.13.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:39:05 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 10/10] ref-manual: remove 'ref' from filenames
Date: Thu,  3 Dec 2020 22:38:43 +0100
Message-Id: <20201203213843.347671-11-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
References: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All filenames duplicate the 'manual name', which is not needed, and
make all references longer than they should. Rename all files to be as
consise as possible, and fix all references

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/brief-yoctoprojectqs/index.rst  |  8 +++---
 documentation/bsp-guide/bsp.rst               | 10 +++----
 documentation/dev-manual/common-tasks.rst     | 24 ++++++++---------
 documentation/dev-manual/start.rst            |  4 +--
 documentation/overview-manual/concepts.rst    |  6 ++---
 documentation/overview-manual/yp-intro.rst    | 10 +++----
 .../{ref-classes.rst => classes.rst}          |  4 +--
 ...ol-reference.rst => devtool-reference.rst} |  6 ++---
 documentation/ref-manual/faq.rst              |  2 +-
 .../{ref-features.rst => features.rst}        |  0
 .../ref-manual/{ref-images.rst => images.rst} |  0
 documentation/ref-manual/index.rst            | 26 +++++++++----------
 .../{ref-kickstart.rst => kickstart.rst}      |  0
 documentation/ref-manual/migration-1.5.rst    |  2 +-
 documentation/ref-manual/migration-1.6.rst    |  2 +-
 documentation/ref-manual/migration-1.7.rst    |  4 +--
 documentation/ref-manual/migration-2.1.rst    |  2 +-
 documentation/ref-manual/migration-2.3.rst    |  2 +-
 .../{ref-qa-checks.rst => qa-checks.rst}      |  0
 ...elease-process.rst => release-process.rst} |  2 +-
 .../{ref-structure.rst => structure.rst}      |  2 +-
 ...quirements.rst => system-requirements.rst} |  0
 .../ref-manual/{ref-tasks.rst => tasks.rst}   |  2 +-
 .../ref-manual/{ref-terms.rst => terms.rst}   |  8 +++---
 .../{ref-variables.rst => variables.rst}      | 14 +++++-----
 .../{ref-varlocality.rst => varlocality.rst}  |  0
 documentation/test-manual/intro.rst           |  6 ++---
 27 files changed, 73 insertions(+), 73 deletions(-)
 rename documentation/ref-manual/{ref-classes.rst => classes.rst} (99%)
 rename documentation/ref-manual/{ref-devtool-reference.rst => devtool-reference.rst} (98%)
 rename documentation/ref-manual/{ref-features.rst => features.rst} (100%)
 rename documentation/ref-manual/{ref-images.rst => images.rst} (100%)
 rename documentation/ref-manual/{ref-kickstart.rst => kickstart.rst} (100%)
 rename documentation/ref-manual/{ref-qa-checks.rst => qa-checks.rst} (100%)
 rename documentation/ref-manual/{ref-release-process.rst => release-process.rst} (98%)
 rename documentation/ref-manual/{ref-structure.rst => structure.rst} (99%)
 rename documentation/ref-manual/{ref-system-requirements.rst => system-requirements.rst} (100%)
 rename documentation/ref-manual/{ref-tasks.rst => tasks.rst} (99%)
 rename documentation/ref-manual/{ref-terms.rst => terms.rst} (98%)
 rename documentation/ref-manual/{ref-variables.rst => variables.rst} (99%)
 rename documentation/ref-manual/{ref-varlocality.rst => varlocality.rst} (100%)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 5dc0bc792..f077ee843 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -52,7 +52,7 @@ following requirements:
 -  Runs a supported Linux distribution (i.e. recent releases of Fedora,
    openSUSE, CentOS, Debian, or Ubuntu). For a list of Linux
    distributions that support the Yocto Project, see the
-   :ref:`ref-manual/ref-system-requirements:supported linux distributions`
+   :ref:`ref-manual/system-requirements:supported linux distributions`
    section in the Yocto Project Reference Manual. For detailed
    information on preparing your build host, see the
    :ref:`dev-manual/start:preparing the build host`
@@ -68,7 +68,7 @@ following requirements:
 If your build host does not meet any of these three listed version
 requirements, you can take steps to prepare the system so that you
 can still use the Yocto Project. See the
-:ref:`ref-manual/ref-system-requirements:required git, tar, python and gcc versions`
+:ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`
 section in the Yocto Project Reference Manual for information.
 
 Build Host Packages
@@ -85,7 +85,7 @@ distribution:
 .. note::
 
    For host package requirements on all supported Linux distributions,
-   see the :ref:`ref-manual/ref-system-requirements:required packages for the build host`
+   see the :ref:`ref-manual/system-requirements:required packages for the build host`
    section in the Yocto Project Reference Manual.
 
 Use Git to Clone Poky
@@ -169,7 +169,7 @@ an entire Linux distribution, including the toolchain, from source.
       page of the Yocto Project Wiki.
 
 #. **Initialize the Build Environment:** From within the ``poky``
-   directory, run the :ref:`ref-manual/ref-structure:\`\`oe-init-build-env\`\``
+   directory, run the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\``
    environment
    setup script to define Yocto Project's build environment on your
    build host.
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 48bff35fa..068ab6c80 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -81,7 +81,7 @@ directory of that Layer. This directory is what you add to the
 ``conf/bblayers.conf`` file found in your
 :term:`Build Directory`, which is
 established after you run the OpenEmbedded build environment setup
-script (i.e. :ref:`ref-manual/ref-structure:\`\`oe-init-build-env\`\``).
+script (i.e. :ref:`ref-manual/structure:\`\`oe-init-build-env\`\``).
 Adding the root directory allows the :term:`OpenEmbedded Build System`
 to recognize the BSP
 layer and from it build an image. Here is an example: ::
@@ -229,7 +229,7 @@ section.
 
 #. *Initialize the Build Environment:* While in the root directory of
    the Source Directory (i.e. ``poky``), run the
-   :ref:`ref-manual/ref-structure:\`\`oe-init-build-env\`\`` environment
+   :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment
    setup script to define the OpenEmbedded build environment on your
    build host. ::
 
@@ -826,7 +826,7 @@ workflow.
 
    The build process supports several types of images to satisfy
    different needs. See the
-   ":ref:`ref-manual/ref-images:Images`" chapter in the Yocto
+   ":ref:`ref-manual/images:Images`" chapter in the Yocto
    Project Reference Manual for information on supported images.
 
 Requirements and Recommendations for Released BSPs
@@ -1305,7 +1305,7 @@ the example reference machine configuration file for the BeagleBone
 development boards. Realize that much more can be defined as part of a
 machine's configuration file. In general, you can learn about related
 variables that this example does not have by locating the variables in
-the ":ref:`ref-manual/ref-variables:variables glossary`" in the Yocto
+the ":ref:`ref-manual/variables:variables glossary`" in the Yocto
 Project Reference Manual.
 
 -  :term:`PREFERRED_PROVIDER_virtual/xserver <PREFERRED_PROVIDER>`:
@@ -1360,7 +1360,7 @@ Project Reference Manual.
    `JFFS2 <https://en.wikipedia.org/wiki/JFFS2>`__ image.
 
 -  :term:`WKS_FILE`: The location of
-   the :ref:`Wic kickstart <ref-manual/ref-kickstart:openembedded kickstart (\`\`.wks\`\`) reference>` file used
+   the :ref:`Wic kickstart <ref-manual/kickstart:openembedded kickstart (\`\`.wks\`\`) reference>` file used
    by the OpenEmbedded build system to create a partitioned image
    (image.wic).
 
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 6c4220dd5..ada3bac7e 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -935,7 +935,7 @@ configures the image you are working with to include
 
 .. note::
 
-   See the ":ref:`ref-manual/ref-features:image features`" section in the Yocto
+   See the ":ref:`ref-manual/features:image features`" section in the Yocto
    Project Reference Manual for a complete list of image features that ship
    with the Yocto Project.
 
@@ -1076,7 +1076,7 @@ how to create, write, and test a new recipe.
 
    For information on variables that are useful for recipes and for
    information about recipe naming issues, see the
-   ":ref:`ref-manual/ref-varlocality:recipes`" section of the Yocto Project
+   ":ref:`ref-manual/varlocality:recipes`" section of the Yocto Project
    Reference Manual.
 
 Overview
@@ -1978,7 +1978,7 @@ take. The following list describes the process:
    of common problems that show up during runtime. For information on
    these checks, see the
    :ref:`insane <ref-classes-insane>` class and
-   the ":ref:`ref-manual/ref-qa-checks:qa error and warning messages`"
+   the ":ref:`ref-manual/qa-checks:qa error and warning messages`"
    chapter in the Yocto Project Reference Manual.
 
 -  *Hand-Checking Your Packages*: After you build your software, you
@@ -3127,7 +3127,7 @@ Using ``devtool upgrade``
 
 As mentioned earlier, an alternative method for upgrading recipes to
 newer versions is to use
-:doc:`devtool upgrade </ref-manual/ref-devtool-reference>`.
+:doc:`devtool upgrade </ref-manual/devtool-reference>`.
 You can read about ``devtool upgrade`` in general in the
 ":ref:`sdk-manual/extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
 section in the Yocto Project Application Development and the Extensible
@@ -3714,7 +3714,7 @@ The following figure and list overviews the build process:
    can be the name of a recipe for a specific piece of software such as
    BusyBox. For more details about the images the OpenEmbedded build
    system supports, see the
-   ":ref:`ref-manual/ref-images:Images`" chapter in the Yocto
+   ":ref:`ref-manual/images:Images`" chapter in the Yocto
    Project Reference Manual.
 
    As an example, the following command builds the
@@ -5234,7 +5234,7 @@ particular system.
 .. note::
 
    For a kickstart file reference, see the
-   ":ref:`ref-manual/ref-kickstart:openembedded kickstart (\`\`.wks\`\`) reference`"
+   ":ref:`ref-manual/kickstart:openembedded kickstart (\`\`.wks\`\`) reference`"
    Chapter in the Yocto Project Reference Manual.
 
 The ``wic`` command and the infrastructure it is based on is by
@@ -7418,7 +7418,7 @@ Creating Node Package Manager (NPM) Packages
 manager for the JavaScript programming language. The Yocto Project
 supports the NPM :ref:`fetcher <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`. You can
 use this fetcher in combination with
-:doc:`devtool </ref-manual/ref-devtool-reference>` to create
+:doc:`devtool </ref-manual/devtool-reference>` to create
 recipes that produce NPM packages.
 
 Two workflows exist that allow you to create NPM packages using
@@ -7446,7 +7446,7 @@ NPM packages:
    is NPM's public registry.
 
 -  Be familiar with
-   :doc:`devtool </ref-manual/ref-devtool-reference>`.
+   :doc:`devtool </ref-manual/devtool-reference>`.
 
 -  The NPM host tools need the native ``nodejs-npm`` package, which is
    part of the OpenEmbedded environment. You need to get the package by
@@ -8452,7 +8452,7 @@ you set up the environment to use these tests, run available tests, and
 write and add your own tests.
 
 For information on the test and QA infrastructure available within the
-Yocto Project, see the ":ref:`ref-manual/ref-release-process:testing and quality assurance`"
+Yocto Project, see the ":ref:`ref-manual/release-process:testing and quality assurance`"
 section in the Yocto Project Reference Manual.
 
 Enabling Tests
@@ -9224,7 +9224,7 @@ In addition to variable values, the output of the ``bitbake -e`` and
 -  The output starts with a tree listing all configuration files and
    classes included globally, recursively listing the files they include
    or inherit in turn. Much of the behavior of the OpenEmbedded build
-   system (including the behavior of the :ref:`ref-manual/ref-tasks:normal recipe build tasks`) is
+   system (including the behavior of the :ref:`ref-manual/tasks:normal recipe build tasks`) is
    implemented in the
    :ref:`base <ref-classes-base>` class and the
    classes it inherits, rather than being built into BitBake itself.
@@ -9564,7 +9564,7 @@ compile. BitBake recognizes that the ``do_compile`` task was rerun and
 therefore understands that the other tasks also need to be run again.
 
 Another, shorter way to rerun a task and all
-:ref:`ref-manual/ref-tasks:normal recipe build tasks`
+:ref:`ref-manual/tasks:normal recipe build tasks`
 that depend on it is to use the ``-C`` option.
 
 .. note::
@@ -9998,7 +9998,7 @@ GDB allows you to examine running programs, which in turn helps you to
 understand and fix problems. It also allows you to perform post-mortem
 style analysis of program crashes. GDB is available as a package within
 the Yocto Project and is installed in SDK images by default. See the
-":ref:`ref-manual/ref-images:Images`" chapter in the Yocto
+":ref:`ref-manual/images:Images`" chapter in the Yocto
 Project Reference Manual for a description of these images. You can find
 information on GDB at https://sourceware.org/gdb/.
 
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 6fad4c9b4..03061a79f 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -325,7 +325,7 @@ Project Build Host:
    If your build host does not meet any of these three listed version
    requirements, you can take steps to prepare the system so that you
    can still use the Yocto Project. See the
-   ":ref:`ref-manual/ref-system-requirements:required git, tar, python and gcc versions`"
+   ":ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`"
    section in the Yocto Project Reference Manual for information.
 
 4. *Install Development Host Packages:* Required development host
@@ -334,7 +334,7 @@ Project Build Host:
    is large if you want to be able to cover all cases.
 
    For lists of required packages for all scenarios, see the
-   ":ref:`ref-manual/ref-system-requirements:required packages for the build host`"
+   ":ref:`ref-manual/system-requirements:required packages for the build host`"
    section in the Yocto Project Reference Manual.
 
 Once you have completed the previous steps, you are ready to continue
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 019ead85c..8fbbabbac 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -112,7 +112,7 @@ Class files (``.bbclass``) contain information that is useful to share
 between recipes files. An example is the
 :ref:`autotools <ref-classes-autotools>` class,
 which contains common settings for any application that Autotools uses.
-The ":ref:`ref-manual/ref-classes:Classes`" chapter in the
+The ":ref:`ref-manual/classes:Classes`" chapter in the
 Yocto Project Reference Manual provides details about classes and how to
 use them.
 
@@ -456,7 +456,7 @@ typically find in the distribution layer:
    can be shared among recipes in the distribution. When your recipes
    inherit a class, they take on the settings and functions for that
    class. You can read more about class files in the
-   ":ref:`ref-manual/ref-classes:Classes`" chapter of the Yocto
+   ":ref:`ref-manual/classes:Classes`" chapter of the Yocto
    Reference Manual.
 
 -  *conf:* This area holds configuration files for the layer
@@ -1285,7 +1285,7 @@ this output:
 .. note::
 
    For a list of example images that the Yocto Project provides, see the
-   ":doc:`/ref-manual/ref-images`" chapter in the Yocto Project Reference
+   ":doc:`/ref-manual/images`" chapter in the Yocto Project Reference
    Manual.
 
 The build process writes images out to the :term:`Build Directory`
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index c66b4b5da..66a88c952 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -111,7 +111,7 @@ Project:
    development.
 
 -  *Releases According to a Strict Schedule:* Major releases occur on a
-   :doc:`six-month cycle </ref-manual/ref-release-process>`
+   :doc:`six-month cycle </ref-manual/release-process>`
    predictably in October and April. The most recent two releases
    support point releases to address common vulnerabilities and
    exposures. This predictability is crucial for projects based on the
@@ -676,7 +676,7 @@ these items that make up the Poky repository in the
 
    If you are interested in all the contents of the
    poky
-   Git repository, see the ":ref:`ref-manual/ref-structure:top-level core components`"
+   Git repository, see the ":ref:`ref-manual/structure:top-level core components`"
    section in the Yocto Project Reference Manual.
 
 The following figure illustrates what generally comprises Poky:
@@ -720,7 +720,7 @@ Poky has a regular, well established, six-month release cycle under its
 own version. Major releases occur at the same time major releases (point
 releases) occur for the Yocto Project, which are typically in the Spring
 and Fall. For more information on the Yocto Project release schedule and
-cadence, see the ":doc:`/ref-manual/ref-release-process`" chapter in the
+cadence, see the ":doc:`/ref-manual/release-process`" chapter in the
 Yocto Project Reference Manual.
 
 Much has been said about Poky being a "default configuration". A default
@@ -798,7 +798,7 @@ Some Basic Terms
 
 It helps to understand some basic fundamental terms when learning the
 Yocto Project. Although a list of terms exists in the ":doc:`Yocto Project
-Terms </ref-manual/ref-terms>`" section of the Yocto Project
+Terms </ref-manual/terms>`" section of the Yocto Project
 Reference Manual, this section provides the definitions of some terms
 helpful for getting started:
 
@@ -879,7 +879,7 @@ helpful for getting started:
 
    It is worth noting that the term "package" can, in general, have
    subtle meanings. For example, the packages referred to in the
-   ":ref:`ref-manual/ref-system-requirements:required packages for the build host`"
+   ":ref:`ref-manual/system-requirements:required packages for the build host`"
    section in the Yocto Project Reference Manual are compiled binaries
    that, when installed, add functionality to your Linux distribution.
 
diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/classes.rst
similarity index 99%
rename from documentation/ref-manual/ref-classes.rst
rename to documentation/ref-manual/classes.rst
index 37ab4992e..5a30ce379 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1033,7 +1033,7 @@ You can configure the sanity checks so that specific test failures
 either raise a warning or an error message. Typically, failures for new
 tests generate a warning. Subsequent failures for the same test would
 then generate an error message once the metadata is in a known and good
-condition. See the ":doc:`ref-qa-checks`" Chapter for a list of all the warning
+condition. See the ":doc:`/ref-manual/qa-checks`" Chapter for a list of all the warning
 and error messages you might encounter using a default configuration.
 
 Use the :term:`WARN_QA` and
@@ -1276,7 +1276,7 @@ The following list shows the tests you can list with the ``WARN_QA`` and
 -  ``textrel:`` Checks for ELF binaries that contain relocations in
    their ``.text`` sections, which can result in a performance impact at
    runtime. See the explanation for the ``ELF binary`` message in
-   ":doc:`ref-qa-checks`" for more information regarding runtime performance
+   ":doc:`/ref-manual/qa-checks`" for more information regarding runtime performance
    issues.
 
 -  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
diff --git a/documentation/ref-manual/ref-devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
similarity index 98%
rename from documentation/ref-manual/ref-devtool-reference.rst
rename to documentation/ref-manual/devtool-reference.rst
index 2b97bb460..cc5848fd4 100644
--- a/documentation/ref-manual/ref-devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -193,7 +193,7 @@ external source tree.
    run your application. If dependent packages (e.g. libraries) do not
    exist on the target, your application, when run, will fail to find
    those functions. For more information, see the
-   ":ref:`ref-manual/ref-devtool-reference:deploying your software on the target machine`"
+   ":ref:`ref-manual/devtool-reference:deploying your software on the target machine`"
    section.
 
 By default, ``devtool add`` uses the latest revision (i.e. master) when
@@ -561,7 +561,7 @@ Removing Your Software from the Target Machine
 Use the ``devtool undeploy-target`` command to remove deployed build
 output from the target machine. For the ``devtool undeploy-target``
 command to work, you must have previously used the
-":ref:`devtool deploy-target <ref-manual/ref-devtool-reference:deploying your software on the target machine>`"
+":ref:`devtool deploy-target <ref-manual/devtool-reference:deploying your software on the target machine>`"
 command.
 ::
 
@@ -609,7 +609,7 @@ The ``devtool status`` command has no command-line options:
    $ devtool status
 
 Following is sample output after using
-:ref:`devtool add <ref-manual/ref-devtool-reference:adding a new recipe to the workspace layer>`
+:ref:`devtool add <ref-manual/devtool-reference:adding a new recipe to the workspace layer>`
 to create and add the ``mtr_0.86.bb`` recipe to the ``workspace`` directory:
 ::
 
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index cc6b3aee1..f67c53824 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -22,7 +22,7 @@ Can I still use the Yocto Project?
 **A:** You can get the required tools on your host development system a
 couple different ways (i.e. building a tarball or downloading a
 tarball). See the
-":ref:`ref-manual/ref-system-requirements:required git, tar, python and gcc versions`"
+":ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`"
 section for steps on how to update your build tools.
 
 **Q:** How can you claim Poky / OpenEmbedded-Core is stable?
diff --git a/documentation/ref-manual/ref-features.rst b/documentation/ref-manual/features.rst
similarity index 100%
rename from documentation/ref-manual/ref-features.rst
rename to documentation/ref-manual/features.rst
diff --git a/documentation/ref-manual/ref-images.rst b/documentation/ref-manual/images.rst
similarity index 100%
rename from documentation/ref-manual/ref-images.rst
rename to documentation/ref-manual/images.rst
diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manual/index.rst
index 033f4ba28..deb0383cf 100644
--- a/documentation/ref-manual/index.rst
+++ b/documentation/ref-manual/index.rst
@@ -10,20 +10,20 @@ Yocto Project Reference Manual
    :caption: Table of Contents
    :numbered:
 
-   ref-system-requirements
-   ref-terms
-   ref-release-process
+   system-requirements
+   terms
+   release-process
    migration
-   ref-structure
-   ref-classes
-   ref-tasks
-   ref-devtool-reference
-   ref-kickstart
-   ref-qa-checks
-   ref-images
-   ref-features
-   ref-variables
-   ref-varlocality
+   structure
+   classes
+   tasks
+   devtool-reference
+   kickstart
+   qa-checks
+   images
+   features
+   variables
+   varlocality
    faq
    resources
    history
diff --git a/documentation/ref-manual/ref-kickstart.rst b/documentation/ref-manual/kickstart.rst
similarity index 100%
rename from documentation/ref-manual/ref-kickstart.rst
rename to documentation/ref-manual/kickstart.rst
diff --git a/documentation/ref-manual/migration-1.5.rst b/documentation/ref-manual/migration-1.5.rst
index b5e4bb1fd..2716bc9cf 100644
--- a/documentation/ref-manual/migration-1.5.rst
+++ b/documentation/ref-manual/migration-1.5.rst
@@ -26,7 +26,7 @@ provide packages for these, you can install and use the Buildtools
 tarball, which provides an SDK-like environment containing them.
 
 For more information on this requirement, see the
-":ref:`ref-manual/ref-system-requirements:required git, tar, python and gcc versions`"
+":ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`"
 section.
 
 .. _migration-1.5-atom-pc-bsp:
diff --git a/documentation/ref-manual/migration-1.6.rst b/documentation/ref-manual/migration-1.6.rst
index f95f45ec9..ed155d0df 100644
--- a/documentation/ref-manual/migration-1.6.rst
+++ b/documentation/ref-manual/migration-1.6.rst
@@ -126,7 +126,7 @@ Changes to Variables
 --------------------
 
 The following variables have changed. For information on the
-OpenEmbedded build system variables, see the ":doc:`ref-variables`" Chapter.
+OpenEmbedded build system variables, see the ":doc:`/ref-manual/variables`" Chapter.
 
 .. _migration-1.6-variable-changes-TMPDIR:
 
diff --git a/documentation/ref-manual/migration-1.7.rst b/documentation/ref-manual/migration-1.7.rst
index 177d40900..19275b3cd 100644
--- a/documentation/ref-manual/migration-1.7.rst
+++ b/documentation/ref-manual/migration-1.7.rst
@@ -32,7 +32,7 @@ build host is now 1.7.8 because the ``--list`` option is now required by
 BitBake's Git fetcher. As always, if your host distribution does not
 provide a version of Git that meets this requirement, you can use the
 ``buildtools-tarball`` that does. See the
-":ref:`ref-manual/ref-system-requirements:required git, tar, python and gcc versions`"
+":ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`"
 section for more information.
 
 .. _migration-1.7-autotools-class-changes:
@@ -157,7 +157,7 @@ The following changes have occurred to the QA check process:
    added in order to verify that file dependencies are satisfied (e.g.
    package contains a script requiring ``/bin/bash``) and build-time
    dependencies are declared, respectively. For more information, please
-   see the ":doc:`ref-qa-checks`" chapter.
+   see the ":doc:`/ref-manual/qa-checks`" chapter.
 
 -  Package QA checks are now performed during a new
    :ref:`ref-tasks-package_qa` task rather than being
diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
index a1d7b9a2d..e8b3ada26 100644
--- a/documentation/ref-manual/migration-2.1.rst
+++ b/documentation/ref-manual/migration-2.1.rst
@@ -360,7 +360,7 @@ These additional changes exist:
 -  The minimum Git version has been increased to 1.8.3.1. If your host
    distribution does not provide a sufficiently recent version, you can
    install the buildtools, which will provide it. See the
-   :ref:`ref-manual/ref-system-requirements:required git, tar, python and gcc versions`
+   :ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`
    section for more information on the buildtools tarball.
 
 -  The buggy and incomplete support for the RPM version 4 package
diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
index 6984ff91e..3e9758119 100644
--- a/documentation/ref-manual/migration-2.3.rst
+++ b/documentation/ref-manual/migration-2.3.rst
@@ -404,7 +404,7 @@ The following QA checks have changed:
 
    For additional information, see the
    :ref:`insane <ref-classes-insane>` class and the
-   ":ref:`ref-manual/ref-qa-checks:errors and warnings`" section.
+   ":ref:`ref-manual/qa-checks:errors and warnings`" section.
 
 .. _migration-2.3-miscellaneous-changes:
 
diff --git a/documentation/ref-manual/ref-qa-checks.rst b/documentation/ref-manual/qa-checks.rst
similarity index 100%
rename from documentation/ref-manual/ref-qa-checks.rst
rename to documentation/ref-manual/qa-checks.rst
diff --git a/documentation/ref-manual/ref-release-process.rst b/documentation/ref-manual/release-process.rst
similarity index 98%
rename from documentation/ref-manual/ref-release-process.rst
rename to documentation/ref-manual/release-process.rst
index 20be09a4f..d8d362282 100644
--- a/documentation/ref-manual/ref-release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -146,7 +146,7 @@ consists of the following pieces:
    .. note::
 
       Running ``oe-selftest`` requires host packages beyond the "Essential"
-      grouping. See the :ref:`ref-manual/ref-system-requirements:required packages for the build host`
+      grouping. See the :ref:`ref-manual/system-requirements:required packages for the build host`
       section for more information.
 
 Originally, much of this testing was done manually. However, significant
diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/structure.rst
similarity index 99%
rename from documentation/ref-manual/ref-structure.rst
rename to documentation/ref-manual/structure.rst
index ab9075b9c..ad3f4ab44 100644
--- a/documentation/ref-manual/ref-structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -682,7 +682,7 @@ generation or packaging also have their specific class files such as
 ``image.bbclass``, ``rootfs_*.bbclass`` and ``package*.bbclass``.
 
 For reference information on classes, see the
-":ref:`ref-manual/ref-classes:Classes`" chapter.
+":ref:`ref-manual/classes:Classes`" chapter.
 
 .. _structure-meta-conf:
 
diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/system-requirements.rst
similarity index 100%
rename from documentation/ref-manual/ref-system-requirements.rst
rename to documentation/ref-manual/system-requirements.rst
diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/tasks.rst
similarity index 99%
rename from documentation/ref-manual/ref-tasks.rst
rename to documentation/ref-manual/tasks.rst
index 8b9e0c2d8..9fe1c296a 100644
--- a/documentation/ref-manual/ref-tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -461,7 +461,7 @@ devtool commands:
    $ devtool latest-version
    $ devtool check-upgrade-status
 
-See the ":ref:`ref-manual/ref-devtool-reference:\`\`devtool\`\` quick reference`"
+See the ":ref:`ref-manual/devtool-reference:\`\`devtool\`\` quick reference`"
 chapter for more information on
 ``devtool``. See the ":ref:`devtool-checking-on-the-upgrade-status-of-a-recipe`"
 section for information on checking the upgrade status of a recipe.
diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/terms.rst
similarity index 98%
rename from documentation/ref-manual/ref-terms.rst
rename to documentation/ref-manual/terms.rst
index f41073602..c07dd4b12 100644
--- a/documentation/ref-manual/ref-terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -64,7 +64,7 @@ universal, the list includes them just in case:
       This term refers to the area used by the OpenEmbedded build system for
       builds. The area is created when you ``source`` the setup environment
       script that is found in the Source Directory
-      (i.e. :ref:`ref-manual/ref-structure:\`\`oe-init-build-env\`\``). The
+      (i.e. :ref:`ref-manual/structure:\`\`oe-init-build-env\`\``). The
       :term:`TOPDIR` variable points to the Build Directory.
 
       You have a lot of flexibility when creating the Build Directory.
@@ -117,7 +117,7 @@ universal, the list includes them just in case:
       Files that provide for logic encapsulation and inheritance so that
       commonly used patterns can be defined once and then easily used in
       multiple recipes. For reference information on the Yocto Project classes,
-      see the ":ref:`ref-manual/ref-classes:Classes`" chapter. Class files end with the
+      see the ":ref:`ref-manual/classes:Classes`" chapter. Class files end with the
       ``.bbclass`` filename extension.
 
    :term:`Configuration File`
@@ -177,7 +177,7 @@ universal, the list includes them just in case:
       recipes and related Metadata. Images are the binary output that run on
       specific hardware or QEMU and are used for specific use-cases. For a list
       of the supported image types that the Yocto Project provides, see the
-      ":ref:`ref-manual/ref-images:Images`" chapter.
+      ":ref:`ref-manual/images:Images`" chapter.
 
    :term:`Layer`
       A collection of related recipes. Layers allow you to consolidate related
@@ -252,7 +252,7 @@ universal, the list includes them just in case:
 
       It is worth noting that the term "package" can, in general, have
       subtle meanings. For example, the packages referred to in the
-      ":ref:`ref-manual/ref-system-requirements:required packages for the build host`"
+      ":ref:`ref-manual/system-requirements:required packages for the build host`"
       section are compiled binaries that, when installed, add functionality to
       your Linux distribution.
 
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/variables.rst
similarity index 99%
rename from documentation/ref-manual/ref-variables.rst
rename to documentation/ref-manual/variables.rst
index 865d17c1f..8c6cc46b6 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1670,7 +1670,7 @@ system and gives an overview of their function and contents.
       ``${TMPDIR}/deploy``.
 
       For more information on the structure of the Build Directory, see
-      ":ref:`ref-manual/ref-structure:the build directory - \`\`build/\`\``" section.
+      ":ref:`ref-manual/structure:the build directory - \`\`build/\`\``" section.
       For more detail on the contents of the ``deploy`` directory, see the
       ":ref:`overview-manual/concepts:images`",
       ":ref:`overview-manual/concepts:package feeds`", and
@@ -1708,7 +1708,7 @@ system and gives an overview of their function and contents.
       ``${DEPLOY_DIR}/images/${MACHINE}/``.
 
       For more information on the structure of the Build Directory, see
-      ":ref:`ref-manual/ref-structure:the build directory - \`\`build/\`\``" section.
+      ":ref:`ref-manual/structure:the build directory - \`\`build/\`\``" section.
       For more detail on the contents of the ``deploy`` directory, see the
       ":ref:`overview-manual/concepts:images`" and
       ":ref:`overview-manual/concepts:application development sdk`" sections both in
@@ -2907,7 +2907,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
       section of the Yocto Project Development Tasks Manual. Reference
       material for Wic is located in the
-      ":doc:`/ref-manual/ref-kickstart`" chapter.
+      ":doc:`/ref-manual/kickstart`" chapter.
 
    :term:`IMAGE_BOOT_FILES`
       A space-separated list of files installed into the boot partition
@@ -2943,7 +2943,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
       section of the Yocto Project Development Tasks Manual. Reference
       material for Wic is located in the
-      ":doc:`/ref-manual/ref-kickstart`" chapter.
+      ":doc:`/ref-manual/kickstart`" chapter.
 
    :term:`IMAGE_CLASSES`
       A list of classes that all images should inherit. You typically use
@@ -3051,7 +3051,7 @@ system and gives an overview of their function and contents.
       .. note::
 
          -  When working with a
-            :ref:`core-image-minimal-initramfs <ref-manual/ref-images:images>`
+            :ref:`core-image-minimal-initramfs <ref-manual/images:images>`
             image, do not use the ``IMAGE_INSTALL`` variable to specify
             packages for installation. Instead, use the
             :term:`PACKAGE_INSTALL` variable, which
@@ -5240,7 +5240,7 @@ system and gives an overview of their function and contents.
       general, you should use the
       :term:`IMAGE_INSTALL` variable to specify
       packages for installation. The exception to this is when working with
-      the :ref:`core-image-minimal-initramfs <ref-manual/ref-images:images>`
+      the :ref:`core-image-minimal-initramfs <ref-manual/images:images>`
       image. When working with an initial RAM filesystem (initramfs) image,
       use the ``PACKAGE_INSTALL`` variable. For information on creating an
       initramfs, see the ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`" section
@@ -8737,7 +8737,7 @@ system and gives an overview of their function and contents.
       image, see the
       ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
       section in the Yocto Project Development Tasks Manual. For details on
-      the kickstart file format, see the ":doc:`/ref-manual/ref-kickstart`" Chapter.
+      the kickstart file format, see the ":doc:`/ref-manual/kickstart`" Chapter.
 
    :term:`WKS_FILE_DEPENDS`
       When placed in the recipe that builds your image, this variable lists
diff --git a/documentation/ref-manual/ref-varlocality.rst b/documentation/ref-manual/varlocality.rst
similarity index 100%
rename from documentation/ref-manual/ref-varlocality.rst
rename to documentation/ref-manual/varlocality.rst
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 3dc64bcd4..81c24a8c3 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -124,7 +124,7 @@ thefollowing types of tests:
    The tests utilize the ``testsdkext`` class and the ``do_testsdkext`` task.
 
 -  *Feature Testing:* Various scenario-based tests are run through the
-   :ref:`OpenEmbedded Self test (oe-selftest) <ref-manual/ref-release-process:Testing and Quality Assurance>`. We test oe-selftest on each of the main distrubutions
+   :ref:`OpenEmbedded Self test (oe-selftest) <ref-manual/release-process:Testing and Quality Assurance>`. We test oe-selftest on each of the main distrubutions
    we support.
 
 -  *Image Testing:* Image tests initiated through the following command::
@@ -155,8 +155,8 @@ thefollowing types of tests:
    the ``do_testsdk`` task.
 
 -  *Unit Testing:* Unit tests on various components of the system run
-   through :ref:`bitbake-selftest <ref-manual/ref-release-process:Testing and Quality Assurance>` and
-   :ref:`oe-selftest <ref-manual/ref-release-process:Testing and Quality Assurance>`.
+   through :ref:`bitbake-selftest <ref-manual/release-process:Testing and Quality Assurance>` and
+   :ref:`oe-selftest <ref-manual/release-process:Testing and Quality Assurance>`.
 
 -  *Automatic Upgrade Helper:* This target tests whether new versions of
    software are available and whether we can automatically upgrade to
-- 
2.29.2


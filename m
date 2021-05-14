Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.6089.1620981350636476797
 for <docs@lists.yoctoproject.org>;
 Fri, 14 May 2021 01:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from localhost (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 371E4100002;
	Fri, 14 May 2021 08:35:49 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 5/6] overview-manual: simplify style and add missings references
Date: Fri, 14 May 2021 10:35:26 +0200
Message-Id: <20210514083527.281767-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
References: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst    | 73 +++++++++----------
 .../development-environment.rst               | 12 +--
 documentation/overview-manual/yp-intro.rst    | 14 ++--
 3 files changed, 46 insertions(+), 53 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 2e3f1af442..e5bdcdad2a 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -139,7 +139,7 @@ hardware-specific configurations allows you to share other metadata by
 using a different layer where that metadata might be common across
 several pieces of hardware.
 
-Many layers exist that work in the Yocto Project development environment. The
+There are many layers working in the Yocto Project development environment. The
 :yocto_home:`Yocto Project Curated Layer Index </software-overview/layers/>`
 and :oe_layerindex:`OpenEmbedded Layer Index <>` both contain layers from
 which you can use or leverage.
@@ -370,7 +370,7 @@ BitBake's global behavior. This section takes a closer look at the
 layers the build system uses to further control the build. These layers
 provide Metadata for the software, machine, and policies.
 
-In general, three types of layer input exists. You can see them below
+In general, there are three types of layer input. You can see them below
 the "User Configuration" box in the `general workflow
 figure <overview-manual/concepts:openembedded build system concepts>`:
 
@@ -427,8 +427,8 @@ Repositories <>` also shows layers categorized under "Yocto Metadata Layers."
 
 .. note::
 
-   Layers exist in the Yocto Project Source Repositories that cannot be
-   found in the OpenEmbedded Layer Index. These layers are either
+   There are layers in the Yocto Project Source Repositories that cannot be
+   found in the OpenEmbedded Layer Index. Such layers are either
    deprecated or experimental in nature.
 
 BitBake uses the ``conf/bblayers.conf`` file, which is part of the user
@@ -489,7 +489,7 @@ the machine (``conf/machine/machine.conf``) and, of course, the layer
 
 The remainder of the layer is dedicated to specific recipes by function:
 ``recipes-bsp``, ``recipes-core``, ``recipes-graphics``,
-``recipes-kernel``, and so forth. Metadata can exist for multiple
+``recipes-kernel``, and so forth. There can be metadata for multiple
 formfactors, graphics support systems, and so forth.
 
 .. note::
@@ -528,9 +528,7 @@ project that is more dynamic or experimental in nature, a project might
 keep source files in a repository controlled by a Source Control Manager
 (SCM) such as Git. Pulling source from a repository allows you to
 control the point in the repository (the revision) from which you want
-to build software. Finally, a combination of the two might exist, which
-would give the consumer a choice when deciding where to get source
-files.
+to build software. A combination of the two is also possible.
 
 BitBake uses the :term:`SRC_URI`
 variable to point to source files regardless of their location. Each
@@ -609,7 +607,7 @@ the specific revision from which to build.
 Source Mirror(s)
 ~~~~~~~~~~~~~~~~
 
-Two kinds of mirrors exist: pre-mirrors and regular mirrors. The
+There are two kinds of mirrors: pre-mirrors and regular mirrors. The
 :term:`PREMIRRORS` and
 :term:`MIRRORS` variables point to
 these, respectively. BitBake checks pre-mirrors before looking upstream
@@ -667,8 +665,8 @@ package files are kept:
    variables are used, respectively.
 
 -  :term:`PACKAGE_ARCH`: Defines
-   architecture-specific sub-folders. For example, packages could exist
-   for the i586 or qemux86 architectures.
+   architecture-specific sub-folders. For example, packages could be
+   available for the i586 or qemux86 architectures.
 
 BitBake uses the
 :ref:`do_package_write_* <ref-tasks-package_write_deb>`
@@ -681,8 +679,8 @@ and
 ":ref:`ref-tasks-package_write_tar`"
 sections in the Yocto Project Reference Manual for additional
 information. As an example, consider a scenario where an IPK packaging
-manager is being used and package architecture support for both i586 and
-qemux86 exist. Packages for the i586 architecture are placed in
+manager is being used and there is package architecture support for both
+i586 and qemux86. Packages for the i586 architecture are placed in
 ``build/tmp/deploy/ipk/i586``, while packages for the qemux86
 architecture are placed in ``build/tmp/deploy/ipk/qemux86``.
 
@@ -698,7 +696,7 @@ closer look at each of those areas.
 
 .. note::
 
-   Separate documentation exists for the BitBake tool. See the
+   Documentation for the BitBake tool is available separately. See the
    BitBake User Manual
    for reference material on BitBake.
 
@@ -783,12 +781,10 @@ Build Directory's hierarchy:
 
 .. note::
 
-   In the previous figure, notice that two sample hierarchies exist: one
-   based on package architecture (i.e.
-   PACKAGE_ARCH
-   ) and one based on a machine (i.e.
-   MACHINE
-   ). The underlying structures are identical. The differentiator being
+   In the previous figure, notice that there are two sample hierarchies:
+   one based on package architecture (i.e. :term:`PACKAGE_ARCH`)
+   and one based on a machine (i.e. :term:`MACHINE`).
+   The underlying structures are identical. The differentiator being
    what the OpenEmbedded build system is using as a build target (e.g.
    general architecture, a build host, an SDK, or a specific machine).
 
@@ -963,8 +959,7 @@ that part of the build process.
 
 .. note::
 
-   Support for creating feeds directly from the
-   deploy/\*
+   Support for creating feeds directly from the ``deploy/*``
    directories does not exist. Creating such feeds usually requires some
    kind of feed maintenance mechanism that would upload the new packages
    into an official package feed (e.g. the Ångström distribution). This
@@ -1156,9 +1151,9 @@ checksum <overview-manual/concepts:checksums (signatures)>`.
    OpenEmbedded.
 
 To determine if a task needs to be rerun, BitBake checks if a stamp file
-with a matching input checksum exists for the task. If such a stamp file
-exists, the task's output is assumed to exist and still be valid. If the
-file does not exist, the task is rerun.
+with a matching input checksum exists for the task. In this case,
+the task's output is assumed to exist and still be valid. Otherwise,
+the task is rerun.
 
 .. note::
 
@@ -1234,14 +1229,14 @@ to run any of the ``do_fetch``, ``do_unpack``, ``do_patch``,
 
 It becomes more complicated if everything can come from an sstate cache
 because some objects are simply not required at all. For example, you do
-not need a compiler or native tools, such as quilt, if nothing exists to
-compile or patch. If the ``do_package_write_*`` packages are available
+not need a compiler or native tools, such as quilt, if there isn't anything
+to compile or patch. If the ``do_package_write_*`` packages are available
 from sstate, BitBake does not need the ``do_package`` task data.
 
 To handle all these complexities, BitBake runs in two phases. The first
 is the "setscene" stage. During this stage, BitBake first checks the
 sstate cache for any targets it is planning to build. BitBake does a
-fast check to see if the object exists rather than a complete download.
+fast check to see if the object exists rather than doing a complete download.
 If nothing exists, the second phase, which is the setscene stage,
 completes and the main build proceeds.
 
@@ -1366,9 +1361,9 @@ can initialize the environment before using the tools.
 
 All the output files for an SDK are written to the ``deploy/sdk`` folder
 inside the :term:`Build Directory` as
-shown in the previous figure. Depending on the type of SDK, several
-variables exist that help configure these files. The following list
-shows the variables associated with an extensible SDK:
+shown in the previous figure. Depending on the type of SDK, there are
+several variables to configure these files. Here are the variables
+associated with an extensible SDK:
 
 -  :term:`DEPLOY_DIR`: Points to
    the ``deploy`` directory.
@@ -1577,8 +1572,8 @@ Shared State Cache
 By design, the OpenEmbedded build system builds everything from scratch
 unless :term:`BitBake` can determine
 that parts do not need to be rebuilt. Fundamentally, building from
-scratch is attractive as it means all parts are built fresh and no
-possibility of stale data exists that can cause problems. When
+scratch is attractive as it means all parts are built fresh and there is
+no possibility of stale data that can cause problems. When
 developers hit problems, they typically default back to building from
 scratch so they have a know state from the start.
 
@@ -1617,7 +1612,7 @@ them if they are deemed to be valid.
 
    -  The build system does not maintain
       :term:`PR` information as part of
-      the shared state packages. Consequently, considerations exist that
+      the shared state packages. Consequently, there are considerations that
       affect maintaining shared state feeds. For information on how the
       build system works with packages and can track incrementing ``PR``
       information, see the ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
@@ -1687,7 +1682,7 @@ used to prune the "run" scripts down to the minimum set, thereby
 alleviating this problem and making the "run" scripts much more readable
 as a bonus.
 
-So far, solutions for shell scripts exist. What about Python tasks? The
+So far, there are solutions for shell scripts. What about Python tasks? The
 same approach applies even though these tasks are more difficult. The
 process needs to figure out what variables a Python function accesses
 and what functions it calls. Again, the incremental build solution
@@ -1695,7 +1690,7 @@ contains code that first figures out the variable and function
 dependencies, and then creates a checksum for the data used as the input
 to the task.
 
-Like the ``WORKDIR`` case, situations exist where dependencies should be
+Like the ``WORKDIR`` case, there can be situations where dependencies should be
 ignored. For these situations, you can instruct the build process to
 ignore a dependency by using a line like the following::
 
@@ -1732,7 +1727,7 @@ to add is a policy decision. However, the effect is to generate a master
 checksum that combines the basehash and the hashes of the task's
 dependencies.
 
-At the code level, a variety of ways exist by which both the basehash
+At the code level, there are multiple ways by which both the basehash
 and the dependent task hashes can be influenced. Within the BitBake
 configuration file, you can give BitBake some extra information to help
 it construct the basehash. The following statement effectively results
@@ -1961,8 +1956,8 @@ Automatically Added Runtime Dependencies
 The OpenEmbedded build system automatically adds common types of runtime
 dependencies between packages, which means that you do not need to
 explicitly declare the packages using
-:term:`RDEPENDS`. Three automatic
-mechanisms exist (``shlibdeps``, ``pcdeps``, and ``depchains``) that
+:term:`RDEPENDS`. There are three automatic
+mechanisms (``shlibdeps``, ``pcdeps``, and ``depchains``) that
 handle shared libraries, package configuration (pkg-config) modules, and
 ``-dev`` and ``-dbg`` packages, respectively. For other types of runtime
 dependencies, you must manually declare the dependencies.
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 1decf01e43..ab155dc3b0 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -71,7 +71,7 @@ section in
 the Yocto Project Development Tasks Manual.
 
 If your development host is going to be a system that runs a Linux
-distribution, steps still exist that you must take to prepare the system
+distribution, you must still take steps to prepare the system
 for use with the Yocto Project. You need to be sure that the Linux
 distribution on the system is one that supports the Yocto Project. You
 also need to be sure that the correct set of host packages are installed
@@ -80,8 +80,8 @@ set up a development host that runs Linux, see the
 ":ref:`dev-manual/start:setting up a native linux host`"
 section in the Yocto Project Development Tasks Manual.
 
-Once your development host is set up to use the Yocto Project, several
-methods exist for you to do work in the Yocto Project environment:
+Once your development host is set up to use the Yocto Project, there
+are several ways of working in the Yocto Project environment:
 
 -  *Command Lines, BitBake, and Shells:* Traditional development in the
    Yocto Project involves using the :term:`OpenEmbedded Build System`,
@@ -271,7 +271,7 @@ files that are being worked on simultaneously by more than one person.
 All this work is done locally on the development host before anything is
 pushed to a "contrib" area and examined at the maintainer's level.
 
-A somewhat formal method exists by which developers commit changes and
+There is a somewhat formal method by which developers commit changes and
 push them into the "contrib" area and subsequently request that the
 maintainer include them into an upstream branch. This process is called
 "submitting a patch" or "submitting a change." For information on
@@ -279,9 +279,9 @@ submitting patches and changes, see the
 ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
 section in the Yocto Project Development Tasks Manual.
 
-In summary, a single point of entry exists for changes into a "master"
+In summary, there is a single point of entry for changes into a "master"
 or development branch of the Git repository, which is controlled by the
-project's maintainer. And, a set of developers exist who independently
+project's maintainer. A set of developers independently
 develop, test, and submit changes to "contrib" areas for the maintainer
 to examine. The maintainer then chooses which changes are going to
 become a permanent part of the project.
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 7a01828c5f..28ed07994a 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -140,8 +140,7 @@ Here are challenges you might encounter when developing using the Yocto Project:
 
 -  *Steep Learning Curve:* The Yocto Project has a steep learning curve
    and has many different ways to accomplish similar tasks. It can be
-   difficult to choose how to proceed when varying methods exist by
-   which to accomplish a given task.
+   difficult to choose between such ways.
 
 -  *Understanding What Changes You Need to Make For Your Design Requires
    Some Research:* Beyond the simple tutorial stage, understanding what
@@ -156,7 +155,7 @@ Here are challenges you might encounter when developing using the Yocto Project:
    workflow <overview-manual/development-environment:the yocto project development environment>`
    could be confusing if you are used to traditional desktop and server
    software development.
-   In a desktop development environment, mechanisms exist to easily pull
+   In a desktop development environment, there are mechanisms to easily pull
    and install new packages, which are typically pre-compiled binaries
    from servers accessible over the Internet. Using the Yocto Project,
    you must modify your configuration and rebuild to add additional
@@ -430,8 +429,8 @@ Yocto Project:
    require system administrator privileges. For example, file ownership
    or permissions might need to be defined. Pseudo is a tool that you
    can either use directly or through the environment variable
-   ``LD_PRELOAD``. Either method allows these operations to succeed as
-   if system administrator privileges exist even when they do not.
+   ``LD_PRELOAD``. Either method allows these operations to succeed
+   even without system administrator privileges.
 
    Thanks to Pseudo, the Yocto Project never needs root privileges to
    build images for your target system.
@@ -579,8 +578,7 @@ software.
 This section provides an introduction to the choices or development
 methods you have when setting up your Build Host. Depending on your
 particular workflow preference and the type of operating system your
-Build Host runs, several choices exist that allow you to use the Yocto
-Project.
+Build Host runs, you have several choices.
 
 .. note::
 
@@ -790,7 +788,7 @@ Some Basic Terms
 ================
 
 It helps to understand some basic fundamental terms when learning the
-Yocto Project. Although a list of terms exists in the ":doc:`Yocto Project
+Yocto Project. Although there is a list of terms in the ":doc:`Yocto Project
 Terms </ref-manual/terms>`" section of the Yocto Project
 Reference Manual, this section provides the definitions of some terms
 helpful for getting started:
-- 
2.25.1


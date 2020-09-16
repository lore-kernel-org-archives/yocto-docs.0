Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.3959.1600300775211260157
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 5ECAB60007;
	Wed, 16 Sep 2020 23:59:33 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 09/16] sphinx: replace special quotes with single and double quotes
Date: Thu, 17 Sep 2020 01:58:59 +0200
Message-Id: <20200916235906.243174-9-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/adt-manual/adt-prepare.rst      |  4 ++--
 documentation/adt-manual/adt-prepare.xml      |  4 ++--
 .../dev-manual/dev-manual-common-tasks.rst    |  6 +++---
 .../dev-manual/dev-manual-common-tasks.xml    |  6 +++---
 documentation/dev-manual/dev-manual-qemu.rst  |  8 ++++----
 documentation/dev-manual/dev-manual-qemu.xml  |  8 ++++----
 .../kernel-dev/kernel-dev-concepts-appx.rst   |  2 +-
 .../kernel-dev/kernel-dev-concepts-appx.xml   |  2 +-
 ...verview-manual-development-environment.rst | 12 +++++------
 ...verview-manual-development-environment.xml | 12 +++++------
 .../overview-manual-yp-intro.rst              | 12 +++++------
 .../overview-manual-yp-intro.xml              | 12 +++++------
 documentation/ref-manual/faq.rst              |  2 +-
 documentation/ref-manual/faq.xml              |  2 +-
 documentation/ref-manual/ref-images.rst       |  4 ++--
 documentation/ref-manual/ref-images.xml       |  4 ++--
 documentation/ref-manual/ref-terms.rst        |  2 +-
 documentation/ref-manual/ref-terms.xml        |  2 +-
 .../test-manual/test-manual-intro.rst         |  6 +++---
 .../test-manual/test-manual-intro.xml         |  6 +++---
 .../test-manual-understand-autobuilder.rst    | 20 +++++++++----------
 .../test-manual-understand-autobuilder.xml    | 16 +++++++--------
 .../toaster-manual-setup-and-use.rst          | 12 +++++------
 .../toaster-manual-setup-and-use.xml          | 12 +++++------
 .../transitioning-to-a-custom-environment.rst | 18 ++++++++---------
 documentation/what-i-wish-id-known.rst        | 18 ++++++++---------
 26 files changed, 106 insertions(+), 106 deletions(-)

diff --git a/documentation/adt-manual/adt-prepare.rst b/documentation/adt-manual/adt-prepare.rst
index e2141f805..9b6bd0514 100644
--- a/documentation/adt-manual/adt-prepare.rst
+++ b/documentation/adt-manual/adt-prepare.rst
@@ -189,7 +189,7 @@ the location for cross-toolchain installation. The default location is
 ``/opt/poky/``\ release. After either accepting the default location or
 selecting your own location, you are prompted to run the installation
 script interactively or in silent mode. If you want to closely monitor
-the installation, choose “I” for interactive mode rather than “S” for
+the installation, choose "I" for interactive mode rather than "S" for
 silent mode. Follow the prompts from the script to complete the
 installation.
 
@@ -594,7 +594,7 @@ For this scenario, you need to do several things:
 -  Install the appropriate stand-alone toolchain tarball.
 
 -  Download the pre-built image that will boot with QEMU. You need to be
-   sure to get the QEMU image that matches your target machine’s
+   sure to get the QEMU image that matches your target machine's
    architecture (e.g. x86, ARM, etc.).
 
 -  Download the filesystem image for your target machine's architecture.
diff --git a/documentation/adt-manual/adt-prepare.xml b/documentation/adt-manual/adt-prepare.xml
index 684eb75c5..2dc984325 100644
--- a/documentation/adt-manual/adt-prepare.xml
+++ b/documentation/adt-manual/adt-prepare.xml
@@ -232,7 +232,7 @@
                 own location, you are prompted to run the installation script
                 interactively or in silent mode.
                 If you want to closely monitor the installation,
-                choose “I” for interactive mode rather than “S” for silent mode.
+                choose "I" for interactive mode rather than "S" for silent mode.
                 Follow the prompts from the script to complete the installation.
             </para>
 
@@ -765,7 +765,7 @@
         <itemizedlist>
             <listitem><para>Install the appropriate stand-alone toolchain tarball.</para></listitem>
             <listitem><para>Download the pre-built image that will boot with QEMU.
-                You need to be sure to get the QEMU image that matches your target machine’s
+                You need to be sure to get the QEMU image that matches your target machine's
                 architecture (e.g. x86, ARM, etc.).</para></listitem>
             <listitem><para>Download the filesystem image for your target machine's architecture.
                 </para></listitem>
diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index d3baa2516..5eb7c5164 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -6111,7 +6111,7 @@ the existing kernel, and then inserts a new kernel:
 
       If you see the following error, you need to update or create a
       ~/.mtoolsrc
-      file and be sure to have the line “mtools_skip_check=1“ in the
+      file and be sure to have the line "mtools_skip_check=1" in the
       file. Then, run the Wic command again:
       ::
 
@@ -7157,7 +7157,7 @@ variable to specify the format:
 2. Select the desired package format as follows:
    ::
 
-      PACKAGE_CLASSES ?= “package_packageformat”
+      PACKAGE_CLASSES ?= "package_packageformat"
 
    where packageformat can be "ipk", "rpm",
    "deb", or "tar" which are the supported package formats.
@@ -10372,7 +10372,7 @@ debugger.
    an image recipe:
    ::
 
-      IMAGE_INSTALL_append = “ gdbserver"
+      IMAGE_INSTALL_append = " gdbserver"
 
    The change makes
    sure the ``gdbserver`` package is included.
diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 1f24c7343..247f6abfd 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -8384,7 +8384,7 @@
                                 If you see the following error, you need to
                                 update or create a
                                 <filename>~/.mtoolsrc</filename> file and
-                                be sure to have the line “mtools_skip_check=1“
+                                be sure to have the line "mtools_skip_check=1"
                                 in the file.
                                 Then, run the Wic command again:
                                 <literallayout class='monospaced'>
@@ -9837,7 +9837,7 @@
                         <listitem><para>
                             Select the desired package format as follows:
                             <literallayout class='monospaced'>
-     PACKAGE_CLASSES ?= “package_<replaceable>packageformat</replaceable>”
+     PACKAGE_CLASSES ?= "package_<replaceable>packageformat</replaceable>"
                             </literallayout>
                             where <replaceable>packageformat</replaceable>
                             can be "ipk", "rpm", "deb", or "tar" which are the
@@ -14193,7 +14193,7 @@
                         <filename>local.conf</filename> file or in an image
                         recipe:
                         <literallayout class='monospaced'>
-     IMAGE_INSTALL_append = “ gdbserver"
+     IMAGE_INSTALL_append = " gdbserver"
                         </literallayout>
                         The change makes sure the <filename>gdbserver</filename>
                         package is included.
diff --git a/documentation/dev-manual/dev-manual-qemu.rst b/documentation/dev-manual/dev-manual-qemu.rst
index 82c214b9b..88b03745f 100644
--- a/documentation/dev-manual/dev-manual-qemu.rst
+++ b/documentation/dev-manual/dev-manual-qemu.rst
@@ -74,7 +74,7 @@ available. Follow these general steps to run QEMU:
 
 3. *Ensure the Artifacts are in Place:* You need to be sure you have a
    pre-built kernel that will boot in QEMU. You also need the target
-   root filesystem for your target machine’s architecture:
+   root filesystem for your target machine's architecture:
 
    -  If you have previously built an image for QEMU (e.g. ``qemux86``,
       ``qemuarm``, and so forth), then the artifacts are in place in
@@ -396,7 +396,7 @@ command line:
 
 -  ROOTFS: A root filesystem that has one of the following filetype
    extensions: "ext2", "ext3", "ext4", "jffs2", "nfs", or "btrfs". If
-   the filename you provide for this option uses “nfs”, it must provide
+   the filename you provide for this option uses "nfs", it must provide
    an explicit root filesystem path.
 
 -  KERNEL: A kernel image, which is a ``.bin`` file. When you provide a
@@ -405,7 +405,7 @@ command line:
 
 -  MACHINE: The architecture of the QEMU machine, which must be one of
    the following: "qemux86", "qemux86-64", "qemuarm", "qemuarm64",
-   "qemumips", “qemumips64", or "qemuppc". The MACHINE and QEMUARCH
+   "qemumips", "qemumips64", or "qemuppc". The MACHINE and QEMUARCH
    options are basically identical. If you do not provide a MACHINE
    option, ``runqemu`` tries to determine it based on other options.
 
@@ -465,6 +465,6 @@ command line:
       ``/dev/vhost-net``.
 
    -  The build host ``/dev/vhost-net`` directory has to be either
-      readable or writable and “slirp-enabled”.
+      readable or writable and "slirp-enabled".
 
 -  ``publicvnc``: Enables a VNC server open to all hosts.
diff --git a/documentation/dev-manual/dev-manual-qemu.xml b/documentation/dev-manual/dev-manual-qemu.xml
index 46fe67bab..1a526dd2f 100644
--- a/documentation/dev-manual/dev-manual-qemu.xml
+++ b/documentation/dev-manual/dev-manual-qemu.xml
@@ -106,7 +106,7 @@
                     You need to be sure you have a pre-built kernel that
                     will boot in QEMU.
                     You also need the target root filesystem for your target
-                    machine’s architecture:
+                    machine's architecture:
                     <itemizedlist>
                         <listitem><para>
                             If you have previously built an image for QEMU
@@ -553,7 +553,7 @@
                     A root filesystem that has one of the following
                     filetype extensions: "ext2", "ext3", "ext4", "jffs2",
                     "nfs", or "btrfs".
-                    If the filename you provide for this option uses “nfs”, it
+                    If the filename you provide for this option uses "nfs", it
                     must provide an explicit root filesystem path.
                     </para></listitem>
                 <listitem><para>
@@ -567,7 +567,7 @@
                     <replaceable>MACHINE</replaceable>:
                     The architecture of the QEMU machine, which must be one
                     of the following: "qemux86", "qemux86-64", "qemuarm",
-                    "qemuarm64", "qemumips", “qemumips64", or "qemuppc".
+                    "qemuarm64", "qemumips", "qemumips64", or "qemuppc".
                     The <replaceable>MACHINE</replaceable> and
                     <replaceable>QEMUARCH</replaceable> options are basically
                     identical.
@@ -674,7 +674,7 @@ qemux86" or "qemux86-64".
                         <listitem><para>
                             The build host <filename>/dev/vhost-net</filename>
                             directory has to be either readable or writable
-                            and “slirp-enabled”.
+                            and "slirp-enabled".
                             </para></listitem>
                     </itemizedlist>
                     </para></listitem>
diff --git a/documentation/kernel-dev/kernel-dev-concepts-appx.rst b/documentation/kernel-dev/kernel-dev-concepts-appx.rst
index 4ddb7ddb6..04cb1172b 100644
--- a/documentation/kernel-dev/kernel-dev-concepts-appx.rst
+++ b/documentation/kernel-dev/kernel-dev-concepts-appx.rst
@@ -129,7 +129,7 @@ cutting edge Yocto Linux kernel that mixes forward ports of existing
 Linux kernel features and significant and critical new functionality.
 Forward porting Linux kernel functionality into the Yocto Linux kernels
 available through the Yocto Project can be thought of as a "micro
-uprev." The many “micro uprevs” produce a Yocto Linux kernel version
+uprev." The many "micro uprevs" produce a Yocto Linux kernel version
 with a mix of important new mainline, non-mainline, BSP developments and
 feature integrations. This Yocto Linux kernel gives insight into new
 features and allows focused amounts of testing to be done on the kernel,
diff --git a/documentation/kernel-dev/kernel-dev-concepts-appx.xml b/documentation/kernel-dev/kernel-dev-concepts-appx.xml
index 0f2df2a62..bf0c525ca 100644
--- a/documentation/kernel-dev/kernel-dev-concepts-appx.xml
+++ b/documentation/kernel-dev/kernel-dev-concepts-appx.xml
@@ -192,7 +192,7 @@
             Forward porting Linux kernel functionality into the Yocto Linux
             kernels available through the Yocto Project can be thought of as
             a "micro uprev."
-            The many “micro uprevs” produce a Yocto Linux kernel version with
+            The many "micro uprevs" produce a Yocto Linux kernel version with
             a mix of important new mainline, non-mainline, BSP developments
             and feature integrations.
             This Yocto Linux kernel gives insight into new features and
diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/overview-manual-development-environment.rst
index 273e1027d..3b5147d73 100644
--- a/documentation/overview-manual/overview-manual-development-environment.rst
+++ b/documentation/overview-manual/overview-manual-development-environment.rst
@@ -238,7 +238,7 @@ open source projects do so.
 
 For the Yocto Project, a key individual called the "maintainer" is
 responsible for the integrity of the "master" branch of a given Git
-repository. The "master" branch is the “upstream” repository from which
+repository. The "master" branch is the "upstream" repository from which
 final or most recent builds of a project occur. The maintainer is
 responsible for accepting changes from other developers and for
 organizing the underlying branch structure to reflect release strategies
@@ -273,19 +273,19 @@ with whatever upstream branch they are working against. They are also
 responsible for straightening out any conflicts that might arise within
 files that are being worked on simultaneously by more than one person.
 All this work is done locally on the development host before anything is
-pushed to a "contrib" area and examined at the maintainer’s level.
+pushed to a "contrib" area and examined at the maintainer's level.
 
 A somewhat formal method exists by which developers commit changes and
 push them into the "contrib" area and subsequently request that the
 maintainer include them into an upstream branch. This process is called
-“submitting a patch” or "submitting a change." For information on
+"submitting a patch" or "submitting a change." For information on
 submitting patches and changes, see the
 ":ref:`dev-manual/dev-manual-common-tasks:submitting a change to the yocto project`"
 section in the Yocto Project Development Tasks Manual.
 
 In summary, a single point of entry exists for changes into a "master"
 or development branch of the Git repository, which is controlled by the
-project’s maintainer. And, a set of developers exist who independently
+project's maintainer. And, a set of developers exist who independently
 develop, test, and submit changes to "contrib" areas for the maintainer
 to examine. The maintainer then chooses which changes are going to
 become a permanent part of the project.
@@ -526,7 +526,7 @@ descriptions and strategies on how to use these commands:
    Git commands unless you have a ``.git`` repository.
 
 -  *git clone:* Creates a local clone of a Git repository that is on
-   equal footing with a fellow developer’s Git repository or an upstream
+   equal footing with a fellow developer's Git repository or an upstream
    repository.
 
 -  *git add:* Locally stages updated file contents to the index that
@@ -537,7 +537,7 @@ descriptions and strategies on how to use these commands:
    you made. Only changes that have been staged can be committed.
    Commits are used for historical purposes, for determining if a
    maintainer of a project will allow the change, and for ultimately
-   pushing the change from your local Git repository into the project’s
+   pushing the change from your local Git repository into the project's
    upstream repository.
 
 -  *git status:* Reports any modified files that possibly need to be
diff --git a/documentation/overview-manual/overview-manual-development-environment.xml b/documentation/overview-manual/overview-manual-development-environment.xml
index 8415d1dd7..08ad07131 100644
--- a/documentation/overview-manual/overview-manual-development-environment.xml
+++ b/documentation/overview-manual/overview-manual-development-environment.xml
@@ -327,7 +327,7 @@
         For the Yocto Project, a key individual called the "maintainer" is
         responsible for the integrity of the "master" branch of a given Git
         repository.
-        The "master" branch is the “upstream” repository from which final or
+        The "master" branch is the "upstream" repository from which final or
         most recent builds of a project occur.
         The maintainer is responsible for accepting changes from other
         developers and for organizing the underlying branch structure to
@@ -372,7 +372,7 @@
         might arise within files that are being worked on simultaneously by
         more than one person.
         All this work is done locally on the development host before
-        anything is pushed to a "contrib" area and examined at the maintainer’s
+        anything is pushed to a "contrib" area and examined at the maintainer's
         level.
     </para>
 
@@ -380,7 +380,7 @@
         A somewhat formal method exists by which developers commit changes
         and push them into the "contrib" area and subsequently request that
         the maintainer include them into an upstream branch.
-        This process is called “submitting a patch” or "submitting a change."
+        This process is called "submitting a patch" or "submitting a change."
         For information on submitting patches and changes, see the
         "<ulink url='&YOCTO_DOCS_DEV_URL;#how-to-submit-a-change'>Submitting a Change to the Yocto Project</ulink>"
         section in the Yocto Project Development Tasks Manual.
@@ -389,7 +389,7 @@
     <para>
         In summary, a single point of entry
         exists for changes into a "master" or development branch of the
-        Git repository, which is controlled by the project’s maintainer.
+        Git repository, which is controlled by the project's maintainer.
         And, a set of developers exist who independently develop, test, and
         submit changes to "contrib" areas for the maintainer to examine.
         The maintainer then chooses which changes are going to become a
@@ -734,7 +734,7 @@
                 <listitem><para id='git-commands-clone'>
                     <emphasis><filename>git clone</filename>:</emphasis>
                     Creates a local clone of a Git repository that is on
-                    equal footing with a fellow developer’s Git repository
+                    equal footing with a fellow developer's Git repository
                     or an upstream repository.
                     </para></listitem>
                 <listitem><para>
@@ -752,7 +752,7 @@
                     Commits are used for historical purposes, for determining
                     if a maintainer of a project will allow the change,
                     and for ultimately pushing the change from your local
-                    Git repository into the project’s upstream repository.
+                    Git repository into the project's upstream repository.
                     </para></listitem>
                 <listitem><para>
                     <emphasis><filename>git status</filename>:</emphasis>
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index f01d9f712..823c96d88 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -319,14 +319,14 @@ applications using the Yocto Project:
 
    The ``devtool`` command employs a number of sub-commands that allow
    you to add, modify, and upgrade recipes. As with the OpenEmbedded
-   build system, “recipes” represent software packages within
+   build system, "recipes" represent software packages within
    ``devtool``. When you use ``devtool add``, a recipe is automatically
    created. When you use ``devtool modify``, the specified existing
    recipe is used in order to determine where to get the source code and
    how to patch it. In both cases, an environment is set up so that when
    you build the recipe a source tree that is under your control is used
    in order to allow you to make changes to the source as desired. By
-   default, both new recipes and the source go into a “workspace”
+   default, both new recipes and the source go into a "workspace"
    directory under the eSDK. The ``devtool upgrade`` command updates an
    existing recipe so that you can build it for an updated set of source
    files.
@@ -417,7 +417,7 @@ activities using the Yocto Project:
    years ago. Both prelink and cross-prelink are maintained in the same
    repository albeit on separate branches. By providing an emulated
    runtime dynamic linker (i.e. ``glibc``-derived ``ld.so`` emulation),
-   the cross-prelink project extends the prelink software’s ability to
+   the cross-prelink project extends the prelink software's ability to
    prelink a sysroot environment. Additionally, the cross-prelink
    software enables the ability to work in sysroot style environments.
 
@@ -432,7 +432,7 @@ activities using the Yocto Project:
    library code can be re-used from shared Copy-On-Write (COW) pages.
 
    The original upstream prelink project only supports running prelink
-   on the end target device due to the reliance on the target device’s
+   on the end target device due to the reliance on the target device's
    dynamic linker. This restriction causes issues when developing a
    cross-compiled system. The cross-prelink adds a synthesized dynamic
    loader that runs on the host, thus permitting cross-prelinking
@@ -495,7 +495,7 @@ The following list consists of components associated with the
    Sharing a core set of metadata results in Poky as an integration
    layer on top of OE-Core. You can see that in this
    `figure <#yp-key-dev-elements>`__. The Yocto Project combines various
-   components such as BitBake, OE-Core, script “glue”, and documentation
+   components such as BitBake, OE-Core, script "glue", and documentation
    for its build system.
 
 .. _gs-reference-distribution-poky:
@@ -556,7 +556,7 @@ targets:
    .. note::
 
       As best it can, opkg maintains backwards compatibility with ipkg
-      and conforms to a subset of Debian’s policy manual regarding
+      and conforms to a subset of Debian's policy manual regarding
       control files.
 
 .. _gs-archived-components:
diff --git a/documentation/overview-manual/overview-manual-yp-intro.xml b/documentation/overview-manual/overview-manual-yp-intro.xml
index 2097ed36e..a2a1f494b 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.xml
+++ b/documentation/overview-manual/overview-manual-yp-intro.xml
@@ -459,7 +459,7 @@
                         <para>The <filename>devtool</filename> command employs
                         a number of sub-commands that allow you to add, modify,
                         and upgrade recipes.
-                        As with the OpenEmbedded build system, “recipes”
+                        As with the OpenEmbedded build system, "recipes"
                         represent software packages within
                         <filename>devtool</filename>.
                         When you use <filename>devtool add</filename>, a recipe
@@ -472,7 +472,7 @@
                         control is used in order to allow you to make changes
                         to the source as desired.
                         By default, both new recipes and the source go into
-                        a “workspace” directory under the eSDK.
+                        a "workspace" directory under the eSDK.
                         The <filename>devtool upgrade</filename> command
                         updates an existing recipe so that you can build it
                         for an updated set of source files.</para>
@@ -598,7 +598,7 @@
                         By providing an emulated runtime dynamic linker
                         (i.e. <filename>glibc</filename>-derived
                         <filename>ld.so</filename> emulation), the
-                        cross-prelink project extends the prelink software’s
+                        cross-prelink project extends the prelink software's
                         ability to prelink a sysroot environment.
                         Additionally, the cross-prelink software enables the
                         ability to work in sysroot style environments.</para>
@@ -620,7 +620,7 @@
 
                         <para>The original upstream prelink project only
                         supports running prelink on the end target device
-                        due to the reliance on the target device’s dynamic
+                        due to the reliance on the target device's dynamic
                         linker.
                         This restriction causes issues when developing a
                         cross-compiled system.
@@ -713,7 +713,7 @@
                         You can see that in this
                         <link linkend='yp-key-dev-elements'>figure</link>.
                         The Yocto Project combines various components such as
-                        BitBake, OE-Core, script “glue”, and documentation
+                        BitBake, OE-Core, script "glue", and documentation
                         for its build system.
                         </para></listitem>
                 </itemizedlist>
@@ -791,7 +791,7 @@
                         <note>
                             As best it can, opkg maintains backwards
                             compatibility with ipkg and conforms to a subset
-                            of Debian’s policy manual regarding control files.
+                            of Debian's policy manual regarding control files.
                         </note>
                         </para></listitem>
                 </itemizedlist>
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 04066e920..2d2aaad0a 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -143,7 +143,7 @@ various proxy types and configuring proxy servers, see the
 ":yocto_wiki:`Working Behind a Network Proxy </wiki/Working_Behind_a_Network_Proxy>`"
 Wiki page.
 
-**Q:** What’s the difference between target and target\ ``-native``?
+**Q:** What's the difference between target and target\ ``-native``?
 
 **A:** The ``*-native`` targets are designed to run on the system being
 used for the build. These are usually tools that are needed to assist
diff --git a/documentation/ref-manual/faq.xml b/documentation/ref-manual/faq.xml
index 98ae0a975..2f8fcf324 100644
--- a/documentation/ref-manual/faq.xml
+++ b/documentation/ref-manual/faq.xml
@@ -323,7 +323,7 @@
     <qandaentry>
         <question>
             <para>
-                What’s the difference between <replaceable>target</replaceable> and <replaceable>target</replaceable><filename>-native</filename>?
+                What's the difference between <replaceable>target</replaceable> and <replaceable>target</replaceable><filename>-native</filename>?
             </para>
         </question>
         <answer>
diff --git a/documentation/ref-manual/ref-images.rst b/documentation/ref-manual/ref-images.rst
index 47beda0c2..f0229c3bb 100644
--- a/documentation/ref-manual/ref-images.rst
+++ b/documentation/ref-manual/ref-images.rst
@@ -6,7 +6,7 @@ Images
 
 The OpenEmbedded build system provides several example images to satisfy
 different needs. When you issue the ``bitbake`` command you provide a
-“top-level” recipe that essentially begins the build for the type of
+"top-level" recipe that essentially begins the build for the type of
 image you want.
 
 .. note::
@@ -85,7 +85,7 @@ Following is a list of supported recipes:
 
 -  ``core-image-minimal-initramfs``: A ``core-image-minimal`` image that
    has the Minimal RAM-based Initial Root Filesystem (initramfs) as part
-   of the kernel, which allows the system to find the first “init”
+   of the kernel, which allows the system to find the first "init"
    program more efficiently. See the
    :term:`PACKAGE_INSTALL` variable for
    additional information helpful when working with initramfs images.
diff --git a/documentation/ref-manual/ref-images.xml b/documentation/ref-manual/ref-images.xml
index aaeda5522..6f10a6fd2 100644
--- a/documentation/ref-manual/ref-images.xml
+++ b/documentation/ref-manual/ref-images.xml
@@ -9,7 +9,7 @@
     <para>
         The OpenEmbedded build system provides several example
         images to satisfy different needs.
-        When you issue the <filename>bitbake</filename> command you provide a “top-level” recipe
+        When you issue the <filename>bitbake</filename> command you provide a "top-level" recipe
         that essentially begins the build for the type of image you want.
     </para>
 
@@ -100,7 +100,7 @@
             <listitem><para id='images-core-image-minimal-initramfs'><filename>core-image-minimal-initramfs</filename>:
                 A <filename>core-image-minimal</filename> image that has the Minimal RAM-based
                 Initial Root Filesystem (initramfs) as part of the kernel,
-                which allows the system to find the first “init” program more efficiently.
+                which allows the system to find the first "init" program more efficiently.
                 See the
                 <link linkend='var-PACKAGE_INSTALL'><filename>PACKAGE_INSTALL</filename></link>
                 variable for additional information helpful when working with
diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/ref-terms.rst
index 312fc12ef..6e7e5169c 100644
--- a/documentation/ref-manual/ref-terms.rst
+++ b/documentation/ref-manual/ref-terms.rst
@@ -273,7 +273,7 @@ universal, the list includes them just in case:
       Arbitrary groups of software Recipes. You use
       package groups to hold recipes that, when built, usually accomplish a
       single task. For example, a package group could contain the recipes
-      for a company’s proprietary or value-add software. Or, the package
+      for a company's proprietary or value-add software. Or, the package
       group could contain the recipes that enable graphics. A package group
       is really just another recipe. Because package group files are
       recipes, they end with the ``.bb`` filename extension.
diff --git a/documentation/ref-manual/ref-terms.xml b/documentation/ref-manual/ref-terms.xml
index d2605c62a..2a0452bd7 100644
--- a/documentation/ref-manual/ref-terms.xml
+++ b/documentation/ref-manual/ref-terms.xml
@@ -365,7 +365,7 @@
                 You use package groups to hold recipes that, when built,
                 usually accomplish a single task.
                 For example, a package group could contain the recipes for a
-                company’s proprietary or value-add software.
+                company's proprietary or value-add software.
                 Or, the package group could contain the recipes that enable
                 graphics.
                 A package group is really just another recipe.
diff --git a/documentation/test-manual/test-manual-intro.rst b/documentation/test-manual/test-manual-intro.rst
index b0bc24c9b..53ad650b3 100644
--- a/documentation/test-manual/test-manual-intro.rst
+++ b/documentation/test-manual/test-manual-intro.rst
@@ -12,9 +12,9 @@ Welcome
 Welcome to the Yocto Project Test Environment Manual! This manual is a
 work in progress. The manual contains information about the testing
 environment used by the Yocto Project to make sure each major and minor
-release works as intended. All the project’s testing infrastructure and
+release works as intended. All the project's testing infrastructure and
 processes are publicly visible and available so that the community can
-see what testing is being performed, how it’s being done and the current
+see what testing is being performed, how it's being done and the current
 status of the tests and the project at any given time. It is intended
 that Other organizations can leverage off the process and testing
 environment used by the Yocto Project to create their own automated,
@@ -514,7 +514,7 @@ resource utilisation as that happens. An example from
                      'bitbake -p (cached)')
 
 This example shows how three specific parsing timings are
-measured, with and without various caches, to show how BitBake’s parsing
+measured, with and without various caches, to show how BitBake's parsing
 performance trends over time.
 
 .. _test-writing-considerations:
diff --git a/documentation/test-manual/test-manual-intro.xml b/documentation/test-manual/test-manual-intro.xml
index 8e2c7cd87..0cdbee4d8 100644
--- a/documentation/test-manual/test-manual-intro.xml
+++ b/documentation/test-manual/test-manual-intro.xml
@@ -12,8 +12,8 @@
         <para> Welcome to the Yocto Project Test Environment Manual! This manual is a work in
             progress. The manual contains information about the testing environment used by the
             Yocto Project to make sure each major and minor release works as intended. All the
-            project’s testing infrastructure and processes are publicly visible and available so
-            that the community can see what testing is being performed, how it’s being done and the
+            project's testing infrastructure and processes are publicly visible and available so
+            that the community can see what testing is being performed, how it's being done and the
             current status of the tests and the project at any given time. It is intended that Other
             organizations can leverage off the process and testing environment used by the Yocto
             Project to create their own automated, production test environment, building upon the
@@ -579,7 +579,7 @@
                                       'bitbake -p (cached)')
                     </literallayout>This
                 example shows how three specific parsing timings are measured, with and without
-                various caches, to show how BitBake’s parsing performance trends over time.</para>
+                various caches, to show how BitBake's parsing performance trends over time.</para>
         </section>
     </section>
     <section id='test-writing-considerations'>
diff --git a/documentation/test-manual/test-manual-understand-autobuilder.rst b/documentation/test-manual/test-manual-understand-autobuilder.rst
index 0809190b5..2fcae5000 100644
--- a/documentation/test-manual/test-manual-understand-autobuilder.rst
+++ b/documentation/test-manual/test-manual-understand-autobuilder.rst
@@ -7,19 +7,19 @@ Understanding the Yocto Project Autobuilder
 Execution Flow within the Autobuilder
 =====================================
 
-The “a-full” and “a-quick” targets are the usual entry points into the
+The "a-full" and "a-quick" targets are the usual entry points into the
 Autobuilder and it makes sense to follow the process through the system
 starting there. This is best visualised from the Autobuilder Console
 view (:yocto_ab:`/typhoon/#/console`).
 
-Each item along the top of that view represents some “target build” and
-these targets are all run in parallel. The ‘full’ build will trigger the
-majority of them, the “quick” build will trigger some subset of them.
+Each item along the top of that view represents some "target build" and
+these targets are all run in parallel. The 'full' build will trigger the
+majority of them, the "quick" build will trigger some subset of them.
 The Autobuilder effectively runs whichever configuration is defined for
 each of those targets on a seperate buildbot worker. To understand the
 configuration, you need to look at the entry on ``config.json`` file
 within the ``yocto-autobuilder-helper`` repository. The targets are
-defined in the ‘overrides’ section, a quick example could be qemux86-64
+defined in the ‘overrides' section, a quick example could be qemux86-64
 which looks like::
 
    "qemux86-64" : {
@@ -32,8 +32,8 @@ which looks like::
         }
    },
 
-And to expand that, you need the “arch-qemu” entry from
-the “templates” section, which looks like::
+And to expand that, you need the "arch-qemu" entry from
+the "templates" section, which looks like::
 
    "arch-qemu" : {
          "BUILDINFO" : true,
@@ -54,9 +54,9 @@ the “templates” section, which looks like::
          }
    },
 
-Combining these two entries you can see that “qemux86-64” is a three step build where the
+Combining these two entries you can see that "qemux86-64" is a three step build where the
 ``bitbake BBTARGETS`` would be run, then ``bitbake SANITYTARGETS`` for each step; all for
-``MACHINE=”qemx86-64”`` but with differing SDKMACHINE settings. In step
+``MACHINE="qemx86-64"`` but with differing SDKMACHINE settings. In step
 1 an extra variable is added to the ``auto.conf`` file to enable wic
 image generation.
 
@@ -262,7 +262,7 @@ of post-build steps, including:
 
 #. Cleanup the build directory using
    :ref:`test-manual/test-manual-understand-autobuilder:clobberdir` if the build was successful,
-   else rename it to “build-renamed” for potential future debugging.
+   else rename it to "build-renamed" for potential future debugging.
 
 .. _test-deploying-yp-autobuilder:
 
diff --git a/documentation/test-manual/test-manual-understand-autobuilder.xml b/documentation/test-manual/test-manual-understand-autobuilder.xml
index a04006605..8600367be 100644
--- a/documentation/test-manual/test-manual-understand-autobuilder.xml
+++ b/documentation/test-manual/test-manual-understand-autobuilder.xml
@@ -8,18 +8,18 @@
 <title>Understanding the Yocto Project Autobuilder</title>
     <section>
         <title>Execution Flow within the Autobuilder</title>
-        <para>The “a-full” and “a-quick” targets are the usual entry points into the Autobuilder and
+        <para>The "a-full" and "a-quick" targets are the usual entry points into the Autobuilder and
             it makes sense to follow the process through the system starting there. This is best
             visualised from the Autobuilder Console view (<link linkend=""
                 >https://autobuilder.yoctoproject.org/typhoon/#/console</link>). </para>
-        <para>Each item along the top of that view represents some “target build” and these targets
-            are all run in parallel. The ‘full’ build will trigger the majority of them, the “quick”
+        <para>Each item along the top of that view represents some "target build" and these targets
+            are all run in parallel. The 'full' build will trigger the majority of them, the "quick"
             build will trigger some subset of them. The Autobuilder effectively runs whichever
             configuration is defined for each of those targets on a seperate buildbot worker. To
             understand the configuration, you need to look at the entry on
                 <filename>config.json</filename> file within the
                 <filename>yocto-autobuilder-helper</filename> repository. The targets are defined in
-            the ‘overrides’ section, a quick example could be qemux86-64 which looks
+            the ‘overrides' section, a quick example could be qemux86-64 which looks
             like:<literallayout class="monospaced">
      "qemux86-64" : {
          "MACHINE" : "qemux86-64",
@@ -31,7 +31,7 @@
          }
      },
                     </literallayout>And
-            to expand that, you need the “arch-qemu” entry from the “templates” section, which looks
+            to expand that, you need the "arch-qemu" entry from the "templates" section, which looks
             like:<literallayout class="monospaced">
      "arch-qemu" : {
          "BUILDINFO" : true,
@@ -52,10 +52,10 @@
          }
      },
                     </literallayout>Combining
-            these two entries you can see that “qemux86-64” is a three step build where the
+            these two entries you can see that "qemux86-64" is a three step build where the
                 <filename>bitbake BBTARGETS</filename> would be run, then <filename>bitbake
                 SANITYTARGETS</filename> for each step; all for
-                <filename>MACHINE=”qemx86-64”</filename> but with differing SDKMACHINE settings. In
+                <filename>MACHINE="qemx86-64"</filename> but with differing SDKMACHINE settings. In
             step 1 an extra variable is added to the <filename>auto.conf</filename> file to enable
             wic image generation.</para>
         <para>While not every detail of this is covered here, you can see how the templating
@@ -260,7 +260,7 @@
                 <listitem>
                     <para dir="ltr">Cleanup the build directory using <link
                             linkend="test-clobberdir"><filename>clobberdir</filename></link> if the
-                        build was successful, else rename it to “build-renamed” for potential future
+                        build was successful, else rename it to "build-renamed" for potential future
                         debugging.</para>
                 </listitem>
             </orderedlist></para>
diff --git a/documentation/toaster-manual/toaster-manual-setup-and-use.rst b/documentation/toaster-manual/toaster-manual-setup-and-use.rst
index 1ff28395f..531af2131 100644
--- a/documentation/toaster-manual/toaster-manual-setup-and-use.rst
+++ b/documentation/toaster-manual/toaster-manual-setup-and-use.rst
@@ -37,15 +37,15 @@ Setting Up Toaster Without a Web Server
 You can start a Toaster environment without starting its web server.
 This is useful for the following:
 
--  Capturing a command-line build’s statistics into the Toaster database
+-  Capturing a command-line build's statistics into the Toaster database
    for examination later.
 
--  Capturing a command-line build’s statistics when the Toaster server
+-  Capturing a command-line build's statistics when the Toaster server
    is already running.
 
 -  Having one instance of the Toaster web server track and capture
    multiple command-line builds, where each build is started in its own
-   “noweb” Toaster environment.
+   "noweb" Toaster environment.
 
 The following commands show how to start a Toaster environment without
 starting its web server, perform BitBake operations, and then shut down
@@ -53,14 +53,14 @@ the Toaster environment. Once the build is complete, you can close the
 Toaster environment. Before closing the environment, however, you should
 allow a few minutes to ensure the complete transfer of its BitBake build
 statistics to the Toaster database. If you have a separate Toaster web
-server instance running, you can watch this command-line build’s
+server instance running, you can watch this command-line build's
 progress and examine the results as soon as they are posted: $ source
 toaster start noweb $ bitbake target $ source toaster stop
 
 Setting Up Toaster Without a Build Server
 =========================================
 
-You can start a Toaster environment with the “New Projects” feature
+You can start a Toaster environment with the "New Projects" feature
 disabled. Doing so is useful for the following:
 
 -  Sharing your build results over the web server while blocking others
@@ -280,7 +280,7 @@ Perform the following steps to install Toaster:
     directory to be served up by the Apache web server as defined by
     ``STATIC_ROOT``.
 
-7.  Test and/or use the Mysql integration with Toaster’s Django web
+7.  Test and/or use the Mysql integration with Toaster's Django web
     server. At this point, you can start up the normal Toaster Django
     web server with the Toaster database in Mysql. You can use this web
     server to confirm that the database migration and data population
diff --git a/documentation/toaster-manual/toaster-manual-setup-and-use.xml b/documentation/toaster-manual/toaster-manual-setup-and-use.xml
index d810b9d57..f55574592 100644
--- a/documentation/toaster-manual/toaster-manual-setup-and-use.xml
+++ b/documentation/toaster-manual/toaster-manual-setup-and-use.xml
@@ -70,17 +70,17 @@
             web server. This is useful for the following:
             <itemizedlist>
                 <listitem><para>
-                    Capturing a command-line build’s statistics into
+                    Capturing a command-line build's statistics into
                     the Toaster database for examination later.
                     </para></listitem>
                 <listitem><para>
-                    Capturing a command-line build’s statistics when
+                    Capturing a command-line build's statistics when
                     the Toaster server is already running.
                     </para></listitem>
                 <listitem><para>
                     Having one instance of the Toaster web server
                     track and capture multiple command-line builds,
-                    where each build is started in its own “noweb”
+                    where each build is started in its own "noweb"
                     Toaster environment.
                     </para></listitem>
             </itemizedlist>
@@ -92,7 +92,7 @@
             minutes to ensure the complete transfer of its BitBake build
             statistics to the Toaster database.
             If you have a separate Toaster web server instance running, you
-            can watch this command-line build’s progress and examine the
+            can watch this command-line build's progress and examine the
             results as soon as they are posted:
             <literallayout class='monospaced'>
      $ source toaster start noweb
@@ -107,7 +107,7 @@
 
         <para>
             You can start a Toaster environment with the
-            “New Projects” feature disabled.
+            "New Projects" feature disabled.
             Doing so is useful for the following:
             <itemizedlist>
                 <listitem><para>
@@ -470,7 +470,7 @@
                       <filename>STATIC_ROOT</filename>.
                       </para></listitem>
                   <listitem><para>
-                      Test and/or use the Mysql integration with Toaster’s
+                      Test and/or use the Mysql integration with Toaster's
                       Django web server.
                       At this point, you can start up the normal Toaster
                       Django web server with the Toaster database in Mysql.
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index 6f75aa746..43a646d87 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -10,9 +10,9 @@ Transitioning to a custom environment for systems development
 
    So you've finished the :doc:`brief-yoctoprojectqs/brief-yoctoprojectqs` and
    glanced over the document :doc:`what-i-wish-id-known`, the latter contains
-   important information learned from other users. You’re well prepared. But
-   now, as you are starting your own project, isn’t exactly straightforward what
-   to do. And, the documentation is daunting. We’ve put together a few hints to
+   important information learned from other users. You're well prepared. But
+   now, as you are starting your own project, isn't exactly straightforward what
+   to do. And, the documentation is daunting. We've put together a few hints to
    get you started.
 
 #. **Make a list of the processor, target board, technologies, and capabilities
@@ -21,7 +21,7 @@ Transitioning to a custom environment for systems development
    things, and adding them to your configuration. (See #3)
 
 #. **Set up your board support**.
-   Even if you’re using custom hardware, it might be easier to start with an
+   Even if you're using custom hardware, it might be easier to start with an
    existing target board that uses the same processor or at least the same
    architecture as your custom hardware. Knowing the board already has a
    functioning Board Support Package (BSP) within the project makes it easier
@@ -36,7 +36,7 @@ Transitioning to a custom environment for systems development
    vendor – they can point you to their most qualified efforts. In general, for
    Intel silicon use meta-intel, for Texas Instruments use meta-ti, and so
    forth. Choose a BSP that has been tested with the same Yocto Project release
-   that you’ve downloaded. Be aware that some BSPs may not be immediately
+   that you've downloaded. Be aware that some BSPs may not be immediately
    supported on the very latest release, but they will be eventually.
 
    You might want to start with the build specification that Poky provides
@@ -46,7 +46,7 @@ Transitioning to a custom environment for systems development
 
 #. **Based on the layers you've chosen, make needed changes in your
    configuration**.
-   For instance, you’ve chosen a machine type and added in the corresponding BSP
+   For instance, you've chosen a machine type and added in the corresponding BSP
    layer. You'll then need to change the value of the MACHINE variable in your
    configuration file (build/local.conf) to point to that same machine
    type. There could be other layer-specific settings you need to change as
@@ -82,14 +82,14 @@ Transitioning to a custom environment for systems development
    Recipe <dev-manual/dev-manual-common-tasks:writing a new recipe>` in the
    Yocto Project Development Tasks Manual for more information.
 
-#. **Now you’re ready to create an image recipe**.
+#. **Now you're ready to create an image recipe**.
    There are a number of ways to do this. However, it is strongly recommended
-   that you have your own image recipe - don’t try appending to existing image
+   that you have your own image recipe - don't try appending to existing image
    recipes. Recipes for images are trivial to create and you usually want to
    fully customize their contents.
 
 #. **Build your image and refine it**.
-   Add what’s missing and fix anything that's broken using your knowledge of the
+   Add what's missing and fix anything that's broken using your knowledge of the
    :ref:`workflow <sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk
    workflow>` to identify where issues might be occurring.
 
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index c0de1ec72..05d1aa35b 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -8,7 +8,7 @@ What I wish I'd known about Yocto Project
 
 .. note::
 
-   Before reading further, make sure you’ve taken a look at the
+   Before reading further, make sure you've taken a look at the
    :yocto_home:`Software Overview</software-overview>` page which presents the
    definitions for many of the terms referenced here. Also, know that some of the
    information here won't make sense now, but as you start developing, it is the
@@ -16,8 +16,8 @@ What I wish I'd known about Yocto Project
    working with Yocto Project and they are updated regularly.
 
 Using the Yocto Project is fairly easy, *until something goes wrong*. Without an
-understanding of how the build process works, you’ll find yourself trying to
-troubleshoot “a black box”. Here are a few items that new users wished they had
+understanding of how the build process works, you'll find yourself trying to
+troubleshoot "a black box". Here are a few items that new users wished they had
 known before embarking on their first build with Yocto Project. Feel free to
 contact us with other suggestions.
 
@@ -34,7 +34,7 @@ contact us with other suggestions.
    </software-over/layer/>`.  Generally check the Compatible layer index first,
    and if you don't find the necessary layer check the general layer index. The
    layer index is an original artifact from the Open Embedded Project. As such,
-   that index doesn’t have the curating and testing that the Yocto Project
+   that index doesn't have the curating and testing that the Yocto Project
    provides on Yocto Project Compatible layer list, but the latter has fewer
    entries. Know that when you start searching in the layer index that not all
    layers have the same level of maturity, validation, or usability.  Nor do
@@ -110,7 +110,7 @@ contact us with other suggestions.
    :ref:`bitbake-user-manual/bitbake-user-manual-intro:generating dependency
    graphs` section in the BitBake User Manual.
 
-#. **Here’s how you decode “magic” folder names in tmp/work:**
+#. **Here's how you decode "magic" folder names in tmp/work:**
    The build system fetches, unpacks, preprocesses, and builds. If something
    goes wrong, the build system reports to you directly the path to a folder
    where the temporary (build/tmp) files and packages reside resulting from the
@@ -128,8 +128,8 @@ contact us with other suggestions.
    Yocto Project, the instructions found in the
    :doc:`brief-yoctoprojectqs/brief-yoctoprojectqs` show how to create an image
    and then run or flash that image.  However, you can actually build just a
-   single recipe. Thus, if some dependency or recipe isn’t working, you can just
-   say “bitbake foo” where "foo" is the name for a specific recipe.  As you
+   single recipe. Thus, if some dependency or recipe isn't working, you can just
+   say "bitbake foo" where "foo" is the name for a specific recipe.  As you
    become more advanced using the Yocto Project, and if builds are failing, it
    can be useful to make sure the fetch itself works as desired. Here are some
    valuable links: :ref:`dev-manual/dev-manual-common-tasks:Using a Development
@@ -147,11 +147,11 @@ contact us with other suggestions.
    the recipe is building but are different parts (packages) of the build
    (i.e. the main package, the doc package, the debug symbols package, the
    separate utilities package, and so forth). The build system splits out the
-   packages so that you don’t need to install the packages you don’t want or
+   packages so that you don't need to install the packages you don't want or
    need, which is advantageous because you are building for small devices when
    developing for embedded and IoT.
 
-#. **You will want to learn about and know what’s packaged in rootfs.**
+#. **You will want to learn about and know what's packaged in rootfs.**
 
 #. **Create your own image recipe:**
    There are a number of ways to create your own image recipe.  We suggest you
-- 
2.26.2


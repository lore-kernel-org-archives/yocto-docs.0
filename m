Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3088C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 18:08:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.524.1670609309325679178
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 10:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jc2cFhmw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 161E940007;
	Fri,  9 Dec 2022 18:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670609306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gPu3GTYJ6UthvoLERbVHxcgwmY3zv1lRSz4BuNZnyR4=;
	b=jc2cFhmw8KcMLRnaiK3umZSv5LEEsJ2KCEmafZgI1wgRC1c33tAKXk3foRd+e5FqjzpQmP
	XGhDqP1Z2cam+/G6aRBIjQfP+mBvFyS6R9hFqea6iuvaON/5hbB5CcID55fIT9qEiedrio
	4vHGIrnSqXN7Qtsld3G0Z5ZOLnh6z4SR6/HbGDEPsihQLgTcAo6BVqLClTrRPHW9ZDZFIg
	23WCgT+4dQ+mS9bEKsWB5xb6k4DojxiiQK3GGsQTQfGwCUE2gR9bpOErNRnBuhAX8Ped/s
	q0lN7+9SvBQtsbgs4YvZeueQORb9tpxHe4TmA8zL5KbFDmELRivg2x6bNAGylQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] manuals: define proper numbered lists
Date: Fri,  9 Dec 2022 19:08:15 +0100
Message-Id: <20221209180815.15852-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 18:08:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3542

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Using "#." instead of "1.", "2.", "3.", etc.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss+yocto@0leil.net>
---
 documentation/dev-manual/bmaptool.rst         |   6 +-
 documentation/dev-manual/building.rst         |  46 ++++----
 documentation/dev-manual/changes.rst          |  48 ++++----
 documentation/dev-manual/debugging.rst        |  22 ++--
 .../dev-manual/gobject-introspection.rst      |  18 +--
 documentation/dev-manual/layers.rst           |  18 +--
 documentation/dev-manual/packages.rst         |   4 +-
 documentation/dev-manual/qemu.rst             |  12 +-
 documentation/dev-manual/quilt.rst            |  16 +--
 documentation/dev-manual/runtime-testing.rst  |  28 ++---
 documentation/dev-manual/start.rst            |  94 +++++++--------
 .../dev-manual/upgrading-recipes.rst          |  28 ++---
 documentation/dev-manual/wayland.rst          |   4 +-
 documentation/dev-manual/wic.rst              |   8 +-
 documentation/kernel-dev/common.rst           | 110 +++++++++---------
 documentation/kernel-dev/intro.rst            |  10 +-
 documentation/kernel-dev/maint-appx.rst       |  16 +--
 .../migration-guides/migration-general.rst    |  14 +--
 documentation/overview-manual/yp-intro.rst    |  20 ++--
 documentation/ref-manual/classes.rst          |   4 +-
 .../ref-manual/system-requirements.rst        |  20 ++--
 documentation/ref-manual/variables.rst        |  12 +-
 .../sdk-manual/appendix-customizing.rst       |  14 +--
 documentation/sdk-manual/appendix-obtain.rst  |  28 ++---
 documentation/sdk-manual/extensible.rst       |  58 ++++-----
 documentation/sdk-manual/intro.rst            |   6 +-
 documentation/sdk-manual/working-projects.rst |  22 ++--
 documentation/toaster-manual/reference.rst    |   8 +-
 28 files changed, 347 insertions(+), 347 deletions(-)

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
index 4ee6f5e48b..9add72cf3b 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -28,18 +28,18 @@ Following, is an example that shows how to flash a Wic image. Realize
 that while this example uses a Wic image, you can use Bmaptool to flash
 any type of image. Use these steps to flash an image using Bmaptool:
 
-1. *Update your local.conf File:* You need to have the following set
+#. *Update your local.conf File:* You need to have the following set
    in your ``local.conf`` file before building your image::
 
       IMAGE_FSTYPES += "wic wic.bmap"
 
-2. *Get Your Image:* Either have your image ready (pre-built with the
+#. *Get Your Image:* Either have your image ready (pre-built with the
    :term:`IMAGE_FSTYPES`
    setting previously mentioned) or take the step to build the image::
 
       $ bitbake image
 
-3. *Flash the Device:* Flash the device with the image by using Bmaptool
+#. *Flash the Device:* Flash the device with the image by using Bmaptool
    depending on your particular setup. The following commands assume the
    image resides in the :term:`Build Directory`'s ``deploy/images/`` area:
 
diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 2798dd3e98..3064974cc5 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -43,11 +43,11 @@ The following figure and list overviews the build process:
 .. image:: figures/bitbake-build-flow.png
    :width: 100%
 
-1. *Set up Your Host Development System to Support Development Using the
+#. *Set up Your Host Development System to Support Development Using the
    Yocto Project*: See the ":doc:`start`" section for options on how to get a
    build host ready to use the Yocto Project.
 
-2. *Initialize the Build Environment:* Initialize the build environment
+#. *Initialize the Build Environment:* Initialize the build environment
    by sourcing the build environment script (i.e.
    :ref:`structure-core-script`)::
 
@@ -66,7 +66,7 @@ The following figure and list overviews the build process:
       event, it's typically cleaner to locate the :term:`Build Directory`
       somewhere outside of your source directory.
 
-3. *Make Sure Your* ``local.conf`` *File is Correct*: Ensure the
+#. *Make Sure Your* ``local.conf`` *File is Correct*: Ensure the
    ``conf/local.conf`` configuration file, which is found in the
    :term:`Build Directory`, is set up how you want it. This file defines many
    aspects of the build environment including the target machine architecture
@@ -74,7 +74,7 @@ The following figure and list overviews the build process:
    the build (:term:`PACKAGE_CLASSES`), and a centralized tarball download
    directory through the :term:`DL_DIR` variable.
 
-4. *Build the Image:* Build the image using the ``bitbake`` command::
+#. *Build the Image:* Build the image using the ``bitbake`` command::
 
       $ bitbake target
 
@@ -273,12 +273,12 @@ loading modules needed to locate and mount the final root filesystem.
 
 Follow these steps to create an :term:`Initramfs` image:
 
-1. *Create the :term:`Initramfs` Image Recipe:* You can reference the
+#. *Create the :term:`Initramfs` Image Recipe:* You can reference the
    ``core-image-minimal-initramfs.bb`` recipe found in the
    ``meta/recipes-core`` directory of the :term:`Source Directory`
    as an example from which to work.
 
-2. *Decide if You Need to Bundle the :term:`Initramfs` Image Into the Kernel
+#. *Decide if You Need to Bundle the :term:`Initramfs` Image Into the Kernel
    Image:* If you want the :term:`Initramfs` image that is built to be bundled
    in with the kernel image, set the :term:`INITRAMFS_IMAGE_BUNDLE`
    variable to ``"1"`` in your ``local.conf`` configuration file and set the
@@ -290,7 +290,7 @@ Follow these steps to create an :term:`Initramfs` image:
    :term:`CONFIG_INITRAMFS_SOURCE` variable, allowing the :term:`Initramfs`
    image to be built into the kernel normally.
 
-3. *Optionally Add Items to the Initramfs Image Through the Initramfs
+#. *Optionally Add Items to the Initramfs Image Through the Initramfs
    Image Recipe:* If you add items to the :term:`Initramfs` image by way of its
    recipe, you should use :term:`PACKAGE_INSTALL` rather than
    :term:`IMAGE_INSTALL`. :term:`PACKAGE_INSTALL` gives more direct control of
@@ -298,7 +298,7 @@ Follow these steps to create an :term:`Initramfs` image:
    necessarily want that are set by the :ref:`image <ref-classes-image>`
    or :ref:`core-image <ref-classes-core-image>` classes.
 
-4. *Build the Kernel Image and the Initramfs Image:* Build your kernel
+#. *Build the Kernel Image and the Initramfs Image:* Build your kernel
    image using BitBake. Because the :term:`Initramfs` image recipe is a
    dependency of the kernel image, the :term:`Initramfs` image is built as well
    and bundled with the kernel image if you used the
@@ -316,7 +316,7 @@ to override it.
 
 To achieve this, you need to perform some additional steps:
 
-1. *Create a multiconfig for your Initramfs image:* You can perform the steps
+#. *Create a multiconfig for your Initramfs image:* You can perform the steps
    on ":ref:`dev-manual/building:building images for multiple targets using multiple configurations`" to create a separate multiconfig.
    For the sake of simplicity let's assume such multiconfig is called: ``initramfscfg.conf`` and
    contains the variables::
@@ -324,7 +324,7 @@ To achieve this, you need to perform some additional steps:
       TMPDIR="${TOPDIR}/tmp-initramfscfg"
       TCLIBC="musl"
 
-2. *Set additional Initramfs variables on your main configuration:*
+#. *Set additional Initramfs variables on your main configuration:*
    Additionally, on your main configuration (``local.conf``) you need to set the
    variables::
 
@@ -599,13 +599,13 @@ are a couple of areas to experiment with:
 
 -  ``glibc``: In general, follow this process:
 
-   1. Remove ``glibc`` features from
+   #. Remove ``glibc`` features from
       :term:`DISTRO_FEATURES`
       that you think you do not need.
 
-   2. Build your distribution.
+   #. Build your distribution.
 
-   3. If the build fails due to missing symbols in a package, determine
+   #. If the build fails due to missing symbols in a package, determine
       if you can reconfigure the package to not need those features. For
       example, change the configuration to not support wide character
       support as is done for ``ncurses``. Or, if support for those
@@ -837,13 +837,13 @@ build.
 
 Follow these steps to populate your Downloads directory:
 
-1. *Create a Clean Downloads Directory:* Start with an empty downloads
+#. *Create a Clean Downloads Directory:* Start with an empty downloads
    directory (:term:`DL_DIR`). You
    start with an empty downloads directory by either removing the files
    in the existing directory or by setting :term:`DL_DIR` to point to either
    an empty location or one that does not yet exist.
 
-2. *Generate Tarballs of the Source Git Repositories:* Edit your
+#. *Generate Tarballs of the Source Git Repositories:* Edit your
    ``local.conf`` configuration file as follows::
 
       DL_DIR = "/home/your-download-dir/"
@@ -856,7 +856,7 @@ Follow these steps to populate your Downloads directory:
    :term:`BB_GENERATE_MIRROR_TARBALLS`
    variable for more information.
 
-3. *Populate Your Downloads Directory Without Building:* Use BitBake to
+#. *Populate Your Downloads Directory Without Building:* Use BitBake to
    fetch your sources but inhibit the build::
 
       $ bitbake target --runonly=fetch
@@ -865,7 +865,7 @@ Follow these steps to populate your Downloads directory:
    a "snapshot" of the source files in the form of tarballs, which can
    be used for the build.
 
-4. *Optionally Remove Any Git or other SCM Subdirectories From the
+#. *Optionally Remove Any Git or other SCM Subdirectories From the
    Downloads Directory:* If you want, you can clean up your downloads
    directory by removing any Git or other Source Control Management
    (SCM) subdirectories such as ``${DL_DIR}/git2/*``. The tarballs
@@ -879,7 +879,7 @@ any machine and at any time.
 Follow these steps to build your target using the files in the downloads
 directory:
 
-1. *Using Local Files Only:* Inside your ``local.conf`` file, add the
+#. *Using Local Files Only:* Inside your ``local.conf`` file, add the
    :term:`SOURCE_MIRROR_URL` variable, inherit the
    :ref:`own-mirrors <ref-classes-own-mirrors>` class, and use the
    :term:`BB_NO_NETWORK` variable to your ``local.conf``::
@@ -894,11 +894,11 @@ directory:
    BitBake's fetching process in step 3 stays local, which means files
    from your "own-mirror" are used.
 
-2. *Start With a Clean Build:* You can start with a clean build by
+#. *Start With a Clean Build:* You can start with a clean build by
    removing the ``${``\ :term:`TMPDIR`\ ``}`` directory or using a new
    :term:`Build Directory`.
 
-3. *Build Your Target:* Use BitBake to build your target::
+#. *Build Your Target:* Use BitBake to build your target::
 
       $ bitbake target
 
@@ -925,16 +925,16 @@ directory:
       If you do have recipes that use :term:`AUTOREV`, you can take steps to
       still use the recipes in an offline build. Do the following:
 
-      1. Use a configuration generated by enabling :ref:`build
+      #. Use a configuration generated by enabling :ref:`build
          history <dev-manual/build-quality:maintaining build output quality>`.
 
-      2. Use the ``buildhistory-collect-srcrevs`` command to collect the
+      #. Use the ``buildhistory-collect-srcrevs`` command to collect the
          stored :term:`SRCREV` values from the build's history. For more
          information on collecting these values, see the
          ":ref:`dev-manual/build-quality:build history package information`"
          section.
 
-      3. Once you have the correct source revisions, you can modify
+      #. Once you have the correct source revisions, you can modify
          those recipes to set :term:`SRCREV` to specific versions of the
          software.
 
diff --git a/documentation/dev-manual/changes.rst b/documentation/dev-manual/changes.rst
index 8ccbf0d7ee..9cb25f3549 100644
--- a/documentation/dev-manual/changes.rst
+++ b/documentation/dev-manual/changes.rst
@@ -22,40 +22,40 @@ steps, see the Yocto Project
 
 Use the following general steps to submit a bug:
 
-1.  Open the Yocto Project implementation of :yocto_bugs:`Bugzilla <>`.
+#.  Open the Yocto Project implementation of :yocto_bugs:`Bugzilla <>`.
 
-2.  Click "File a Bug" to enter a new bug.
+#.  Click "File a Bug" to enter a new bug.
 
-3.  Choose the appropriate "Classification", "Product", and "Component"
+#.  Choose the appropriate "Classification", "Product", and "Component"
     for which the bug was found. Bugs for the Yocto Project fall into
     one of several classifications, which in turn break down into
     several products and components. For example, for a bug against the
     ``meta-intel`` layer, you would choose "Build System, Metadata &
     Runtime", "BSPs", and "bsps-meta-intel", respectively.
 
-4.  Choose the "Version" of the Yocto Project for which you found the
+#.  Choose the "Version" of the Yocto Project for which you found the
     bug (e.g. &DISTRO;).
 
-5.  Determine and select the "Severity" of the bug. The severity
+#.  Determine and select the "Severity" of the bug. The severity
     indicates how the bug impacted your work.
 
-6.  Choose the "Hardware" that the bug impacts.
+#.  Choose the "Hardware" that the bug impacts.
 
-7.  Choose the "Architecture" that the bug impacts.
+#.  Choose the "Architecture" that the bug impacts.
 
-8.  Choose a "Documentation change" item for the bug. Fixing a bug might
+#.  Choose a "Documentation change" item for the bug. Fixing a bug might
     or might not affect the Yocto Project documentation. If you are
     unsure of the impact to the documentation, select "Don't Know".
 
-9.  Provide a brief "Summary" of the bug. Try to limit your summary to
+#.  Provide a brief "Summary" of the bug. Try to limit your summary to
     just a line or two and be sure to capture the essence of the bug.
 
-10. Provide a detailed "Description" of the bug. You should provide as
+#.  Provide a detailed "Description" of the bug. You should provide as
     much detail as you can about the context, behavior, output, and so
     forth that surrounds the bug. You can even attach supporting files
     for output from logs by using the "Add an attachment" button.
 
-11. Click the "Submit Bug" button submit the bug. A new Bugzilla number
+#.  Click the "Submit Bug" button submit the bug. A new Bugzilla number
     is assigned to the bug and the defect is logged in the bug tracking
     system.
 
@@ -162,16 +162,16 @@ The following sections provide procedures for submitting a change.
 Preparing Changes for Submission
 --------------------------------
 
-1. *Make Your Changes Locally:* Make your changes in your local Git
+#. *Make Your Changes Locally:* Make your changes in your local Git
    repository. You should make small, controlled, isolated changes.
    Keeping changes small and isolated aids review, makes
    merging/rebasing easier and keeps the change history clean should
    anyone need to refer to it in future.
 
-2. *Stage Your Changes:* Stage your changes by using the ``git add``
+#. *Stage Your Changes:* Stage your changes by using the ``git add``
    command on each file you changed.
 
-3. *Commit Your Changes:* Commit the change by using the ``git commit``
+#. *Commit Your Changes:* Commit the change by using the ``git commit``
    command. Make sure your commit information follows standards by
    following these accepted conventions:
 
@@ -257,7 +257,7 @@ Here is the general procedure on how to submit a patch through email
 without using the scripts once the steps in
 :ref:`dev-manual/changes:preparing changes for submission` have been followed:
 
-1. *Format the Commit:* Format the commit into an email message. To
+#. *Format the Commit:* Format the commit into an email message. To
    format commits, use the ``git format-patch`` command. When you
    provide the command, you must include a revision list or a number of
    patches as part of the command. For example, either of these two
@@ -289,7 +289,7 @@ without using the scripts once the steps in
       or to OpenEmbedded, you might consider requesting a contrib area
       and the necessary associated rights.
 
-2. *Send the patches via email:* Send the patches to the recipients and
+#. *Send the patches via email:* Send the patches to the recipients and
    relevant mailing lists by using the ``git send-email`` command.
 
    .. note::
@@ -352,7 +352,7 @@ been followed:
    in the
    `Git Community Book <https://git-scm.com/book/en/v2/Distributed-Git-Distributed-Workflows>`__.
 
-1. *Push Your Commits to a "Contrib" Upstream:* If you have arranged for
+#. *Push Your Commits to a "Contrib" Upstream:* If you have arranged for
    permissions to push to an upstream contrib repository, push the
    change to that repository::
 
@@ -367,7 +367,7 @@ been followed:
 
       $ git push meta-intel-contrib your_name/README
 
-2. *Determine Who to Notify:* Determine the maintainer or the mailing
+#. *Determine Who to Notify:* Determine the maintainer or the mailing
    list that you need to notify for the change.
 
    Before submitting any change, you need to be sure who the maintainer
@@ -395,7 +395,7 @@ been followed:
       lists <resources-mailinglist>`" section in
       the Yocto Project Reference Manual.
 
-3. *Make a Pull Request:* Notify the maintainer or the mailing list that
+#. *Make a Pull Request:* Notify the maintainer or the mailing list that
    you have pushed a change by making a pull request.
 
    The Yocto Project provides two scripts that conveniently let you
@@ -486,30 +486,30 @@ branch can be obtained from the
 With this in mind, the steps to submit a change for a stable branch are as
 follows:
 
-1. *Identify the bug or CVE to be fixed:* This information should be
+#. *Identify the bug or CVE to be fixed:* This information should be
    collected so that it can be included in your submission.
 
    See :ref:`dev-manual/vulnerabilities:checking for vulnerabilities`
    for details about CVE tracking.
 
-2. *Check if the fix is already present in the master branch:* This will
+#. *Check if the fix is already present in the master branch:* This will
    result in the most straightforward path into the stable branch for the
    fix.
 
-   a. *If the fix is present in the master branch --- submit a backport request
+   #. *If the fix is present in the master branch --- submit a backport request
       by email:* You should send an email to the relevant stable branch
       maintainer and the mailing list with details of the bug or CVE to be
       fixed, the commit hash on the master branch that fixes the issue and
       the stable branches which you would like this fix to be backported to.
 
-   b. *If the fix is not present in the master branch --- submit the fix to the
+   #. *If the fix is not present in the master branch --- submit the fix to the
       master branch first:* This will ensure that the fix passes through the
       project's usual patch review and test processes before being accepted.
       It will also ensure that bugs are not left unresolved in the master
       branch itself. Once the fix is accepted in the master branch a backport
       request can be submitted as above.
 
-   c. *If the fix is unsuitable for the master branch --- submit a patch
+   #. *If the fix is unsuitable for the master branch --- submit a patch
       directly for the stable branch:* This method should be considered as a
       last resort. It is typically necessary when the master branch is using
       a newer version of the software which includes an upstream fix for the
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index f433e8e6a9..921022475f 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -297,11 +297,11 @@ If you are unsure whether a variable dependency is being picked up
 automatically for a given task, you can list the variable dependencies
 BitBake has determined by doing the following:
 
-1. Build the recipe containing the task::
+#. Build the recipe containing the task::
 
    $ bitbake recipename
 
-2. Inside the :term:`STAMPS_DIR`
+#. Inside the :term:`STAMPS_DIR`
    directory, find the signature data (``sigdata``) file that
    corresponds to the task. The ``sigdata`` files contain a pickled
    Python database of all the metadata that went into creating the input
@@ -319,7 +319,7 @@ BitBake has determined by doing the following:
    the cached task output. The ``siginfo`` files contain exactly the
    same information as ``sigdata`` files.
 
-3. Run ``bitbake-dumpsig`` on the ``sigdata`` or ``siginfo`` file. Here
+#. Run ``bitbake-dumpsig`` on the ``sigdata`` or ``siginfo`` file. Here
    is an example::
 
       $ bitbake-dumpsig ${BUILDDIR}/tmp/stamps/i586-poky-linux/db/6.0.30-r1.do_fetch.sigdata.7c048c18222b16ff0bcee2000ef648b1
@@ -992,7 +992,7 @@ site <https://sourceware.org/gdb/documentation/>`__.
 The following steps show you how to debug using the GNU project
 debugger.
 
-1. *Configure your build system to construct the companion debug
+#. *Configure your build system to construct the companion debug
    filesystem:*
 
    In your ``local.conf`` file, set the following::
@@ -1012,7 +1012,7 @@ debugger.
    the full filesystem for debugging. Subsequent steps in this procedure
    show how to combine the partial filesystem with the full filesystem.
 
-2. *Configure the system to include gdbserver in the target filesystem:*
+#. *Configure the system to include gdbserver in the target filesystem:*
 
    Make the following addition in your ``local.conf`` file::
 
@@ -1021,7 +1021,7 @@ debugger.
    The change makes
    sure the ``gdbserver`` package is included.
 
-3. *Build the environment:*
+#. *Build the environment:*
 
    Use the following command to construct the image and the companion
    Debug Filesystem::
@@ -1057,7 +1057,7 @@ debugger.
       the actual image (e.g. ``gdb-cross-i586``). The suggestion is usually the
       actual name you want to use.
 
-4. *Set up the* ``debugfs``\ *:*
+#. *Set up the* ``debugfs``\ *:*
 
    Run the following commands to set up the ``debugfs``::
 
@@ -1066,7 +1066,7 @@ debugger.
       $ tar xvfj build-dir/tmp/deploy/images/machine/image.rootfs.tar.bz2
       $ tar xvfj build-dir/tmp/deploy/images/machine/image-dbg.rootfs.tar.bz2
 
-5. *Set up GDB:*
+#. *Set up GDB:*
 
    Install the SDK (if you built one) and then source the correct
    environment file. Sourcing the environment file puts the SDK in your
@@ -1075,7 +1075,7 @@ debugger.
    If you are using the build system, Gdb is located in
    `build-dir`\ ``/tmp/sysroots/``\ `host`\ ``/usr/bin/``\ `architecture`\ ``/``\ `architecture`\ ``-gdb``
 
-6. *Boot the target:*
+#. *Boot the target:*
 
    For information on how to run QEMU, see the `QEMU
    Documentation <https://wiki.qemu.org/Documentation/GettingStartedDevelopers>`__.
@@ -1084,7 +1084,7 @@ debugger.
 
       Be sure to verify that your host can access the target via TCP.
 
-7. *Debug a program:*
+#. *Debug a program:*
 
    Debugging a program involves running gdbserver on the target and then
    running Gdb on the host. The example in this step debugs ``gzip``:
@@ -1116,7 +1116,7 @@ debugger.
       users ``~/.gdbinit`` file. Upon starting, Gdb automatically runs whatever
       commands are in that file.
 
-8. *Deploying without a full image rebuild:*
+#. *Deploying without a full image rebuild:*
 
    In many cases, during development you want a quick method to deploy a
    new binary to the target and debug it, without waiting for a full
diff --git a/documentation/dev-manual/gobject-introspection.rst b/documentation/dev-manual/gobject-introspection.rst
index 89f21b7d10..28e51240c3 100644
--- a/documentation/dev-manual/gobject-introspection.rst
+++ b/documentation/dev-manual/gobject-introspection.rst
@@ -39,11 +39,11 @@ Enabling the Generation of Introspection Data
 Enabling the generation of introspection data (GIR files) in your
 library package involves the following:
 
-1. Inherit the
+#. Inherit the
    :ref:`gobject-introspection <ref-classes-gobject-introspection>`
    class.
 
-2. Make sure introspection is not disabled anywhere in the recipe or
+#. Make sure introspection is not disabled anywhere in the recipe or
    from anything the recipe includes. Also, make sure that
    "gobject-introspection-data" is not in
    :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`
@@ -51,7 +51,7 @@ library package involves the following:
    :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`.
    In either of these conditions, nothing will happen.
 
-3. Try to build the recipe. If you encounter build errors that look like
+#. Try to build the recipe. If you encounter build errors that look like
    something is unable to find ``.so`` libraries, check where these
    libraries are located in the source tree and add the following to the
    recipe::
@@ -63,7 +63,7 @@ library package involves the following:
       See recipes in the ``oe-core`` repository that use that
       :term:`GIR_EXTRA_LIBS_PATH` variable as an example.
 
-4. Look for any other errors, which probably mean that introspection
+#. Look for any other errors, which probably mean that introspection
    support in a package is not entirely standard, and thus breaks down
    in a cross-compilation environment. For such cases, custom-made fixes
    are needed. A good place to ask and receive help in these cases is
@@ -116,21 +116,21 @@ Testing that Introspection Works in an Image
 Use the following procedure to test if generating introspection data is
 working in an image:
 
-1. Make sure that "gobject-introspection-data" is not in
+#. Make sure that "gobject-introspection-data" is not in
    :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`
    and that "qemu-usermode" is not in
    :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`.
 
-2. Build ``core-image-sato``.
+#. Build ``core-image-sato``.
 
-3. Launch a Terminal and then start Python in the terminal.
+#. Launch a Terminal and then start Python in the terminal.
 
-4. Enter the following in the terminal::
+#. Enter the following in the terminal::
 
       >>> from gi.repository import GLib
       >>> GLib.get_host_name()
 
-5. For something a little more advanced, enter the following see:
+#. For something a little more advanced, enter the following see:
    https://python-gtk-3-tutorial.readthedocs.io/en/latest/introduction.html
 
 Known Issues
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index ad22524833..2d809562d1 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -28,14 +28,14 @@ Creating Your Own Layer
 
 Follow these general steps to create your layer without using tools:
 
-1. *Check Existing Layers:* Before creating a new layer, you should be
+#. *Check Existing Layers:* Before creating a new layer, you should be
    sure someone has not already created a layer containing the Metadata
    you need. You can see the :oe_layerindex:`OpenEmbedded Metadata Index <>`
    for a list of layers from the OpenEmbedded community that can be used in
    the Yocto Project. You could find a layer that is identical or close
    to what you need.
 
-2. *Create a Directory:* Create the directory for your layer. When you
+#. *Create a Directory:* Create the directory for your layer. When you
    create the layer, be sure to create the directory in an area not
    associated with the Yocto Project :term:`Source Directory`
    (e.g. the cloned ``poky`` repository).
@@ -58,7 +58,7 @@ Follow these general steps to create your layer without using tools:
    "meta-" string are appended to several variables used in the
    configuration.
 
-3. *Create a Layer Configuration File:* Inside your new layer folder,
+#. *Create a Layer Configuration File:* Inside your new layer folder,
    you need to create a ``conf/layer.conf`` file. It is easiest to take
    an existing layer configuration file and copy that to your layer's
    ``conf`` directory and then modify the file as needed.
@@ -128,7 +128,7 @@ Follow these general steps to create your layer without using tools:
       variable is a good way to indicate if your particular layer is
       current.
 
-4. *Add Content:* Depending on the type of layer, add the content. If
+#. *Add Content:* Depending on the type of layer, add the content. If
    the layer adds support for a machine, add the machine configuration
    in a ``conf/machine/`` file within the layer. If the layer adds
    distro policy, add the distro configuration in a ``conf/distro/``
@@ -141,7 +141,7 @@ Follow these general steps to create your layer without using tools:
       Yocto Project, see the ":ref:`bsp-guide/bsp:example filesystem layout`"
       section in the Yocto Project Board Support Package (BSP) Developer's Guide.
 
-5. *Optionally Test for Compatibility:* If you want permission to use
+#. *Optionally Test for Compatibility:* If you want permission to use
    the Yocto Project Compatibility logo with your layer or application
    that uses your layer, perform the steps to apply for compatibility.
    See the
@@ -292,13 +292,13 @@ The Yocto Project Compatibility Program consists of a layer application
 process that requests permission to use the Yocto Project Compatibility
 Logo for your layer and application. The process consists of two parts:
 
-1. Successfully passing a script (``yocto-check-layer``) that when run
+#. Successfully passing a script (``yocto-check-layer``) that when run
    against your layer, tests it against constraints based on experiences
    of how layers have worked in the real world and where pitfalls have
    been found. Getting a "PASS" result from the script is required for
    successful compatibility registration.
 
-2. Completion of an application acceptance form, which you can find at
+#. Completion of an application acceptance form, which you can find at
    :yocto_home:`/webform/yocto-project-compatible-registration`.
 
 To be granted permission to use the logo, you need to satisfy the
@@ -870,10 +870,10 @@ checked out first), or into a completely independent location.
 The replication of the layers is performed by running the ``setup-layers`` script provided
 above:
 
-1. Clone the bootstrap layer or some other repository to obtain
+#. Clone the bootstrap layer or some other repository to obtain
    the json config and the setup script that can use it.
 
-2. Run the script directly with no options::
+#. Run the script directly with no options::
 
       alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
       Note: not checking out source meta-alex, use --force-bootstraplayer-checkout to override.
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index afd8bfc945..2decdcb253 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -554,10 +554,10 @@ to use. In your configuration, you use the
 :term:`PACKAGE_CLASSES`
 variable to specify the format:
 
-1. Open the ``local.conf`` file inside your :term:`Build Directory` (e.g.
+#. Open the ``local.conf`` file inside your :term:`Build Directory` (e.g.
    ``poky/build/conf/local.conf``).
 
-2. Select the desired package format as follows::
+#. Select the desired package format as follows::
 
       PACKAGE_CLASSES ?= "package_packageformat"
 
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 084e67580d..d431ea4b99 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -44,13 +44,13 @@ To use QEMU, you need to have QEMU installed and initialized as well as
 have the proper artifacts (i.e. image files and root filesystems)
 available. Follow these general steps to run QEMU:
 
-1. *Install QEMU:* QEMU is made available with the Yocto Project a
+#. *Install QEMU:* QEMU is made available with the Yocto Project a
    number of ways. One method is to install a Software Development Kit
    (SDK). See ":ref:`sdk-manual/intro:the qemu emulator`" section in the
    Yocto Project Application Development and the Extensible Software
    Development Kit (eSDK) manual for information on how to install QEMU.
 
-2. *Setting Up the Environment:* How you set up the QEMU environment
+#. *Setting Up the Environment:* How you set up the QEMU environment
    depends on how you installed QEMU:
 
    -  If you cloned the ``poky`` repository or you downloaded and
@@ -66,7 +66,7 @@ available. Follow these general steps to run QEMU:
 
          . poky_sdk/environment-setup-core2-64-poky-linux
 
-3. *Ensure the Artifacts are in Place:* You need to be sure you have a
+#. *Ensure the Artifacts are in Place:* You need to be sure you have a
    pre-built kernel that will boot in QEMU. You also need the target
    root filesystem for your target machine's architecture:
 
@@ -84,7 +84,7 @@ available. Follow these general steps to run QEMU:
    Extensible Software Development Kit (eSDK) manual for information on
    how to extract a root filesystem.
 
-4. *Run QEMU:* The basic ``runqemu`` command syntax is as follows::
+#. *Run QEMU:* The basic ``runqemu`` command syntax is as follows::
 
       $ runqemu [option ] [...]
 
@@ -184,7 +184,7 @@ the system does not need root privileges to run. It uses a user space
 NFS server to avoid that. Follow these steps to set up for running QEMU
 using an NFS server.
 
-1. *Extract a Root Filesystem:* Once you are able to run QEMU in your
+#. *Extract a Root Filesystem:* Once you are able to run QEMU in your
    environment, you can use the ``runqemu-extract-sdk`` script, which is
    located in the ``scripts`` directory along with the ``runqemu``
    script.
@@ -198,7 +198,7 @@ using an NFS server.
 
       runqemu-extract-sdk ./tmp/deploy/images/qemux86-64/core-image-sato-qemux86-64.tar.bz2 test-nfs
 
-2. *Start QEMU:* Once you have extracted the file system, you can run
+#. *Start QEMU:* Once you have extracted the file system, you can run
    ``runqemu`` normally with the additional location of the file system.
    You can then also make changes to the files within ``./test-nfs`` and
    see those changes appear in the image in real time. Here is an
diff --git a/documentation/dev-manual/quilt.rst b/documentation/dev-manual/quilt.rst
index 1dd9ff02d4..24343e2fac 100644
--- a/documentation/dev-manual/quilt.rst
+++ b/documentation/dev-manual/quilt.rst
@@ -20,32 +20,32 @@ form of a patch all using Quilt.
 
 Follow these general steps:
 
-1. *Find the Source Code:* Temporary source code used by the
+#. *Find the Source Code:* Temporary source code used by the
    OpenEmbedded build system is kept in the :term:`Build Directory`. See the
    ":ref:`dev-manual/temporary-source-code:finding temporary source code`" section to
    learn how to locate the directory that has the temporary source code for a
    particular package.
 
-2. *Change Your Working Directory:* You need to be in the directory that
+#. *Change Your Working Directory:* You need to be in the directory that
    has the temporary source code. That directory is defined by the
    :term:`S` variable.
 
-3. *Create a New Patch:* Before modifying source code, you need to
+#. *Create a New Patch:* Before modifying source code, you need to
    create a new patch. To create a new patch file, use ``quilt new`` as
    below::
 
       $ quilt new my_changes.patch
 
-4. *Notify Quilt and Add Files:* After creating the patch, you need to
+#. *Notify Quilt and Add Files:* After creating the patch, you need to
    notify Quilt about the files you plan to edit. You notify Quilt by
    adding the files to the patch you just created::
 
       $ quilt add file1.c file2.c file3.c
 
-5. *Edit the Files:* Make your changes in the source code to the files
+#. *Edit the Files:* Make your changes in the source code to the files
    you added to the patch.
 
-6. *Test Your Changes:* Once you have modified the source code, the
+#. *Test Your Changes:* Once you have modified the source code, the
    easiest way to test your changes is by calling the :ref:`ref-tasks-compile`
    task as shown in the following example::
 
@@ -65,7 +65,7 @@ Follow these general steps:
       the ":ref:`dev-manual/disk-space:conserving disk space during builds`"
       section.
 
-7. *Generate the Patch:* Once your changes work as expected, you need to
+#. *Generate the Patch:* Once your changes work as expected, you need to
    use Quilt to generate the final patch that contains all your
    modifications::
 
@@ -78,7 +78,7 @@ Follow these general steps:
    You can find the resulting patch file in the ``patches/``
    subdirectory of the source (:term:`S`) directory.
 
-8. *Copy the Patch File:* For simplicity, copy the patch file into a
+#. *Copy the Patch File:* For simplicity, copy the patch file into a
    directory named ``files``, which you can create in the same directory
    that holds the recipe (``.bb``) file or the append (``.bbappend``)
    file. Placing the patch here guarantees that the OpenEmbedded build
diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index 88b3ed541b..36ccf746ee 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -84,25 +84,25 @@ In order to run tests, you need to do the following:
 
 Once you start running the tests, the following happens:
 
-1. A copy of the root filesystem is written to ``${WORKDIR}/testimage``.
+#. A copy of the root filesystem is written to ``${WORKDIR}/testimage``.
 
-2. The image is booted under QEMU using the standard ``runqemu`` script.
+#. The image is booted under QEMU using the standard ``runqemu`` script.
 
-3. A default timeout of 500 seconds occurs to allow for the boot process
+#. A default timeout of 500 seconds occurs to allow for the boot process
    to reach the login prompt. You can change the timeout period by
    setting
    :term:`TEST_QEMUBOOT_TIMEOUT`
    in the ``local.conf`` file.
 
-4. Once the boot process is reached and the login prompt appears, the
+#. Once the boot process is reached and the login prompt appears, the
    tests run. The full boot log is written to
    ``${WORKDIR}/testimage/qemu_boot_log``.
 
-5. Each test module loads in the order found in :term:`TEST_SUITES`. You can
+#. Each test module loads in the order found in :term:`TEST_SUITES`. You can
    find the full output of the commands run over SSH in
    ``${WORKDIR}/testimgage/ssh_target_log``.
 
-6. If no failures occur, the task running the tests ends successfully.
+#. If no failures occur, the task running the tests ends successfully.
    You can find the output from the ``unittest`` in the task log at
    ``${WORKDIR}/temp/log.do_testimage``.
 
@@ -117,13 +117,13 @@ For automated deployment, a "controller image" is installed onto the
 hardware once as part of setup. Then, each time tests are to be run, the
 following occurs:
 
-1. The controller image is booted into and used to write the image to be
+#. The controller image is booted into and used to write the image to be
    tested to a second partition.
 
-2. The device is then rebooted using an external script that you need to
+#. The device is then rebooted using an external script that you need to
    provide.
 
-3. The device boots into the image to be tested.
+#. The device boots into the image to be tested.
 
 When running tests (independent of whether the image has been deployed
 automatically or not), the device is expected to be connected to a
@@ -188,11 +188,11 @@ not need any information in this section. You can skip down to the
 If you did set :term:`TEST_TARGET` to "SystemdbootTarget", you also need to
 perform a one-time setup of your controller image by doing the following:
 
-1. *Set EFI_PROVIDER:* Be sure that :term:`EFI_PROVIDER` is as follows::
+#. *Set EFI_PROVIDER:* Be sure that :term:`EFI_PROVIDER` is as follows::
 
       EFI_PROVIDER = "systemd-boot"
 
-2. *Build the controller image:* Build the ``core-image-testmaster`` image.
+#. *Build the controller image:* Build the ``core-image-testmaster`` image.
    The ``core-image-testmaster`` recipe is provided as an example for a
    "controller" image and you can customize the image recipe as you would
    any other recipe.
@@ -219,13 +219,13 @@ perform a one-time setup of your controller image by doing the following:
       -  Another partition labeled "testrootfs" where test images get
          deployed.
 
-3. *Install image:* Install the image that you just built on the target
+#. *Install image:* Install the image that you just built on the target
    system.
 
 The final thing you need to do when setting :term:`TEST_TARGET` to
 "SystemdbootTarget" is to set up the test image:
 
-1. *Set up your local.conf file:* Make sure you have the following
+#. *Set up your local.conf file:* Make sure you have the following
    statements in your ``local.conf`` file::
 
       IMAGE_FSTYPES += "tar.gz"
@@ -233,7 +233,7 @@ The final thing you need to do when setting :term:`TEST_TARGET` to
       TEST_TARGET = "SystemdbootTarget"
       TEST_TARGET_IP = "192.168.2.3"
 
-2. *Build your test image:* Use BitBake to build the image::
+#. *Build your test image:* Use BitBake to build the image::
 
       $ bitbake core-image-sato
 
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index b02e961608..498734a04d 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -29,7 +29,7 @@ however, keep in mind, the procedure here is simply a starting point.
 You can build off these steps and customize the procedure to fit any
 particular working environment and set of practices.
 
-1.  *Determine Who is Going to be Developing:* You first need to
+#.  *Determine Who is Going to be Developing:* You first need to
     understand who is going to be doing anything related to the Yocto
     Project and determine their roles. Making this determination is
     essential to completing subsequent steps, which are to get your
@@ -52,7 +52,7 @@ particular working environment and set of practices.
        automated tests that are used to ensure all application and core
        system development meets desired quality standards.
 
-2.  *Gather the Hardware:* Based on the size and make-up of the team,
+#.  *Gather the Hardware:* Based on the size and make-up of the team,
     get the hardware together. Ideally, any development, build, or test
     engineer uses a system that runs a supported Linux distribution.
     These systems, in general, should be high performance (e.g. dual,
@@ -66,13 +66,13 @@ particular working environment and set of practices.
        building Yocto Project development containers to be run under
        Docker, which is described later.
 
-3.  *Understand the Hardware Topology of the Environment:* Once you
+#.  *Understand the Hardware Topology of the Environment:* Once you
     understand the hardware involved and the make-up of the team, you
     can understand the hardware topology of the development environment.
     You can get a visual idea of the machines and their roles across the
     development environment.
 
-4.  *Use Git as Your Source Control Manager (SCM):* Keeping your
+#.  *Use Git as Your Source Control Manager (SCM):* Keeping your
     :term:`Metadata` (i.e. recipes,
     configuration files, classes, and so forth) and any software you are
     developing under the control of an SCM system that is compatible
@@ -109,7 +109,7 @@ particular working environment and set of practices.
           Documentation on how to create interfaces and frontends for
           Git.
 
-5.  *Set up the Application Development Machines:* As mentioned earlier,
+#.  *Set up the Application Development Machines:* As mentioned earlier,
     application developers are creating applications on top of existing
     software stacks. Following are some best practices for setting up
     machines used for application development:
@@ -128,7 +128,7 @@ particular working environment and set of practices.
     -  Use multiple toolchains installed locally into different
        locations to allow development across versions.
 
-6.  *Set up the Core Development Machines:* As mentioned earlier, core
+#.  *Set up the Core Development Machines:* As mentioned earlier, core
     developers work on the contents of the operating system itself.
     Following are some best practices for setting up machines used for
     developing images:
@@ -145,7 +145,7 @@ particular working environment and set of practices.
     -  Share layers amongst the developers of a particular project and
        contain the policy configuration that defines the project.
 
-7.  *Set up an Autobuilder:* Autobuilders are often the core of the
+#.  *Set up an Autobuilder:* Autobuilders are often the core of the
     development environment. It is here that changes from individual
     developers are brought together and centrally tested. Based on this
     automated build and test environment, subsequent decisions about
@@ -183,12 +183,12 @@ particular working environment and set of practices.
     -  Allows scheduling of builds so that resources can be used
        efficiently.
 
-8.  *Set up Test Machines:* Use a small number of shared, high
+#.  *Set up Test Machines:* Use a small number of shared, high
     performance systems for testing purposes. Developers can use these
     systems for wider, more extensive testing while they continue to
     develop locally using their primary development system.
 
-9.  *Document Policies and Change Flow:* The Yocto Project uses a
+#.  *Document Policies and Change Flow:* The Yocto Project uses a
     hierarchical structure and a pull model. There are scripts to create and
     send pull requests (i.e. ``create-pull-request`` and
     ``send-pull-request``). This model is in line with other open source
@@ -213,7 +213,7 @@ particular working environment and set of practices.
     possible. Chances are if you have discovered the need for changes,
     someone else in the community needs them also.
 
-10. *Development Environment Summary:* Aside from the previous steps,
+#.  *Development Environment Summary:* Aside from the previous steps,
     here are best practices within the Yocto Project development
     environment:
 
@@ -296,7 +296,7 @@ Setting Up a Native Linux Host
 Follow these steps to prepare a native Linux machine as your Yocto
 Project Build Host:
 
-1. *Use a Supported Linux Distribution:* You should have a reasonably
+#. *Use a Supported Linux Distribution:* You should have a reasonably
    current Linux-based host system. You will have the best results with
    a recent release of Fedora, openSUSE, Debian, Ubuntu, RHEL or CentOS
    as these releases are frequently tested against the Yocto Project and
@@ -306,10 +306,10 @@ Project Build Host:
    section in the Yocto Project Reference Manual and the wiki page at
    :yocto_wiki:`Distribution Support </Distribution_Support>`.
 
-2. *Have Enough Free Memory:* Your system should have at least 50 Gbytes
+#. *Have Enough Free Memory:* Your system should have at least 50 Gbytes
    of free disk space for building images.
 
-3. *Meet Minimal Version Requirements:* The OpenEmbedded build system
+#. *Meet Minimal Version Requirements:* The OpenEmbedded build system
    should be able to run on any modern distribution that has the
    following versions for Git, tar, Python, gcc and make.
 
@@ -329,7 +329,7 @@ Project Build Host:
    ":ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`"
    section in the Yocto Project Reference Manual for information.
 
-4. *Install Development Host Packages:* Required development host
+#. *Install Development Host Packages:* Required development host
    packages vary depending on your build host and what you want to do
    with the Yocto Project. Collectively, the number of required packages
    is large if you want to be able to cover all cases.
@@ -361,7 +361,7 @@ Yocto Project on a Windows, Mac, or Linux machine.
 Follow these general steps to prepare a Windows, Mac, or Linux machine
 as your Yocto Project build host:
 
-1. *Determine What Your Build Host Needs:*
+#. *Determine What Your Build Host Needs:*
    `Docker <https://www.docker.com/what-docker>`__ is a software
    container platform that you need to install on the build host.
    Depending on your build host, you might have to install different
@@ -370,20 +370,20 @@ as your Yocto Project build host:
    Platforms <https://docs.docker.com/engine/install/#supported-platforms>`__"
    your build host needs to run containers.
 
-2. *Choose What To Install:* Depending on whether or not your build host
+#. *Choose What To Install:* Depending on whether or not your build host
    meets system requirements, you need to install "Docker CE Stable" or
    the "Docker Toolbox". Most situations call for Docker CE. However, if
    you have a build host that does not meet requirements (e.g.
    Pre-Windows 10 or Windows 10 "Home" version), you must install Docker
    Toolbox instead.
 
-3. *Go to the Install Site for Your Platform:* Click the link for the
+#. *Go to the Install Site for Your Platform:* Click the link for the
    Docker edition associated with your build host's native software. For
    example, if your build host is running Microsoft Windows Version 10
    and you want the Docker CE Stable edition, click that link under
    "Supported Platforms".
 
-4. *Install the Software:* Once you have understood all the
+#. *Install the Software:* Once you have understood all the
    pre-requisites, you can download and install the appropriate
    software. Follow the instructions for your specific machine and the
    type of the software you need to install:
@@ -412,15 +412,15 @@ as your Yocto Project build host:
       Ubuntu <https://docs.docker.com/engine/install/ubuntu/>`__
       for Linux build hosts running the Ubuntu distribution.
 
-5. *Optionally Orient Yourself With Docker:* If you are unfamiliar with
+#. *Optionally Orient Yourself With Docker:* If you are unfamiliar with
    Docker and the container concept, you can learn more here -
    https://docs.docker.com/get-started/.
 
-6. *Launch Docker or Docker Toolbox:* You should be able to launch
+#. *Launch Docker or Docker Toolbox:* You should be able to launch
    Docker or the Docker Toolbox and have a terminal shell on your
    development host.
 
-7. *Set Up the Containers to Use the Yocto Project:* Go to
+#. *Set Up the Containers to Use the Yocto Project:* Go to
    https://github.com/crops/docker-win-mac-docs/wiki and follow
    the directions for your particular build host (i.e. Linux, Mac, or
    Windows).
@@ -453,7 +453,7 @@ in which you can develop using the Yocto Project.
 Follow these general steps to prepare a Windows machine using WSL 2 as
 your Yocto Project build host:
 
-1. *Make sure your Windows machine is capable of running WSL 2:*
+#. *Make sure your Windows machine is capable of running WSL 2:*
 
    While all Windows 11 and Windows Server 2022 builds support WSL 2,
    the first versions of Windows 10 and Windows Server 2019 didn't.
@@ -469,7 +469,7 @@ your Yocto Project build host:
 
       Microsoft Windows [Version 10.0.19041.153]
 
-2. *Install the Linux distribution of your choice inside WSL 2:*
+#. *Install the Linux distribution of your choice inside WSL 2:*
    Once you know your version of Windows supports WSL 2, you can
    install the distribution of your choice from the Microsoft Store.
    Open the Microsoft Store and search for Linux. While there are
@@ -479,7 +479,7 @@ your Yocto Project build host:
    making your selection, simply click "Get" to download and install the
    distribution.
 
-3. *Check which Linux distribution WSL 2 is using:* Open a Windows
+#. *Check which Linux distribution WSL 2 is using:* Open a Windows
    PowerShell and run::
 
       C:\WINDOWS\system32> wsl -l -v
@@ -489,13 +489,13 @@ your Yocto Project build host:
    Note that WSL 2 supports running as many different Linux distributions
    as you want to install.
 
-4. *Optionally Get Familiar with WSL:* You can learn more on
+#. *Optionally Get Familiar with WSL:* You can learn more on
    https://docs.microsoft.com/en-us/windows/wsl/wsl2-about.
 
-5. *Launch your WSL Distibution:* From the Windows start menu simply
+#. *Launch your WSL Distibution:* From the Windows start menu simply
    launch your WSL distribution just like any other application.
 
-6. *Optimize your WSL 2 storage often:* Due to the way storage is
+#. *Optimize your WSL 2 storage often:* Due to the way storage is
    handled on WSL 2, the storage space used by the underlying Linux
    distribution is not reflected immediately, and since BitBake heavily
    uses storage, after several builds, you may be unaware you are
@@ -597,14 +597,14 @@ repository at :yocto_git:`/poky`.
 Use the following procedure to locate the latest upstream copy of the
 ``poky`` Git repository:
 
-1. *Access Repositories:* Open a browser and go to
+#. *Access Repositories:* Open a browser and go to
    :yocto_git:`/` to access the GUI-based interface into the
    Yocto Project source repositories.
 
-2. *Select the Repository:* Click on the repository in which you are
+#. *Select the Repository:* Click on the repository in which you are
    interested (e.g. ``poky``).
 
-3. *Find the URL Used to Clone the Repository:* At the bottom of the
+#. *Find the URL Used to Clone the Repository:* At the bottom of the
    page, note the URL used to clone that repository
    (e.g. :yocto_git:`/poky`).
 
@@ -630,7 +630,7 @@ of a given component.
 
 Follow these steps to locate and download a particular tarball:
 
-1. *Access the Index of Releases:* Open a browser and go to
+#. *Access the Index of Releases:* Open a browser and go to
    :yocto_dl:`Index of Releases </releases>`. The
    list represents released components (e.g. ``bitbake``, ``sato``, and
    so on).
@@ -642,14 +642,14 @@ Follow these steps to locate and download a particular tarball:
       historically used for very early releases and exists now only for
       retroactive completeness.
 
-2. *Select a Component:* Click on any released component in which you
+#. *Select a Component:* Click on any released component in which you
    are interested (e.g. ``yocto``).
 
-3. *Find the Tarball:* Drill down to find the associated tarball. For
+#. *Find the Tarball:* Drill down to find the associated tarball. For
    example, click on ``yocto-&DISTRO;`` to view files associated with the
    Yocto Project &DISTRO; release.
 
-4. *Download the Tarball:* Click the tarball to download and save a
+#. *Download the Tarball:* Click the tarball to download and save a
    snapshot of the given component.
 
 Using the Downloads Page
@@ -661,13 +661,13 @@ release. Rather than Git repositories, these files represent snapshot
 tarballs similar to the tarballs located in the Index of Releases
 described in the ":ref:`dev-manual/start:accessing index of releases`" section.
 
-1. *Go to the Yocto Project Website:* Open The
+#. *Go to the Yocto Project Website:* Open The
    :yocto_home:`Yocto Project Website <>` in your browser.
 
-2. *Get to the Downloads Area:* Select the "DOWNLOADS" item from the
+#. *Get to the Downloads Area:* Select the "DOWNLOADS" item from the
    pull-down "SOFTWARE" tab menu near the top of the page.
 
-3. *Select a Yocto Project Release:* Use the menu next to "RELEASE" to
+#. *Select a Yocto Project Release:* Use the menu next to "RELEASE" to
    display and choose a recent or past supported Yocto Project release
    (e.g. &DISTRO_NAME_NO_CAP;, &DISTRO_NAME_NO_CAP_MINUS_ONE;, and so forth).
 
@@ -679,7 +679,7 @@ described in the ":ref:`dev-manual/start:accessing index of releases`" section.
    You can use the "RELEASE ARCHIVE" link to reveal a menu of all Yocto
    Project releases.
 
-4. *Download Tools or Board Support Packages (BSPs):* From the
+#. *Download Tools or Board Support Packages (BSPs):* From the
    "DOWNLOADS" page, you can download tools or BSPs as well. Just scroll
    down the page and look for what you need.
 
@@ -707,10 +707,10 @@ Cloning the ``poky`` Repository
 Follow these steps to create a local version of the upstream
 :term:`Poky` Git repository.
 
-1. *Set Your Directory:* Change your working directory to where you want
+#. *Set Your Directory:* Change your working directory to where you want
    to create your local copy of ``poky``.
 
-2. *Clone the Repository:* The following example command clones the
+#. *Clone the Repository:* The following example command clones the
    ``poky`` repository and uses the default name "poky" for your local
    repository::
 
@@ -766,13 +766,13 @@ and then specifically check out that development branch.
    Further development on top of the branch that occurs after check it
    out can occur.
 
-1. *Switch to the Poky Directory:* If you have a local poky Git
+#. *Switch to the Poky Directory:* If you have a local poky Git
    repository, switch to that directory. If you do not have the local
    copy of poky, see the
    ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
    section.
 
-2. *Determine Existing Branch Names:*
+#. *Determine Existing Branch Names:*
    ::
 
       $ git branch -a
@@ -793,7 +793,7 @@ and then specifically check out that development branch.
       remotes/origin/zeus-next
       ... and so on ...
 
-3. *Check out the Branch:* Check out the development branch in which you
+#. *Check out the Branch:* Check out the development branch in which you
    want to work. For example, to access the files for the Yocto Project
    &DISTRO; Release (&DISTRO_NAME;), use the following command::
 
@@ -827,19 +827,19 @@ similar to checking out by branch name except you use tag names.
    Checking out a branch based on a tag gives you a stable set of files
    not affected by development on the branch above the tag.
 
-1. *Switch to the Poky Directory:* If you have a local poky Git
+#. *Switch to the Poky Directory:* If you have a local poky Git
    repository, switch to that directory. If you do not have the local
    copy of poky, see the
    ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
    section.
 
-2. *Fetch the Tag Names:* To checkout the branch based on a tag name,
+#. *Fetch the Tag Names:* To checkout the branch based on a tag name,
    you need to fetch the upstream tags into your local repository::
 
       $ git fetch --tags
       $
 
-3. *List the Tag Names:* You can list the tag names now::
+#. *List the Tag Names:* You can list the tag names now::
 
       $ git tag
       1.1_M1.final
@@ -861,7 +861,7 @@ similar to checking out by branch name except you use tag names.
       yocto_1.5_M5.rc8
 
 
-4. *Check out the Branch:*
+#. *Check out the Branch:*
    ::
 
       $ git checkout tags/yocto-&DISTRO; -b my_yocto_&DISTRO;
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index c41e3e1a5d..dd220cc6c8 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -51,12 +51,12 @@ commit messages in the layer's tree for the changes made to recipes.
 
 The following steps describe how to set up the AUH utility:
 
-1. *Be Sure the Development Host is Set Up:* You need to be sure that
+#. *Be Sure the Development Host is Set Up:* You need to be sure that
    your development host is set up to use the Yocto Project. For
    information on how to set up your host, see the
    ":ref:`dev-manual/start:Preparing the Build Host`" section.
 
-2. *Make Sure Git is Configured:* The AUH utility requires Git to be
+#. *Make Sure Git is Configured:* The AUH utility requires Git to be
    configured because AUH uses Git to save upgrades. Thus, you must have
    Git user and email configured. The following command shows your
    configurations::
@@ -69,7 +69,7 @@ The following steps describe how to set up the AUH utility:
       $ git config --global user.name some_name
       $ git config --global user.email username@domain.com
 
-3. *Clone the AUH Repository:* To use AUH, you must clone the repository
+#. *Clone the AUH Repository:* To use AUH, you must clone the repository
    onto your development host. The following command uses Git to create
    a local copy of the repository on your system::
 
@@ -84,7 +84,7 @@ The following steps describe how to set up the AUH utility:
    AUH is not part of the :term:`OpenEmbedded-Core (OE-Core)` or
    :term:`Poky` repositories.
 
-4. *Create a Dedicated Build Directory:* Run the :ref:`structure-core-script`
+#. *Create a Dedicated Build Directory:* Run the :ref:`structure-core-script`
    script to create a fresh :term:`Build Directory` that you use exclusively
    for running the AUH utility::
 
@@ -95,7 +95,7 @@ The following steps describe how to set up the AUH utility:
    recommended as existing settings could cause AUH to fail or behave
    undesirably.
 
-5. *Make Configurations in Your Local Configuration File:* Several
+#. *Make Configurations in Your Local Configuration File:* Several
    settings are needed in the ``local.conf`` file in the build
    directory you just created for AUH. Make these following
    configurations:
@@ -128,13 +128,13 @@ The following steps describe how to set up the AUH utility:
                  DISTRO_FEATURES:append = " ptest"
 
 
-6. *Optionally Start a vncserver:* If you are running in a server
+#. *Optionally Start a vncserver:* If you are running in a server
    without an X11 session, you need to start a vncserver::
 
       $ vncserver :1
       $ export DISPLAY=:1
 
-7. *Create and Edit an AUH Configuration File:* You need to have the
+#. *Create and Edit an AUH Configuration File:* You need to have the
    ``upgrade-helper/upgrade-helper.conf`` configuration file in your
    :term:`Build Directory`. You can find a sample configuration file in the
    :yocto_git:`AUH source repository </auto-upgrade-helper/tree/>`.
@@ -346,17 +346,17 @@ you can manually edit the recipe files to upgrade the versions.
 
 To manually upgrade recipe versions, follow these general steps:
 
-1. *Change the Version:* Rename the recipe such that the version (i.e.
+#. *Change the Version:* Rename the recipe such that the version (i.e.
    the :term:`PV` part of the recipe name)
    changes appropriately. If the version is not part of the recipe name,
    change the value as it is set for :term:`PV` within the recipe itself.
 
-2. *Update* :term:`SRCREV` *if Needed*: If the source code your recipe builds
+#. *Update* :term:`SRCREV` *if Needed*: If the source code your recipe builds
    is fetched from Git or some other version control system, update
    :term:`SRCREV` to point to the
    commit hash that matches the new version.
 
-3. *Build the Software:* Try to build the recipe using BitBake. Typical
+#. *Build the Software:* Try to build the recipe using BitBake. Typical
    build failures include the following:
 
    -  License statements were updated for the new version. For this
@@ -377,22 +377,22 @@ To manually upgrade recipe versions, follow these general steps:
       issues. If a patch is necessary and failing, you need to rebase it
       into the new version.
 
-4. *Optionally Attempt to Build for Several Architectures:* Once you
+#. *Optionally Attempt to Build for Several Architectures:* Once you
    successfully build the new software for a given architecture, you
    could test the build for other architectures by changing the
    :term:`MACHINE` variable and
    rebuilding the software. This optional step is especially important
    if the recipe is to be released publicly.
 
-5. *Check the Upstream Change Log or Release Notes:* Checking both these
+#. *Check the Upstream Change Log or Release Notes:* Checking both these
    reveals if there are new features that could break
    backwards-compatibility. If so, you need to take steps to mitigate or
    eliminate that situation.
 
-6. *Optionally Create a Bootable Image and Test:* If you want, you can
+#. *Optionally Create a Bootable Image and Test:* If you want, you can
    test the new software by booting it onto actual hardware.
 
-7. *Create a Commit with the Change in the Layer Repository:* After all
+#. *Create a Commit with the Change in the Layer Repository:* After all
    builds work and any testing is successful, you can create commits for
    any changes in the layer holding your upgraded recipe.
 
diff --git a/documentation/dev-manual/wayland.rst b/documentation/dev-manual/wayland.rst
index bcbf40acc5..097be9cbde 100644
--- a/documentation/dev-manual/wayland.rst
+++ b/documentation/dev-manual/wayland.rst
@@ -78,13 +78,13 @@ Alternatively, you can run Weston through the command-line interpretor
 (CLI), which is better suited for development work. To run Weston under
 the CLI, you need to do the following after your image is built:
 
-1. Run these commands to export ``XDG_RUNTIME_DIR``::
+#. Run these commands to export ``XDG_RUNTIME_DIR``::
 
       mkdir -p /tmp/$USER-weston
       chmod 0700 /tmp/$USER-weston
       export XDG_RUNTIME_DIR=/tmp/$USER-weston
 
-2. Launch Weston in the shell::
+#. Launch Weston in the shell::
 
       weston
 
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 7ed887b270..d698cec77c 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -641,7 +641,7 @@ modify the kernel.
 The following example examines the contents of the Wic image, deletes
 the existing kernel, and then inserts a new kernel:
 
-1. *List the Partitions:* Use the ``wic ls`` command to list all the
+#. *List the Partitions:* Use the ``wic ls`` command to list all the
    partitions in the Wic image::
 
       $ wic ls tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic
@@ -652,7 +652,7 @@ the existing kernel, and then inserts a new kernel:
    The previous output shows two partitions in the
    ``core-image-minimal-qemux86.wic`` image.
 
-2. *Examine a Particular Partition:* Use the ``wic ls`` command again
+#. *Examine a Particular Partition:* Use the ``wic ls`` command again
    but in a different form to examine a particular partition.
 
    .. note::
@@ -700,12 +700,12 @@ the existing kernel, and then inserts a new kernel:
                Add mtools_skip_check=1 to your .mtoolsrc file to skip this test
 
 
-3. *Remove the Old Kernel:* Use the ``wic rm`` command to remove the
+#. *Remove the Old Kernel:* Use the ``wic rm`` command to remove the
    ``vmlinuz`` file (kernel)::
 
       $ wic rm tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1/vmlinuz
 
-4. *Add In the New Kernel:* Use the ``wic cp`` command to add the
+#. *Add In the New Kernel:* Use the ``wic cp`` command to add the
    updated kernel to the Wic image. Depending on how you built your
    kernel, it could be in different places. If you used ``devtool`` and
    an SDK to build your kernel, it resides in the ``tmp/work`` directory
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index c4c1f629a6..fd00a9d1dc 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -52,7 +52,7 @@ image and ready to make modifications as described in the
 ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
 section:
 
-1. *Initialize the BitBake Environment:*
+#. *Initialize the BitBake Environment:*
    you need to initialize the BitBake build environment by sourcing
    the build environment script (i.e. :ref:`structure-core-script`)::
 
@@ -66,7 +66,7 @@ section:
       (i.e. ``poky``) have been cloned using Git and the local repository is named
       "poky".
 
-2. *Prepare Your local.conf File:* By default, the :term:`MACHINE` variable
+#. *Prepare Your local.conf File:* By default, the :term:`MACHINE` variable
    is set to "qemux86-64", which is fine if you are building for the QEMU
    emulator in 64-bit mode. However, if you are not, you need to set the
    :term:`MACHINE` variable appropriately in your ``conf/local.conf`` file
@@ -83,7 +83,7 @@ section:
       MACHINE = "qemux86"
       MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"
 
-3. *Create a Layer for Patches:* You need to create a layer to hold
+#. *Create a Layer for Patches:* You need to create a layer to hold
    patches created for the kernel image. You can use the
    ``bitbake-layers create-layer`` command as follows::
 
@@ -106,7 +106,7 @@ section:
       ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
       section in the Yocto Project Development Tasks Manual.
 
-4. *Inform the BitBake Build Environment About Your Layer:* As directed
+#. *Inform the BitBake Build Environment About Your Layer:* As directed
    when you created your layer, you need to add the layer to the
    :term:`BBLAYERS` variable in the
    ``bblayers.conf`` file as follows::
@@ -116,7 +116,7 @@ section:
       NOTE: Starting bitbake server...
       $
 
-5. *Build the Clean Image:* The final step in preparing to work on the
+#. *Build the Clean Image:* The final step in preparing to work on the
    kernel is to build an initial image using ``bitbake``::
 
       $ bitbake core-image-minimal
@@ -158,7 +158,7 @@ this procedure leaves you ready to make modifications to the kernel
 source as described in the ":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
 section:
 
-1. *Initialize the BitBake Environment:* Before you can do anything
+#. *Initialize the BitBake Environment:* Before you can do anything
    using BitBake, you need to initialize the BitBake build environment
    by sourcing the build environment script (i.e.
    :ref:`structure-core-script`).
@@ -181,7 +181,7 @@ section:
       (i.e. ``poky``) have been cloned using Git and the local repository is named
       "poky".
 
-2. *Prepare Your local.conf File:* By default, the :term:`MACHINE` variable is
+#. *Prepare Your local.conf File:* By default, the :term:`MACHINE` variable is
    set to "qemux86-64", which is fine if you are building for the QEMU emulator
    in 64-bit mode. However, if you are not, you need to set the :term:`MACHINE`
    variable appropriately in your ``conf/local.conf`` file found in the
@@ -199,7 +199,7 @@ section:
       MACHINE = "qemux86"
       MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"
 
-3. *Create a Layer for Patches:* You need to create a layer to hold
+#. *Create a Layer for Patches:* You need to create a layer to hold
    patches created for the kernel image. You can use the
    ``bitbake-layers create-layer`` command as follows::
 
@@ -221,7 +221,7 @@ section:
       ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
       section in the Yocto Project Development Tasks Manual.
 
-4. *Inform the BitBake Build Environment About Your Layer:* As directed
+#. *Inform the BitBake Build Environment About Your Layer:* As directed
    when you created your layer, you need to add the layer to the
    :term:`BBLAYERS` variable in the
    ``bblayers.conf`` file as follows::
@@ -231,7 +231,7 @@ section:
       NOTE: Starting bitbake server ...
       $
 
-5. *Create a Local Copy of the Kernel Git Repository:* You can find Git
+#. *Create a Local Copy of the Kernel Git Repository:* You can find Git
    repositories of supported Yocto Project kernels organized under
    "Yocto Linux Kernel" in the Yocto Project Source Repositories at
    :yocto_git:`/`.
@@ -262,7 +262,7 @@ section:
       You cannot use the ``linux-yocto-4.12`` kernel with releases prior to
       Yocto Project 2.4.
 
-6. *Create a Local Copy of the Kernel Cache Git Repository:* For
+#. *Create a Local Copy of the Kernel Cache Git Repository:* For
    simplicity, it is recommended that you create your copy of the kernel
    cache Git repository outside of the
    :term:`Source Directory`, which is
@@ -313,7 +313,7 @@ following section describes how to create a layer without the aid of
 tools. These steps assume creation of a layer named ``mylayer`` in your
 home directory:
 
-1. *Create Structure*: Create the layer's structure::
+#. *Create Structure*: Create the layer's structure::
 
       $ mkdir meta-mylayer
       $ mkdir meta-mylayer/conf
@@ -325,7 +325,7 @@ home directory:
    ``recipes-kernel`` directory holds your append file and eventual
    patch files.
 
-2. *Create the Layer Configuration File*: Move to the
+#. *Create the Layer Configuration File*: Move to the
    ``meta-mylayer/conf`` directory and create the ``layer.conf`` file as
    follows::
 
@@ -342,7 +342,7 @@ home directory:
 
    Notice ``mylayer`` as part of the last three statements.
 
-3. *Create the Kernel Recipe Append File*: Move to the
+#. *Create the Kernel Recipe Append File*: Move to the
    ``meta-mylayer/recipes-kernel/linux`` directory and create the
    kernel's append file. This example uses the ``linux-yocto-4.12``
    kernel. Thus, the name of the append file is
@@ -695,7 +695,7 @@ modified image causes the added messages to appear on the emulator's
 console. The example is a continuation of the setup procedure found in
 the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Section.
 
-1. *Check Out the Kernel Source Files:* First you must use ``devtool``
+#. *Check Out the Kernel Source Files:* First you must use ``devtool``
    to checkout the kernel source code in its workspace.
 
    .. note::
@@ -723,10 +723,10 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
       You can safely ignore these messages. The source code is correctly
       checked out.
 
-2. *Edit the Source Files* Follow these steps to make some simple
+#. *Edit the Source Files* Follow these steps to make some simple
    changes to the source files:
 
-   1. *Change the working directory*: In the previous step, the output
+   #. *Change the working directory*: In the previous step, the output
       noted where you can find the source files (e.g.
       ``poky_sdk/workspace/sources/linux-yocto``). Change to where the
       kernel source code is before making your edits to the
@@ -734,7 +734,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
 
          $ cd poky_sdk/workspace/sources/linux-yocto
 
-   2. *Edit the source file*: Edit the ``init/calibrate.c`` file to have
+   #. *Edit the source file*: Edit the ``init/calibrate.c`` file to have
       the following changes::
 
          void calibrate_delay(void)
@@ -754,12 +754,12 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
                    .
                    .
 
-3. *Build the Updated Kernel Source:* To build the updated kernel
+#. *Build the Updated Kernel Source:* To build the updated kernel
    source, use ``devtool``::
 
       $ devtool build linux-yocto
 
-4. *Create the Image With the New Kernel:* Use the
+#. *Create the Image With the New Kernel:* Use the
    ``devtool build-image`` command to create a new image that has the
    new kernel::
 
@@ -774,15 +774,15 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
       :yocto_wiki:`TipsAndTricks/KernelDevelopmentWithEsdk </TipsAndTricks/KernelDevelopmentWithEsdk>`
       Wiki Page.
 
-5. *Test the New Image:* For this example, you can run the new image
+#. *Test the New Image:* For this example, you can run the new image
    using QEMU to verify your changes:
 
-   1. *Boot the image*: Boot the modified image in the QEMU emulator
+   #. *Boot the image*: Boot the modified image in the QEMU emulator
       using this command::
 
          $ runqemu qemux86
 
-   2. *Verify the changes*: Log into the machine using ``root`` with no
+   #. *Verify the changes*: Log into the machine using ``root`` with no
       password and then use the following shell command to scroll
       through the console's boot output.
 
@@ -794,7 +794,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
       the results of your ``printk`` statements as part of the output
       when you scroll down the console window.
 
-6. *Stage and commit your changes*: Change
+#. *Stage and commit your changes*: Change
    your working directory to where you modified the ``calibrate.c`` file
    and use these Git commands to stage and commit your changes::
 
@@ -803,7 +803,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
       $ git add init/calibrate.c
       $ git commit -m "calibrate: Add printk example"
 
-7. *Export the Patches and Create an Append File:* To export your
+#. *Export the Patches and Create an Append File:* To export your
    commits as patches and create a ``.bbappend`` file, use the following
    command. This example uses the previously established layer named ``meta-mylayer``::
 
@@ -819,7 +819,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
    finishes, the patches and the ``.bbappend`` file are located in the
    ``~/meta-mylayer/recipes-kernel/linux`` directory.
 
-8. *Build the Image With Your Modified Kernel:* You can now build an
+#. *Build the Image With Your Modified Kernel:* You can now build an
    image that includes your kernel patches. Execute the following
    command from your :term:`Build Directory` in the terminal
    set up to run BitBake::
@@ -857,20 +857,20 @@ found in the
 ":ref:`kernel-dev/common:getting ready for traditional kernel development`"
 Section.
 
-1. *Edit the Source Files* Prior to this step, you should have used Git
+#. *Edit the Source Files* Prior to this step, you should have used Git
    to create a local copy of the repository for your kernel. Assuming
    you created the repository as directed in the
    ":ref:`kernel-dev/common:getting ready for traditional kernel development`"
    section, use the following commands to edit the ``calibrate.c`` file:
 
-   1. *Change the working directory*: You need to locate the source
+   #. *Change the working directory*: You need to locate the source
       files in the local copy of the kernel Git repository. Change to
       where the kernel source code is before making your edits to the
       ``calibrate.c`` file::
 
          $ cd ~/linux-yocto-4.12/init
 
-   2. *Edit the source file*: Edit the ``calibrate.c`` file to have the
+   #. *Edit the source file*: Edit the ``calibrate.c`` file to have the
       following changes::
 
          void calibrate_delay(void)
@@ -890,7 +890,7 @@ Section.
                    .
                    .
 
-2. *Stage and Commit Your Changes:* Use standard Git commands to stage
+#. *Stage and Commit Your Changes:* Use standard Git commands to stage
    and commit the changes you just made::
 
       $ git add calibrate.c
@@ -900,7 +900,7 @@ Section.
    stage and commit your changes, the OpenEmbedded Build System will not
    pick up the changes.
 
-3. *Update Your local.conf File to Point to Your Source Files:* In
+#. *Update Your local.conf File to Point to Your Source Files:* In
    addition to your ``local.conf`` file specifying to use
    "kernel-modules" and the "qemux86" machine, it must also point to the
    updated kernel source files. Add
@@ -924,21 +924,21 @@ Section.
       be sure to specify the correct branch and machine types. For this
       example, the branch is ``standard/base`` and the machine is ``qemux86``.
 
-4. *Build the Image:* With the source modified, your changes staged and
+#. *Build the Image:* With the source modified, your changes staged and
    committed, and the ``local.conf`` file pointing to the kernel files,
    you can now use BitBake to build the image::
 
       $ cd poky/build
       $ bitbake core-image-minimal
 
-5. *Boot the image*: Boot the modified image in the QEMU emulator using
+#. *Boot the image*: Boot the modified image in the QEMU emulator using
    this command. When prompted to login to the QEMU console, use "root"
    with no password::
 
       $ cd poky/build
       $ runqemu qemux86
 
-6. *Look for Your Changes:* As QEMU booted, you might have seen your
+#. *Look for Your Changes:* As QEMU booted, you might have seen your
    changes rapidly scroll by. If not, use these commands to see your
    changes:
 
@@ -950,7 +950,7 @@ Section.
    ``printk`` statements as part of the output when you scroll down the
    console window.
 
-7. *Generate the Patch File:* Once you are sure that your patch works
+#. *Generate the Patch File:* Once you are sure that your patch works
    correctly, you can generate a ``*.patch`` file in the kernel source
    repository::
 
@@ -958,7 +958,7 @@ Section.
       $ git format-patch -1
       0001-calibrate.c-Added-some-printk-statements.patch
 
-8. *Move the Patch File to Your Layer:* In order for subsequent builds
+#. *Move the Patch File to Your Layer:* In order for subsequent builds
    to pick up patches, you need to move the patch file you created in
    the previous step to your layer ``meta-mylayer``. For this example,
    the layer created earlier is located in your home directory as
@@ -978,7 +978,7 @@ Section.
 
       $ mv ~/linux-yocto-4.12/init/0001-calibrate.c-Added-some-printk-statements.patch ~/meta-mylayer/recipes-kernel/linux/linux-yocto
 
-9. *Create the Append File:* Finally, you need to create the
+#. *Create the Append File:* Finally, you need to create the
    ``linux-yocto_4.12.bbappend`` file and insert statements that allow
    the OpenEmbedded build system to find the patch. The append file
    needs to be in your layer's ``recipes-kernel/linux`` directory and it
@@ -1223,7 +1223,7 @@ saved, and one freshly created using the ``menuconfig`` tool.
 To create a configuration fragment using this method, follow these
 steps:
 
-1. *Complete a Build Through Kernel Configuration:* Complete a build at
+#. *Complete a Build Through Kernel Configuration:* Complete a build at
    least through the kernel configuration task as follows::
 
       $ bitbake linux-yocto -c kernel_configme -f
@@ -1233,11 +1233,11 @@ steps:
    your build state might become unknown, it is best to run this task
    prior to starting ``menuconfig``.
 
-2. *Launch menuconfig:* Run the ``menuconfig`` command::
+#. *Launch menuconfig:* Run the ``menuconfig`` command::
 
       $ bitbake linux-yocto -c menuconfig
 
-3. *Create the Configuration Fragment:* Run the ``diffconfig`` command
+#. *Create the Configuration Fragment:* Run the ``diffconfig`` command
    to prepare a configuration fragment. The resulting file
    ``fragment.cfg`` is placed in the
    ``${``\ :term:`WORKDIR`\ ``}``
@@ -1408,17 +1408,17 @@ configuration.
 
 To streamline the configuration, do the following:
 
-1. *Use a Working Configuration:* Start with a full configuration that
+#. *Use a Working Configuration:* Start with a full configuration that
    you know works. Be sure the configuration builds and boots
    successfully. Use this configuration file as your baseline.
 
-2. *Run Configure and Check Tasks:* Separately run the
+#. *Run Configure and Check Tasks:* Separately run the
    :ref:`ref-tasks-kernel_configme` and :ref:`ref-tasks-kernel_configcheck` tasks::
 
       $ bitbake linux-yocto -c kernel_configme -f
       $ bitbake linux-yocto -c kernel_configcheck -f
 
-3. *Process the Results:* Take the resulting list of files from the
+#. *Process the Results:* Take the resulting list of files from the
    :ref:`ref-tasks-kernel_configcheck` task warnings and do the following:
 
    -  Drop values that are redefined in the fragment but do not change
@@ -1431,7 +1431,7 @@ To streamline the configuration, do the following:
 
    -  Remove repeated and invalid options.
 
-4. *Re-Run Configure and Check Tasks:* After you have worked through the
+#. *Re-Run Configure and Check Tasks:* After you have worked through the
    output of the kernel configuration audit, you can re-run the
    :ref:`ref-tasks-kernel_configme` and :ref:`ref-tasks-kernel_configcheck` tasks to see the
    results of your changes. If you have more issues, you can deal with
@@ -1462,20 +1462,20 @@ If you build a kernel image and the version string has a "+" or a
 "-dirty" at the end, it means there are uncommitted modifications in the kernel's
 source directory. Follow these steps to clean up the version string:
 
-1. *Discover the Uncommitted Changes:* Go to the kernel's locally cloned
+#. *Discover the Uncommitted Changes:* Go to the kernel's locally cloned
    Git repository (source directory) and use the following Git command
    to list the files that have been changed, added, or removed::
 
       $ git status
 
-2. *Commit the Changes:* You should commit those changes to the kernel
+#. *Commit the Changes:* You should commit those changes to the kernel
    source tree regardless of whether or not you will save, export, or
    use the changes::
 
       $ git add
       $ git commit -s -a -m "getting rid of -dirty"
 
-3. *Rebuild the Kernel Image:* Once you commit the changes, rebuild the
+#. *Rebuild the Kernel Image:* Once you commit the changes, rebuild the
    kernel.
 
    Depending on your particular kernel development workflow, the
@@ -1509,18 +1509,18 @@ You can find this recipe in the ``poky`` Git repository:
 
 Here are some basic steps you can use to work with your own sources:
 
-1. *Create a Copy of the Kernel Recipe:* Copy the
+#. *Create a Copy of the Kernel Recipe:* Copy the
    ``linux-yocto-custom.bb`` recipe to your layer and give it a
    meaningful name. The name should include the version of the Yocto
    Linux kernel you are using (e.g. ``linux-yocto-myproject_4.12.bb``,
    where "4.12" is the base version of the Linux kernel with which you
    would be working).
 
-2. *Create a Directory for Your Patches:* In the same directory inside
+#. *Create a Directory for Your Patches:* In the same directory inside
    your layer, create a matching directory to store your patches and
    configuration files (e.g. ``linux-yocto-myproject``).
 
-3. *Ensure You Have Configurations:* Make sure you have either a
+#. *Ensure You Have Configurations:* Make sure you have either a
    ``defconfig`` file or configuration fragment files in your layer.
    When you use the ``linux-yocto-custom.bb`` recipe, you must specify a
    configuration. If you do not have a ``defconfig`` file, you can run
@@ -1545,7 +1545,7 @@ Here are some basic steps you can use to work with your own sources:
    ``arch/arm/configs`` and use the one that is the best starting point
    for your board).
 
-4. *Edit the Recipe:* Edit the following variables in your recipe as
+#. *Edit the Recipe:* Edit the following variables in your recipe as
    appropriate for your project:
 
    -  :term:`SRC_URI`: The
@@ -1594,7 +1594,7 @@ Here are some basic steps you can use to work with your own sources:
 
          COMPATIBLE_MACHINE = "qemux86|qemux86-64"
 
-5. *Customize Your Recipe as Needed:* Provide further customizations to
+#. *Customize Your Recipe as Needed:* Provide further customizations to
    your recipe as needed just as you would customize an existing
    linux-yocto recipe. See the
    ":ref:`ref-manual/devtool-reference:modifying an existing recipe`" section
@@ -1826,7 +1826,7 @@ kernel features.
 Consider the following example that adds the "test.scc" feature to the
 build.
 
-1. *Create the Feature File:* Create a ``.scc`` file and locate it just
+#. *Create the Feature File:* Create a ``.scc`` file and locate it just
    as you would any other patch file, ``.cfg`` file, or fetcher item you
    specify in the :term:`SRC_URI` statement.
 
@@ -1854,7 +1854,7 @@ build.
    ``linux-yocto`` directory has both the feature ``test.scc`` file and
    a similarly named configuration fragment file ``test.cfg``.
 
-2. *Add the Feature File to SRC_URI:* Add the ``.scc`` file to the
+#. *Add the Feature File to SRC_URI:* Add the ``.scc`` file to the
    recipe's :term:`SRC_URI` statement::
 
       SRC_URI += "file://test.scc"
@@ -1862,7 +1862,7 @@ build.
    The leading space before the path is important as the path is
    appended to the existing path.
 
-3. *Specify the Feature as a Kernel Feature:* Use the
+#. *Specify the Feature as a Kernel Feature:* Use the
    :term:`KERNEL_FEATURES` statement to specify the feature as a kernel
    feature::
 
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index 06cc884386..a663733a1d 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -108,12 +108,12 @@ general information and references for further information.
 .. image:: figures/kernel-dev-flow.png
    :width: 100%
 
-1. *Set up Your Host Development System to Support Development Using the
+#. *Set up Your Host Development System to Support Development Using the
    Yocto Project*: See the ":doc:`/dev-manual/start`" section in
    the Yocto Project Development Tasks Manual for options on how to get
    a build host ready to use the Yocto Project.
 
-2. *Set Up Your Host Development System for Kernel Development:* It is
+#. *Set Up Your Host Development System for Kernel Development:* It is
    recommended that you use ``devtool`` for kernel
    development. Alternatively, you can use traditional kernel
    development methods with the Yocto Project. Either way, there are
@@ -131,7 +131,7 @@ general information and references for further information.
    ":ref:`kernel-dev/common:getting ready for traditional kernel development`"
    section.
 
-3. *Make Changes to the Kernel Source Code if applicable:* Modifying the
+#. *Make Changes to the Kernel Source Code if applicable:* Modifying the
    kernel does not always mean directly changing source files. However,
    if you have to do this, you make the changes to the files in the
    Yocto's :term:`Build Directory` if you are using ``devtool``. For more
@@ -144,7 +144,7 @@ general information and references for further information.
    ":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
    section.
 
-4. *Make Kernel Configuration Changes if Applicable:* If your situation
+#. *Make Kernel Configuration Changes if Applicable:* If your situation
    calls for changing the kernel's configuration, you can use
    :ref:`menuconfig <kernel-dev/common:using \`\`menuconfig\`\`>`,
    which allows you to
@@ -169,7 +169,7 @@ general information and references for further information.
    Additionally, if you are working in a BSP layer and need to modify
    the BSP's kernel's configuration, you can use ``menuconfig``.
 
-5. *Rebuild the Kernel Image With Your Changes:* Rebuilding the kernel
+#. *Rebuild the Kernel Image With Your Changes:* Rebuilding the kernel
    image applies your changes. Depending on your target hardware, you
    can verify your changes on actual hardware or perhaps QEMU.
 
diff --git a/documentation/kernel-dev/maint-appx.rst b/documentation/kernel-dev/maint-appx.rst
index 6aa2fb7cf1..53b7376089 100644
--- a/documentation/kernel-dev/maint-appx.rst
+++ b/documentation/kernel-dev/maint-appx.rst
@@ -92,11 +92,11 @@ top-level kernel feature or BSP. The following actions effectively
 provide the Metadata and create the tree that includes the new feature,
 patch, or BSP:
 
-1. *Pass Feature to the OpenEmbedded Build System:* A top-level kernel
+#. *Pass Feature to the OpenEmbedded Build System:* A top-level kernel
    feature is passed to the kernel build subsystem. Normally, this
    feature is a BSP for a particular kernel type.
 
-2. *Locate Feature:* The file that describes the top-level feature is
+#. *Locate Feature:* The file that describes the top-level feature is
    located by searching these system directories:
 
    -  The in-tree kernel-cache directories, which are located in the
@@ -112,31 +112,31 @@ patch, or BSP:
 
       bsp_root_name-kernel_type.scc
 
-3. *Expand Feature:* Once located, the feature description is either
+#. *Expand Feature:* Once located, the feature description is either
    expanded into a simple script of actions, or into an existing
    equivalent script that is already part of the shipped kernel.
 
-4. *Append Extra Features:* Extra features are appended to the top-level
+#. *Append Extra Features:* Extra features are appended to the top-level
    feature description. These features can come from the
    :term:`KERNEL_FEATURES`
    variable in recipes.
 
-5. *Locate, Expand, and Append Each Feature:* Each extra feature is
+#. *Locate, Expand, and Append Each Feature:* Each extra feature is
    located, expanded and appended to the script as described in step
    three.
 
-6. *Execute the Script:* The script is executed to produce files
+#. *Execute the Script:* The script is executed to produce files
    ``.scc`` and ``.cfg`` files in appropriate directories of the
    ``yocto-kernel-cache`` repository. These files are descriptions of
    all the branches, tags, patches and configurations that need to be
    applied to the base Git repository to completely create the source
    (build) branch for the new BSP or feature.
 
-7. *Clone Base Repository:* The base repository is cloned, and the
+#. *Clone Base Repository:* The base repository is cloned, and the
    actions listed in the ``yocto-kernel-cache`` directories are applied
    to the tree.
 
-8. *Perform Cleanup:* The Git repositories are left with the desired
+#. *Perform Cleanup:* The Git repositories are left with the desired
    branches checked out and any required branching, patching and tagging
    has been performed.
 
diff --git a/documentation/migration-guides/migration-general.rst b/documentation/migration-guides/migration-general.rst
index c350a4df97..c3b8a785db 100644
--- a/documentation/migration-guides/migration-general.rst
+++ b/documentation/migration-guides/migration-general.rst
@@ -81,11 +81,11 @@ any new Yocto Project release.
    the migration (e.g. added/removed packages, added/removed files, size
    changes etc.). To do this, follow these steps:
 
-   1. Enable :ref:`buildhistory <ref-classes-buildhistory>` before the migration
+   #. Enable :ref:`buildhistory <ref-classes-buildhistory>` before the migration
 
-   2. Run a pre-migration build
+   #. Run a pre-migration build
 
-   3. Capture the :ref:`buildhistory <ref-classes-buildhistory>` output (as
+   #. Capture the :ref:`buildhistory <ref-classes-buildhistory>` output (as
       specified by :term:`BUILDHISTORY_DIR`) and ensure it is preserved for
       subsequent builds. How you would do this depends on how you are running
       your builds - if you are doing this all on one workstation in the same
@@ -93,15 +93,15 @@ any new Yocto Project release.
       deleting the :ref:`buildhistory <ref-classes-buildhistory>` output
       directory. For builds in a pipeline it may be more complicated.
 
-   4. Set a tag in the :ref:`buildhistory <ref-classes-buildhistory>` output (which is a git repository) before
+   #. Set a tag in the :ref:`buildhistory <ref-classes-buildhistory>` output (which is a git repository) before
       migration, to make the commit from the pre-migration build easy to find
       as you may end up running multiple builds during the migration.
 
-   5. Perform the migration
+   #. Perform the migration
 
-   6. Run a build
+   #. Run a build
 
-   7. Check the output changes between the previously set tag and HEAD in the
+   #. Check the output changes between the previously set tag and HEAD in the
       :ref:`buildhistory <ref-classes-buildhistory>` output using ``git diff`` or ``buildhistory-diff``.
 
    For more information on using :ref:`buildhistory <ref-classes-buildhistory>`, see
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 600b46910e..4c847a09de 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -517,18 +517,18 @@ Historically, the Build Appliance was the second of three methods by
 which you could use the Yocto Project on a system that was not native to
 Linux.
 
-1. *Hob:* Hob, which is now deprecated and is no longer available since
+#. *Hob:* Hob, which is now deprecated and is no longer available since
    the 2.1 release of the Yocto Project provided a rudimentary,
    GUI-based interface to the Yocto Project. Toaster has fully replaced
    Hob.
 
-2. *Build Appliance:* Post Hob, the Build Appliance became available. It
+#. *Build Appliance:* Post Hob, the Build Appliance became available. It
    was never recommended that you use the Build Appliance as a
    day-to-day production development environment with the Yocto Project.
    Build Appliance was useful as a way to try out development in the
    Yocto Project environment.
 
-3. *CROPS:* The final and best solution available now for developing
+#. *CROPS:* The final and best solution available now for developing
    using the Yocto Project on a system not native to Linux is with
    :ref:`CROPS <overview-manual/yp-intro:development tools>`.
 
@@ -719,27 +719,27 @@ workflow:
 
 Following is a brief summary of the "workflow":
 
-1. Developers specify architecture, policies, patches and configuration
+#. Developers specify architecture, policies, patches and configuration
    details.
 
-2. The build system fetches and downloads the source code from the
+#. The build system fetches and downloads the source code from the
    specified location. The build system supports standard methods such
    as tarballs or source code repositories systems such as Git.
 
-3. Once source code is downloaded, the build system extracts the sources
+#. Once source code is downloaded, the build system extracts the sources
    into a local work area where patches are applied and common steps for
    configuring and compiling the software are run.
 
-4. The build system then installs the software into a temporary staging
+#. The build system then installs the software into a temporary staging
    area where the binary package format you select (DEB, RPM, or IPK) is
    used to roll up the software.
 
-5. Different QA and sanity checks run throughout entire build process.
+#. Different QA and sanity checks run throughout entire build process.
 
-6. After the binaries are created, the build system generates a binary
+#. After the binaries are created, the build system generates a binary
    package feed that is used to create the final root file image.
 
-7. The build system generates the file system image and a customized
+#. The build system generates the file system image and a customized
    Extensible SDK (eSDK) for application development in parallel.
 
 For a very detailed look at this workflow, see the
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index de5f108fb1..7f760c5ba4 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -979,11 +979,11 @@ by default (as specified by :term:`IMAGE_BUILDINFO_FILE`).
 This can be useful for manually determining the origin of any given
 image. It writes out two sections:
 
-1. `Build Configuration`: a list of variables and their values (specified
+#. `Build Configuration`: a list of variables and their values (specified
    by :term:`IMAGE_BUILDINFO_VARS`, which defaults to :term:`DISTRO` and
    :term:`DISTRO_VERSION`)
 
-2. `Layer Revisions`: the revisions of all of the layers used in the
+#. `Layer Revisions`: the revisions of all of the layers used in the
    build.
 
 Additionally, when building an SDK it will write the same contents
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 8dab359b69..3f27c03e44 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -235,7 +235,7 @@ The ``install-buildtools`` script is the easiest of the three methods by
 which you can get these tools. It downloads a pre-built buildtools
 installer and automatically installs the tools for you:
 
-1. Execute the ``install-buildtools`` script. Here is an example::
+#. Execute the ``install-buildtools`` script. Here is an example::
 
       $ cd poky
       $ scripts/install-buildtools \
@@ -268,7 +268,7 @@ installer and automatically installs the tools for you:
       $ cd poky
       $ scripts/install-buildtools --make-only
 
-2. Source the tools environment setup script by using a command like the
+#. Source the tools environment setup script by using a command like the
    following::
 
       $ source /path/to/poky/buildtools/environment-setup-x86_64-pokysdk-linux
@@ -291,9 +291,9 @@ If you would prefer not to use the ``install-buildtools`` script, you can instea
 download and run a pre-built buildtools installer yourself with the following
 steps:
 
-1. Locate and download the ``*.sh`` at :yocto_dl:`/releases/yocto/yocto-&DISTRO;/buildtools/`
+#. Locate and download the ``*.sh`` at :yocto_dl:`/releases/yocto/yocto-&DISTRO;/buildtools/`
 
-2. Execute the installation script. Here is an example for the
+#. Execute the installation script. Here is an example for the
    traditional installer::
 
       $ sh ~/Downloads/x86_64-buildtools-nativesdk-standalone-&DISTRO;.sh
@@ -310,7 +310,7 @@ steps:
    installation directory. For example, you could choose the following:
    ``/home/your-username/buildtools``
 
-3. Source the tools environment setup script by using a command like the
+#. Source the tools environment setup script by using a command like the
    following::
 
       $ source /home/your_username/buildtools/environment-setup-i586-poky-linux
@@ -339,11 +339,11 @@ Python (or gcc) requirements.
 Here are the steps to take to build and run your own buildtools
 installer:
 
-1. On the machine that is able to run BitBake, be sure you have set up
+#. On the machine that is able to run BitBake, be sure you have set up
    your build environment with the setup script
    (:ref:`structure-core-script`).
 
-2. Run the BitBake command to build the tarball::
+#. Run the BitBake command to build the tarball::
 
       $ bitbake buildtools-tarball
 
@@ -365,10 +365,10 @@ installer:
    :term:`Build Directory`. The installer file has the string
    "buildtools" (or "buildtools-extended") in the name.
 
-3. Transfer the ``.sh`` file from the build host to the machine that
+#. Transfer the ``.sh`` file from the build host to the machine that
    does not meet the Git, tar, or Python (or gcc) requirements.
 
-4. On the machine that does not meet the requirements, run the ``.sh``
+#. On the machine that does not meet the requirements, run the ``.sh``
    file to install the tools. Here is an example for the traditional
    installer::
 
@@ -386,7 +386,7 @@ installer:
    installation directory. For example, you could choose the following:
    ``/home/your_username/buildtools``
 
-5. Source the tools environment setup script by using a command like the
+#. Source the tools environment setup script by using a command like the
    following::
 
       $ source /home/your_username/buildtools/environment-setup-x86_64-poky-linux
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 499a26f50b..8ed55ad7b3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5868,25 +5868,25 @@ system and gives an overview of their function and contents.
       omit any argument you like but must retain the separating commas. The
       order is important and specifies the following:
 
-      1. Extra arguments that should be added to the configure script
+      #. Extra arguments that should be added to the configure script
          argument list (:term:`EXTRA_OECONF` or
          :term:`PACKAGECONFIG_CONFARGS`) if
          the feature is enabled.
 
-      2. Extra arguments that should be added to :term:`EXTRA_OECONF` or
+      #. Extra arguments that should be added to :term:`EXTRA_OECONF` or
          :term:`PACKAGECONFIG_CONFARGS` if the feature is disabled.
 
-      3. Additional build dependencies (:term:`DEPENDS`)
+      #. Additional build dependencies (:term:`DEPENDS`)
          that should be added if the feature is enabled.
 
-      4. Additional runtime dependencies (:term:`RDEPENDS`)
+      #. Additional runtime dependencies (:term:`RDEPENDS`)
          that should be added if the feature is enabled.
 
-      5. Additional runtime recommendations
+      #. Additional runtime recommendations
          (:term:`RRECOMMENDS`) that should be added if
          the feature is enabled.
 
-      6. Any conflicting (that is, mutually exclusive) :term:`PACKAGECONFIG`
+      #. Any conflicting (that is, mutually exclusive) :term:`PACKAGECONFIG`
          settings for this feature.
 
       Consider the following :term:`PACKAGECONFIG` block taken from the
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 45ad54fd76..c1a36c471d 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -173,12 +173,12 @@ perform additional steps. These steps make it possible for anyone using
 the installed SDKs to update the installed SDKs by using the
 ``devtool sdk-update`` command:
 
-1. Create a directory that can be shared over HTTP or HTTPS. You can do
+#. Create a directory that can be shared over HTTP or HTTPS. You can do
    this by setting up a web server such as an :wikipedia:`Apache HTTP Server
    <Apache_HTTP_Server>` or :wikipedia:`Nginx <Nginx>` server in the cloud
    to host the directory. This directory must contain the published SDK.
 
-2. Set the
+#. Set the
    :term:`SDK_UPDATE_URL`
    variable to point to the corresponding HTTP or HTTPS URL. Setting
    this variable causes any SDK built to default to that URL and thus,
@@ -187,10 +187,10 @@ the installed SDKs to update the installed SDKs by using the
    ":ref:`sdk-manual/extensible:applying updates to an installed extensible sdk`"
    section.
 
-3. Build the extensible SDK normally (i.e., use the
+#. Build the extensible SDK normally (i.e., use the
    ``bitbake -c populate_sdk_ext`` imagename command).
 
-4. Publish the SDK using the following command::
+#. Publish the SDK using the following command::
 
       $ oe-publish-sdk some_path/sdk-installer.sh path_to_shared_http_directory
 
@@ -245,7 +245,7 @@ If you want the users of an extensible SDK you build to be able to add
 items to the SDK without requiring the users to build the items from
 source, you need to do a number of things:
 
-1. Ensure the additional items you want the user to be able to install
+#. Ensure the additional items you want the user to be able to install
    are already built:
 
    -  Build the items explicitly. You could use one or more "meta"
@@ -257,12 +257,12 @@ source, you need to do a number of things:
       :term:`EXCLUDE_FROM_WORLD`
       variable for additional information.
 
-2. Expose the ``sstate-cache`` directory produced by the build.
+#. Expose the ``sstate-cache`` directory produced by the build.
    Typically, you expose this directory by making it available through
    an :wikipedia:`Apache HTTP Server <Apache_HTTP_Server>` or
    :wikipedia:`Nginx <Nginx>` server.
 
-3. Set the appropriate configuration so that the produced SDK knows how
+#. Set the appropriate configuration so that the produced SDK knows how
    to find the configuration. The variable you need to set is
    :term:`SSTATE_MIRRORS`::
 
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index fa82af5c22..ba844507d3 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -28,14 +28,14 @@ and then run the script to hand-install the toolchain.
 
 Follow these steps to locate and hand-install the toolchain:
 
-1. *Go to the Installers Directory:* Go to
+#. *Go to the Installers Directory:* Go to
    :yocto_dl:`/releases/yocto/yocto-&DISTRO;/toolchain/`
 
-2. *Open the Folder for Your Build Host:* Open the folder that matches
+#. *Open the Folder for Your Build Host:* Open the folder that matches
    your :term:`Build Host` (i.e.
    ``i686`` for 32-bit machines or ``x86_64`` for 64-bit machines).
 
-3. *Locate and Download the SDK Installer:* You need to find and
+#. *Locate and Download the SDK Installer:* You need to find and
    download the installer appropriate for your build host, target
    hardware, and image type.
 
@@ -72,7 +72,7 @@ Follow these steps to locate and hand-install the toolchain:
 
       poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
 
-4. *Run the Installer:* Be sure you have execution privileges and run
+#. *Run the Installer:* Be sure you have execution privileges and run
    the installer. Following is an example from the ``Downloads``
    directory::
 
@@ -91,13 +91,13 @@ Building an SDK Installer
 As an alternative to locating and downloading an SDK installer, you can
 build the SDK installer. Follow these steps:
 
-1. *Set Up the Build Environment:* Be sure you are set up to use BitBake
+#. *Set Up the Build Environment:* Be sure you are set up to use BitBake
    in a shell. See the ":ref:`dev-manual/start:preparing the build host`" section
    in the Yocto Project Development Tasks Manual for information on how
    to get a build host ready that is either a native Linux machine or a
    machine that uses CROPS.
 
-2. *Clone the ``poky`` Repository:* You need to have a local copy of the
+#. *Clone the ``poky`` Repository:* You need to have a local copy of the
    Yocto Project :term:`Source Directory`
    (i.e. a local
    ``poky`` repository). See the ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`" and
@@ -107,7 +107,7 @@ build the SDK installer. Follow these steps:
    how to clone the ``poky`` repository and check out the appropriate
    branch for your work.
 
-3. *Initialize the Build Environment:* While in the root directory of
+#. *Initialize the Build Environment:* While in the root directory of
    the Source Directory (i.e. ``poky``), run the
    :ref:`structure-core-script` environment
    setup script to define the OpenEmbedded build environment on your
@@ -120,12 +120,12 @@ build the SDK installer. Follow these steps:
    the script runs, your current working directory is set to the ``build``
    directory.
 
-4. *Make Sure You Are Building an Installer for the Correct Machine:*
+#. *Make Sure You Are Building an Installer for the Correct Machine:*
    Check to be sure that your :term:`MACHINE` variable in the ``local.conf``
    file in your :term:`Build Directory` matches the architecture
    for which you are building.
 
-5. *Make Sure Your SDK Machine is Correctly Set:* If you are building a
+#. *Make Sure Your SDK Machine is Correctly Set:* If you are building a
    toolchain designed to run on an architecture that differs from your
    current development host machine (i.e. the build host), be sure that
    the :term:`SDKMACHINE` variable in the ``local.conf`` file in your
@@ -145,7 +145,7 @@ build the SDK installer. Follow these steps:
          different from the architecture of the build machine (``x86_64``).
 
 
-6. *Build the SDK Installer:* To build the SDK installer for a standard
+#. *Build the SDK Installer:* To build the SDK installer for a standard
    SDK and populate the SDK image, use the following command form. Be
    sure to replace ``image`` with an image (e.g. "core-image-sato")::
 
@@ -175,7 +175,7 @@ build the SDK installer. Follow these steps:
          static development libraries: TOOLCHAIN_TARGET_TASK:append = "
          libc-staticdev"
 
-7. *Run the Installer:* You can now run the SDK installer from
+#. *Run the Installer:* You can now run the SDK installer from
    ``tmp/deploy/sdk`` in the :term:`Build Directory`. Following is an example::
 
       $ cd poky/build/tmp/deploy/sdk
@@ -203,7 +203,7 @@ separately extract a root filesystem:
 
 Follow these steps to extract the root filesystem:
 
-1. *Locate and Download the Tarball for the Pre-Built Root Filesystem
+#. *Locate and Download the Tarball for the Pre-Built Root Filesystem
    Image File:* You need to find and download the root filesystem image
    file that is appropriate for your target system. These files are kept
    in machine-specific folders in the
@@ -241,7 +241,7 @@ Follow these steps to extract the root filesystem:
 
       core-image-sato-sdk-beaglebone-yocto.tar.bz2
 
-2. *Initialize the Cross-Development Environment:* You must ``source``
+#. *Initialize the Cross-Development Environment:* You must ``source``
    the cross-development environment setup script to establish necessary
    environment variables.
 
@@ -253,7 +253,7 @@ Follow these steps to extract the root filesystem:
 
       $ source poky_sdk/environment-setup-core2-64-poky-linux
 
-3. *Extract the Root Filesystem:* Use the ``runqemu-extract-sdk``
+#. *Extract the Root Filesystem:* Use the ``runqemu-extract-sdk``
    command and provide the root filesystem image.
 
    Following is an example command that extracts the root filesystem
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 7ab43e0a9d..e8a0a5b3ce 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -47,7 +47,7 @@ Two ways to install the Extensible SDK
 Extensible SDK can be installed in two different ways, and both have
 their own pros and cons:
 
-1. *Setting up the Extensible SDK environment directly in a Yocto build*. This
+#. *Setting up the Extensible SDK environment directly in a Yocto build*. This
 avoids having to produce, test, distribute and maintain separate SDK installer
 archives, which can get very large. There is only one environment for the regular
 Yocto build and the SDK and less code paths where things can go not according to plan.
@@ -56,7 +56,7 @@ git fetch or layer management tooling. The SDK extensibility is better than in t
 second option: just run ``bitbake`` again to add more things to the sysroot, or add layers
 if even more things are required.
 
-2. *Setting up the Extensible SDK from a standalone installer*. This has the benefit of
+#. *Setting up the Extensible SDK from a standalone installer*. This has the benefit of
 having a single, self-contained archive that includes all the needed binary artifacts.
 So nothing needs to be rebuilt, and there is no need to provide a well-functioning
 binary artefact cache over the network for developers with underpowered laptops.
@@ -64,10 +64,10 @@ binary artefact cache over the network for developers with underpowered laptops.
 Setting up the Extensible SDK environment directly in a Yocto build
 -------------------------------------------------------------------
 
-1. Set up all the needed layers and a Yocto :term:`Build Directory`, e.g. a regular Yocto
+#. Set up all the needed layers and a Yocto :term:`Build Directory`, e.g. a regular Yocto
    build where ``bitbake`` can be executed.
 
-2. Run:
+#. Run:
     $ bitbake meta-ide-support
     $ bitbake -c populate_sysroot gtk+3
     (or any other target or native item that the application developer would need)
@@ -279,7 +279,7 @@ command:
 .. image:: figures/sdk-devtool-add-flow.png
    :width: 100%
 
-1. *Generating the New Recipe*: The top part of the flow shows three
+#. *Generating the New Recipe*: The top part of the flow shows three
    scenarios by which you could use ``devtool add`` to generate a recipe
    based on existing source code.
 
@@ -352,7 +352,7 @@ command:
       Aside from a recipe folder, the command also creates an associated
       append folder and places an initial ``*.bbappend`` file within.
 
-2. *Edit the Recipe*: You can use ``devtool edit-recipe`` to open up the
+#. *Edit the Recipe*: You can use ``devtool edit-recipe`` to open up the
    editor as defined by the ``$EDITOR`` environment variable and modify
    the file::
 
@@ -362,7 +362,7 @@ command:
    can make modifications to the recipe that take effect when you build
    it later.
 
-3. *Build the Recipe or Rebuild the Image*: The next step you take
+#. *Build the Recipe or Rebuild the Image*: The next step you take
    depends on what you are going to do with the new code.
 
    If you need to eventually move the build output to the target
@@ -378,7 +378,7 @@ command:
 
       $ devtool build-image image
 
-4. *Deploy the Build Output*: When you use the ``devtool build`` command
+#. *Deploy the Build Output*: When you use the ``devtool build`` command
    to build out your recipe, you probably want to see if the resulting
    build output works as expected on the target hardware.
 
@@ -400,7 +400,7 @@ command:
    ``devtool`` does not provide a specific command that allows you to
    deploy the image to actual hardware.
 
-5. *Finish Your Work With the Recipe*: The ``devtool finish`` command
+#. *Finish Your Work With the Recipe*: The ``devtool finish`` command
    creates any patches corresponding to commits in the local Git
    repository, moves the new recipe to a more permanent layer, and then
    resets the recipe so that the recipe is built normally rather than
@@ -446,7 +446,7 @@ command:
 .. image:: figures/sdk-devtool-modify-flow.png
    :width: 100%
 
-1. *Preparing to Modify the Code*: The top part of the flow shows three
+#. *Preparing to Modify the Code*: The top part of the flow shows three
    scenarios by which you could use ``devtool modify`` to prepare to
    work on source files. Each scenario assumes the following:
 
@@ -555,11 +555,11 @@ command:
       append file for the recipe in the ``devtool`` workspace. The
       recipe and the source code remain in their original locations.
 
-2. *Edit the Source*: Once you have used the ``devtool modify`` command,
+#. *Edit the Source*: Once you have used the ``devtool modify`` command,
    you are free to make changes to the source files. You can use any
    editor you like to make and save your source code modifications.
 
-3. *Build the Recipe or Rebuild the Image*: The next step you take
+#. *Build the Recipe or Rebuild the Image*: The next step you take
    depends on what you are going to do with the new code.
 
    If you need to eventually move the build output to the target
@@ -572,7 +572,7 @@ command:
    (e.g. for testing purposes), you can use the ``devtool build-image``
    command: $ devtool build-image image
 
-4. *Deploy the Build Output*: When you use the ``devtool build`` command
+#. *Deploy the Build Output*: When you use the ``devtool build`` command
    to build out your recipe, you probably want to see if the resulting
    build output works as expected on target hardware.
 
@@ -597,7 +597,7 @@ command:
    ``devtool`` does not provide a specific command to deploy the image
    to actual hardware.
 
-5. *Finish Your Work With the Recipe*: The ``devtool finish`` command
+#. *Finish Your Work With the Recipe*: The ``devtool finish`` command
    creates any patches corresponding to commits in the local Git
    repository, updates the recipe to point to them (or creates a
    ``.bbappend`` file to do so, depending on the specified destination
@@ -664,7 +664,7 @@ The following diagram shows the common development flow used with the
 .. image:: figures/sdk-devtool-upgrade-flow.png
    :width: 100%
 
-1. *Initiate the Upgrade*: The top part of the flow shows the typical
+#. *Initiate the Upgrade*: The top part of the flow shows the typical
    scenario by which you use the ``devtool upgrade`` command. The
    following conditions exist:
 
@@ -716,7 +716,7 @@ The following diagram shows the common development flow used with the
    are incorporated into the build the next time you build the software
    just as are other changes you might have made to the source.
 
-2. *Resolve any Conflicts created by the Upgrade*: Conflicts could happen
+#. *Resolve any Conflicts created by the Upgrade*: Conflicts could happen
    after upgrading the software to a new version. Conflicts occur
    if your recipe specifies some patch files in :term:`SRC_URI` that
    conflict with changes made in the new version of the software. For
@@ -727,7 +727,7 @@ The following diagram shows the common development flow used with the
    conflicts created through use of a newer or different version of the
    software.
 
-3. *Build the Recipe or Rebuild the Image*: The next step you take
+#. *Build the Recipe or Rebuild the Image*: The next step you take
    depends on what you are going to do with the new code.
 
    If you need to eventually move the build output to the target
@@ -742,7 +742,7 @@ The following diagram shows the common development flow used with the
 
       $ devtool build-image image
 
-4. *Deploy the Build Output*: When you use the ``devtool build`` command
+#. *Deploy the Build Output*: When you use the ``devtool build`` command
    or ``bitbake`` to build your recipe, you probably want to see if the
    resulting build output works as expected on target hardware.
 
@@ -764,7 +764,7 @@ The following diagram shows the common development flow used with the
    ``devtool`` does not provide a specific command that allows you to do
    this.
 
-5. *Finish Your Work With the Recipe*: The ``devtool finish`` command
+#. *Finish Your Work With the Recipe*: The ``devtool finish`` command
    creates any patches corresponding to commits in the local Git
    repository, moves the new recipe to a more permanent layer, and then
    resets the recipe so that the recipe is built normally rather than
@@ -1054,17 +1054,17 @@ Working With Recipes
 When building a recipe using the ``devtool build`` command, the typical
 build progresses as follows:
 
-1. Fetch the source
+#. Fetch the source
 
-2. Unpack the source
+#. Unpack the source
 
-3. Configure the source
+#. Configure the source
 
-4. Compile the source
+#. Compile the source
 
-5. Install the build output
+#. Install the build output
 
-6. Package the installed output
+#. Package the installed output
 
 For recipes in the workspace, fetching and unpacking is disabled as the
 source tree has already been prepared and is persistent. Each of these
@@ -1322,15 +1322,15 @@ those customers need an SDK that has custom libraries. In such a case,
 you can produce a derivative SDK based on the currently installed SDK
 fairly easily by following these steps:
 
-1. If necessary, install an extensible SDK that you want to use as a
+#. If necessary, install an extensible SDK that you want to use as a
    base for your derivative SDK.
 
-2. Source the environment script for the SDK.
+#. Source the environment script for the SDK.
 
-3. Add the extra libraries or other components you want by using the
+#. Add the extra libraries or other components you want by using the
    ``devtool add`` command.
 
-4. Run the ``devtool build-sdk`` command.
+#. Run the ``devtool build-sdk`` command.
 
 The previous steps take the recipes added to the workspace and construct
 a new SDK installer that contains those recipes and the resulting binary
diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index ce00538b2a..49aa921e70 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -164,11 +164,11 @@ image.
 
 You just need to follow these general steps:
 
-1. *Install the SDK for your target hardware:* For information on how to
+#. *Install the SDK for your target hardware:* For information on how to
    install the SDK, see the ":ref:`sdk-manual/using:installing the sdk`"
    section.
 
-2. *Download or Build the Target Image:* The Yocto Project supports
+#. *Download or Build the Target Image:* The Yocto Project supports
    several target architectures and has many pre-built kernel images and
    root filesystem images.
 
@@ -195,7 +195,7 @@ You just need to follow these general steps:
       ":ref:`sdk-manual/appendix-obtain:extracting the root filesystem`"
       section for information on how to do this extraction.
 
-3. *Develop and Test your Application:* At this point, you have the
+#. *Develop and Test your Application:* At this point, you have the
    tools to develop your application. If you need to separately install
    and use the QEMU emulator, you can go to `QEMU Home
    Page <https://wiki.qemu.org/Main_Page>`__ to download and learn about
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index beec1dd09a..9a0db0099d 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -31,7 +31,7 @@ project:
    GNOME Developer
    site.
 
-1. *Create a Working Directory and Populate It:* Create a clean
+#. *Create a Working Directory and Populate It:* Create a clean
    directory for your project and then make that directory your working
    location::
 
@@ -74,7 +74,7 @@ project:
          bin_PROGRAMS = hello
          hello_SOURCES = hello.c
 
-2. *Source the Cross-Toolchain Environment Setup File:* As described
+#. *Source the Cross-Toolchain Environment Setup File:* As described
    earlier in the manual, installing the cross-toolchain creates a
    cross-toolchain environment setup script in the directory that the
    SDK was installed. Before you can use the tools to develop your
@@ -92,7 +92,7 @@ project:
 
       $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
 
-3. *Create the configure Script:* Use the ``autoreconf`` command to
+#. *Create the configure Script:* Use the ``autoreconf`` command to
    generate the ``configure`` script::
 
       $ autoreconf
@@ -108,7 +108,7 @@ project:
       which ensures missing auxiliary files are copied to the build
       host.
 
-4. *Cross-Compile the Project:* This command compiles the project using
+#. *Cross-Compile the Project:* This command compiles the project using
    the cross-compiler. The
    :term:`CONFIGURE_FLAGS`
    environment variable provides the minimal arguments for GNU
@@ -129,7 +129,7 @@ project:
 
      $ ./configure --host=armv5te-poky-linux-gnueabi --with-libtool-sysroot=sysroot_dir
 
-5. *Make and Install the Project:* These two commands generate and
+#. *Make and Install the Project:* These two commands generate and
    install the project into the destination directory::
 
       $ make
@@ -149,7 +149,7 @@ project:
 
       $ file ./tmp/usr/local/bin/hello
 
-6. *Execute Your Project:* To execute the project, you would need to run
+#. *Execute Your Project:* To execute the project, you would need to run
    it on your target hardware. If your target hardware happens to be
    your build host, you could run the project as follows::
 
@@ -227,7 +227,7 @@ established through the script::
 To illustrate variable use, work through this simple "Hello World!"
 example:
 
-1. *Create a Working Directory and Populate It:* Create a clean
+#. *Create a Working Directory and Populate It:* Create a clean
    directory for your project and then make that directory your working
    location::
 
@@ -266,7 +266,7 @@ example:
              printf("\n");
          }
 
-2. *Source the Cross-Toolchain Environment Setup File:* As described
+#. *Source the Cross-Toolchain Environment Setup File:* As described
    earlier in the manual, installing the cross-toolchain creates a
    cross-toolchain environment setup script in the directory that the
    SDK was installed. Before you can use the tools to develop your
@@ -284,7 +284,7 @@ example:
 
       $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
 
-3. *Create the Makefile:* For this example, the Makefile contains
+#. *Create the Makefile:* For this example, the Makefile contains
    two lines that can be used to set the :term:`CC` variable. One line is
    identical to the value that is set when you run the SDK environment
    setup script, and the other line sets :term:`CC` to "gcc", the default
@@ -302,7 +302,7 @@ example:
       	rm -rf *.o
       	rm target_bin
 
-4. *Make the Project:* Use the ``make`` command to create the binary
+#. *Make the Project:* Use the ``make`` command to create the binary
    output file. Because variables are commented out in the Makefile, the
    value used for :term:`CC` is the value set when the SDK environment setup
    file was run::
@@ -387,7 +387,7 @@ example:
    use the SDK environment variables regardless of the values in the
    Makefile.
 
-5. *Execute Your Project:* To execute the project (i.e. ``target_bin``),
+#. *Execute Your Project:* To execute the project (i.e. ``target_bin``),
    use the following command::
 
       $ ./target_bin
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index e014d2f090..755b895cee 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -188,17 +188,17 @@ The ``bldcontrol/management/commands/checksettings.py`` file controls
 workflow configuration. Here is the process to
 initially populate this database.
 
-1. The default project settings are set from
+#. The default project settings are set from
    ``orm/fixtures/settings.xml``.
 
-2. The default project distro and layers are added from
+#. The default project distro and layers are added from
    ``orm/fixtures/poky.xml`` if poky is installed. If poky is not
    installed, they are added from ``orm/fixtures/oe-core.xml``.
 
-3. If the ``orm/fixtures/custom.xml`` file exists, then its values are
+#. If the ``orm/fixtures/custom.xml`` file exists, then its values are
    added.
 
-4. The layer index is then scanned and added to the database.
+#. The layer index is then scanned and added to the database.
 
 Once these steps complete, Toaster is set up and ready to use.
 
-- 
2.37.2



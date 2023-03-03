Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D47C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 11:04:15 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.20447.1677841449184804108
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Mar 2023 03:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pdJagwX4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 53A5960006;
	Fri,  3 Mar 2023 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677841447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yo9QIyDOj2c4+m48KcckbPkfm45EBnZ94GV/0WpyCNc=;
	b=pdJagwX4MABwqBZMC4cQ48gKOXEURWHKwAqorHrlWVD+4HRkvMKzQrKH5Iw/cmV5mOCgXY
	kQ1mPA72uVHtMbUc8L7ysuYyJT4tPFMG7QWb6mvwZu8p1yjjBP3Rja9i6W3T/a7abFFX/b
	UhE99Qt1B+AvGR8QizKLMcGLbd33tj3BxJeFkQ4QysfWcgpMsOorXT9ysQk68oWJBxjQjO
	2mZF7X+aE/5f7pYpkOOipnJNtKpWdhV7QkCHsjGSI3CA0NQE9a85nQGLZDgq/yUK5MT8Jr
	52VUetEWMpn3ezQ25525xo5DKEObxX+FrIrgpv2sUrRaOyMLfzDcDj3nQ2K7hA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] overview-manual: concepts.rst: simplify internal references
Date: Fri,  3 Mar 2023 12:04:02 +0100
Message-Id: <20230303110402.537271-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Mar 2023 11:04:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3782

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 122 +++++++++------------
 1 file changed, 50 insertions(+), 72 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index e7551149a1..b0d906b78a 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -39,9 +39,7 @@ section of the Yocto Project Development Tasks Manual.
 
 Following are some brief details on these core components. For
 additional information on how these components interact during a build,
-see the
-":ref:`overview-manual/concepts:openembedded build system concepts`"
-section.
+see the "`openembedded build system concepts`_" section.
 
 BitBake
 -------
@@ -201,9 +199,8 @@ User configuration helps define the build. Through user configuration,
 you can tell BitBake the target architecture for which you are building
 the image, where to store downloaded source, and other build properties.
 
-The following figure shows an expanded representation of the "User
-Configuration" box of the :ref:`general workflow
-figure <overview-manual/concepts:openembedded build system concepts>`:
+The following figure shows an expanded representation of the "User Configuration"
+box of the `general workflow figure <openembedded build system concepts>`_:
 
 .. image:: figures/user-configuration.png
    :width: 100%
@@ -352,8 +349,8 @@ layers the build system uses to further control the build. These layers
 provide Metadata for the software, machine, and policies.
 
 In general, there are three types of layer input. You can see them below
-the "User Configuration" box in the `general workflow
-figure <overview-manual/concepts:openembedded build system concepts>`:
+the "User Configuration" box in the `general workflow figure
+<openembedded build system concepts>`_:
 
 -  *Metadata (.bb + Patches):* Software layers containing
    user-supplied recipe files, patches, and append files. A good example
@@ -382,8 +379,7 @@ figure <overview-manual/concepts:openembedded build system concepts>`:
    that contain many policy configurations for the Poky distribution.
 
 The following figure shows an expanded representation of these three
-layers from the :ref:`general workflow figure
-<overview-manual/concepts:openembedded build system concepts>`:
+layers from the `general workflow figure <openembedded build system concepts>`_:
 
 .. image:: figures/layer-input.png
    :align: center
@@ -394,12 +390,9 @@ licensing file (e.g. ``COPYING.MIT``) if the layer is to be distributed,
 a ``README`` file as good practice and especially if the layer is to be
 distributed, a configuration directory, and recipe directories. You can
 learn about the general structure for layers used with the Yocto Project
-in the
-":ref:`dev-manual/layers:creating your own layer`"
-section in the
-Yocto Project Development Tasks Manual. For a general discussion on
-layers and the many layers from which you can draw, see the
-":ref:`overview-manual/concepts:layers`" and
+in the ":ref:`dev-manual/layers:creating your own layer`" section in the
+Yocto Project Development Tasks Manual. For a general discussion on layers
+and the many layers from which you can draw, see the "`Layers`_" and
 ":ref:`overview-manual/yp-intro:the yocto project layer model`" sections both
 earlier in this manual.
 
@@ -494,13 +487,12 @@ project needs.
 Sources
 -------
 
-In order for the OpenEmbedded build system to create an image or any
-target, it must be able to access source files. The :ref:`general workflow
-figure <overview-manual/concepts:openembedded build system concepts>`
-represents source files using the "Upstream Project Releases", "Local
-Projects", and "SCMs (optional)" boxes. The figure represents mirrors,
-which also play a role in locating source files, with the "Source
-Materials" box.
+In order for the OpenEmbedded build system to create an image or any target, it
+must be able to access source files. The `general workflow figure
+<openembedded build system concepts>`_ represents source files using the
+"Upstream Project Releases", "Local Projects", and "SCMs (optional)" boxes.
+The figure represents mirrors, which also play a role in locating source files,
+with the "Source Materials" box.
 
 The method by which source files are ultimately organized is a function
 of the project. For example, for released software, projects tend to use
@@ -535,7 +527,7 @@ source file.
 
 The remainder of this section provides a deeper look into the source
 files and the mirrors. Here is a more detailed look at the source file
-area of the :ref:`general workflow figure <overview-manual/concepts:openembedded build system concepts>`:
+area of the `general workflow figure <openembedded build system concepts>`_:
 
 .. image:: figures/source-input.png
    :align: center
@@ -605,10 +597,9 @@ functioning for some reason or another.
 Package Feeds
 -------------
 
-When the OpenEmbedded build system generates an image or an SDK, it gets
-the packages from a package feed area located in the
-:term:`Build Directory`. The :ref:`general workflow figure
-<overview-manual/concepts:openembedded build system concepts>`
+When the OpenEmbedded build system generates an image or an SDK, it gets the
+packages from a package feed area located in the :term:`Build Directory`. The
+`general workflow figure <openembedded build system concepts>`_
 shows this package feeds area in the upper-right corner.
 
 This section looks a little closer into the package feeds area used by
@@ -666,12 +657,11 @@ architecture are placed in ``build/tmp/deploy/ipk/qemux86``.
 BitBake Tool
 ------------
 
-The OpenEmbedded build system uses
-:term:`BitBake` to produce images and
-Software Development Kits (SDKs). You can see from the :ref:`general workflow
-figure <overview-manual/concepts:openembedded build system concepts>`,
-the BitBake area consists of several functional areas. This section takes a
-closer look at each of those areas.
+The OpenEmbedded build system uses :term:`BitBake` to produce images and
+Software Development Kits (SDKs). You can see from the `general workflow
+figure <openembedded build system concepts>`_, the BitBake area consists of
+several functional areas. This section takes a closer look at each of those
+areas.
 
 .. note::
 
@@ -788,11 +778,9 @@ source files, which are located in the
 :term:`S` directory.
 
 For more information on how the source directories are created, see the
-":ref:`overview-manual/concepts:source fetching`" section. For
-more information on how to create patches and how the build system
-processes patches, see the
-":ref:`dev-manual/new-recipe:patching code`"
-section in the
+"`Source Fetching`_" section. For more information on how to create patches and
+how the build system processes patches, see the
+":ref:`dev-manual/new-recipe:patching code`" section in the
 Yocto Project Development Tasks Manual. You can also see the
 ":ref:`sdk-manual/extensible:use \`\`devtool modify\`\` to modify the source of an existing component`"
 section in the Yocto Project Application Development and the Extensible
@@ -924,8 +912,7 @@ Depending on the type of packages being created (RPM, DEB, or IPK), the
 :ref:`do_package_write_* <ref-tasks-package_write_deb>`
 task creates the actual packages and places them in the Package Feed
 area, which is ``${TMPDIR}/deploy``. You can see the
-":ref:`overview-manual/concepts:package feeds`" section for more detail on
-that part of the build process.
+"`Package Feeds`_" section for more detail on that part of the build process.
 
 .. note::
 
@@ -1064,8 +1051,8 @@ the extensible SDK (eSDK):
 .. note::
 
    For more information on the cross-development toolchain generation,
-   see the ":ref:`overview-manual/concepts:cross-development toolchain generation`"
-   section. For information on advantages gained when building a
+   see the "`Cross-Development Toolchain Generation`_" section.
+   For information on advantages gained when building a
    cross-development toolchain using the :ref:`ref-tasks-populate_sdk` task, see the
    ":ref:`sdk-manual/appendix-obtain:building an sdk installer`" section in
    the Yocto Project Application Development and the Extensible Software
@@ -1078,8 +1065,7 @@ and
 :ref:`ref-tasks-populate_sdk_ext`
 tasks use these key variables to help create the list of packages to
 actually install. For information on the variables listed in the figure,
-see the ":ref:`overview-manual/concepts:application development sdk`"
-section.
+see the "`Application Development SDK`_" section.
 
 The :ref:`ref-tasks-populate_sdk` task helps create the standard SDK and handles
 two parts: a target part and a host part. The target part is the part
@@ -1102,12 +1088,10 @@ includes the environment setup script.
 Stamp Files and the Rerunning of Tasks
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-For each task that completes successfully, BitBake writes a stamp file
-into the :term:`STAMPS_DIR`
-directory. The beginning of the stamp file's filename is determined by
-the :term:`STAMP` variable, and the end
-of the name consists of the task's name and current :ref:`input
-checksum <overview-manual/concepts:checksums (signatures)>`.
+For each task that completes successfully, BitBake writes a stamp file into the
+:term:`STAMPS_DIR` directory. The beginning of the stamp file's filename is
+determined by the :term:`STAMP` variable, and the end of the name consists of
+the task's name and current `input checksum <checksums (signatures)>`_.
 
 .. note::
 
@@ -1122,9 +1106,8 @@ the task is rerun.
 
 .. note::
 
-   The stamp mechanism is more general than the shared state (sstate)
-   cache mechanism described in the
-   ":ref:`overview-manual/concepts:setscene tasks and shared state`" section.
+   The stamp mechanism is more general than the shared state (sstate) cache
+   mechanism described in the "`Setscene Tasks and Shared State`_" section.
    BitBake avoids rerunning any task that has a valid stamp file, not just
    tasks that can be accelerated through the sstate cache.
 
@@ -1227,8 +1210,7 @@ Images
 
 The images produced by the build system are compressed forms of the root
 filesystem and are ready to boot on a target device. You can see from
-the :ref:`general workflow figure
-<overview-manual/concepts:openembedded build system concepts>` that BitBake
+the `general workflow figure <openembedded build system concepts>`_ that BitBake
 output, in part, consists of images. This section takes a closer look at
 this output:
 
@@ -1282,8 +1264,7 @@ containing images for the current configuration.
 Application Development SDK
 ---------------------------
 
-In the :ref:`general workflow figure
-<overview-manual/concepts:openembedded build system concepts>`, the
+In the `general workflow figure <openembedded build system concepts>`_, the
 output labeled "Application Development SDK" represents an SDK. The SDK
 generation process differs depending on whether you build an extensible
 SDK (e.g. ``bitbake -c populate_sdk_ext`` imagename) or a standard SDK
@@ -1314,8 +1295,7 @@ can initialize the environment before using the tools.
 
    -  For background information on cross-development toolchains in the
       Yocto Project development environment, see the
-      ":ref:`overview-manual/concepts:cross-development toolchain generation`"
-      section.
+      "`Cross-Development Toolchain Generation`_" section.
 
    -  For information on setting up a cross-development environment, see
       the :doc:`/sdk-manual/index` manual.
@@ -1713,13 +1693,12 @@ through this setting in the ``bitbake.conf`` file::
 
    BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 
-The "OEBasicHash" :term:`BB_SIGNATURE_HANDLER` is the same
-as the "OEBasic" version but adds the task hash to the :ref:`stamp
-files <overview-manual/concepts:stamp files and the rerunning of tasks>`. This
-results in any metadata change that changes the task hash, automatically causing
-the task to be run again. This removes the need to bump
-:term:`PR` values, and changes to metadata
-automatically ripple across the build.
+The "OEBasicHash" :term:`BB_SIGNATURE_HANDLER` is the same as the "OEBasic"
+version but adds the task hash to the `stamp files <stamp files and the
+rerunning of tasks>`_. This results in any metadata change that changes the
+task hash, automatically causing the task to be run again. This removes the
+need to bump :term:`PR` values, and changes to metadata automatically ripple
+across the build.
 
 It is also worth noting that the end result of these signature
 generators is to make some dependency and hash information available to
@@ -1831,11 +1810,10 @@ The following list explains the previous example:
 
 
 -  The ``do_deploy[stamp-extra-info] = "${MACHINE_ARCH}"`` line appends extra
-   metadata to the :ref:`stamp file <overview-manual/concepts:stamp files and the rerunning of tasks>`.
-   In this case, the metadata makes the task specific to a machine's architecture.
-   See the ":ref:`bitbake-user-manual/bitbake-user-manual-execution:the task list`"
-   section in the BitBake User Manual for more information on the
-   ``stamp-extra-info`` flag.
+   metadata to the `stamp file <stamp files and the rerunning of tasks>`_. In
+   this case, the metadata makes the task specific to a machine's architecture.
+   See ":ref:`bitbake-user-manual/bitbake-user-manual-execution:the task list`"
+   section in the BitBake User Manual for more information on the ``stamp-extra-info`` flag.
 
 -  ``sstate-inputdirs`` and ``sstate-outputdirs`` can also be used with
    multiple directories. For example, the following declares
-- 
2.37.2



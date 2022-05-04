Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3421C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 12:26:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.5701.1651667171450527209
 for <docs@lists.yoctoproject.org>;
 Wed, 04 May 2022 05:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NEhefGd+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 739871BF216;
	Wed,  4 May 2022 12:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651667169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BX/L2+0Bo5vhzyWHbj/2JnVK72vbgi5R3srpdg8hz24=;
	b=NEhefGd+w0oq2V8kUFVxecPBbj7yDZhlNGh1VVYidj6BGT3EUpmA/BB2V0Jnwv8rBajvZ+
	l+35OvAz2lA3CePLAuN7IXQgPOMuUg0g3JqDKnroceg9Kj2DVqb5l+aP/zmn/zLX8J9M4x
	7NRBgIROa5KpqkAB8NzTR+udYW59UxuEa+egazuQ2RMsKDbhRkl0/xqafJGNGKfjiVnLw3
	iJxjgRMO9BI086BTF9p1+vFKGtXacdVGjVQxNdeMSOcF8OoL59vRcv9/TK2jscNlaImzZ+
	V1m7FvflCqbw5QVh94AXzTuzPOcFcuCk8vXpgasYE/2PalBwP00+yju7YMzIqA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: improve the width of diagrams
Date: Wed,  4 May 2022 14:26:04 +0200
Message-Id: <20220504122604.675648-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 May 2022 12:26:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2906

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Better for EPUB output in particular
- Make some diagrams wider when necessary
- Remove ":align: center" when we have ":width: 100%"
- Update the standards.md files to mention this

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst               |  1 +
 documentation/dev-manual/common-tasks.rst     |  9 ++++---
 documentation/kernel-dev/concepts-appx.rst    |  3 ++-
 documentation/kernel-dev/intro.rst            |  2 +-
 documentation/overview-manual/concepts.rst    | 26 +++++++++++--------
 .../development-environment.rst               |  5 ++--
 documentation/overview-manual/yp-intro.rst    |  6 ++---
 documentation/profile-manual/usage.rst        | 22 ++++++++++++++++
 .../ref-manual/devtool-reference.rst          |  3 +--
 documentation/sdk-manual/appendix-obtain.rst  |  3 +--
 documentation/sdk-manual/extensible.rst       |  6 ++---
 documentation/sdk-manual/intro.rst            |  2 +-
 documentation/sdk-manual/working-projects.rst |  2 ++
 documentation/standards.md                    | 10 +++++--
 documentation/test-manual/intro.rst           |  1 +
 documentation/toaster-manual/intro.rst        |  2 ++
 documentation/what-i-wish-id-known.rst        |  1 +
 17 files changed, 73 insertions(+), 31 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 8ec7f2957e..280b160807 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -725,6 +725,7 @@ workflow.
 
 .. image:: figures/bsp-dev-flow.png
    :align: center
+   :width: 70%
 
 #. *Set up Your Host Development System to Support Development Using the
    Yocto Project*: See the ":ref:`dev-manual/start:preparing the build host`"
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b228c75aab..3d18f038aa 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -1125,6 +1125,7 @@ The remainder of the section provides details for the steps.
 
 .. image:: figures/recipe-workflow.png
    :align: center
+   :width: 50%
 
 Locate or Automatically Create a Base Recipe
 --------------------------------------------
@@ -3618,7 +3619,7 @@ Yocto Project Overview and Concepts Manual.
 The following figure and list overviews the build process:
 
 .. image:: figures/bitbake-build-flow.png
-   :align: center
+   :width: 100%
 
 1. *Set up Your Host Development System to Support Development Using the
    Yocto Project*: See the ":doc:`start`" section for options on how to get a
@@ -3736,6 +3737,7 @@ Follow these steps to set up and execute multiple configuration builds:
 
    .. image:: figures/multiconfig_files.png
       :align: center
+      :width: 50%
 
    The reason for this required file hierarchy is because the :term:`BBPATH`
    variable is not constructed until the layers are parsed.
@@ -7691,7 +7693,7 @@ On a browser,
 go to ``http://192.168.7.2:3000`` and you see the following:
 
 .. image:: figures/cute-files-npm-example.png
-   :align: center
+   :width: 100%
 
 You can find the recipe in ``workspace/recipes/cute-files``. You can use
 the recipe in any layer you choose.
@@ -8215,6 +8217,7 @@ variable. Here is an example abbreviated listing:
 
 .. image:: figures/buildhistory.png
    :align: center
+   :width: 50%
 
 At the top level, there is a ``metadata-revs`` file that lists the
 revisions of the repositories for the enabled layers when the build was
@@ -8555,7 +8558,7 @@ instruction in the ``README`` file
 Here is a sample screenshot of the interface:
 
 .. image:: figures/buildhistory-web.png
-   :align: center
+   :width: 100%
 
 Performing Automated Runtime Testing
 ====================================
diff --git a/documentation/kernel-dev/concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
index 910318e0f9..d5af05f2e4 100644
--- a/documentation/kernel-dev/concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -221,7 +221,7 @@ the line-by-line code ``diff`` level is now a trivial operation.
 The following illustration shows the conceptual Yocto Linux kernel.
 
 .. image:: figures/kernel-architecture-overview.png
-   :align: center
+   :width: 100%
 
 In the illustration, the "Kernel.org Branch Point" marks the specific
 spot (or Linux kernel release) from which the Yocto Linux kernel is
@@ -324,6 +324,7 @@ source files used during the build.
 
 .. image:: figures/kernel-overview-2-generic.png
    :align: center
+   :width: 70%
 
 Again, for additional information on the Yocto Project kernel's
 architecture and its branching strategy, see the
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index e406f6e47f..b9ce7f241c 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -106,7 +106,7 @@ modification workflow. The illustration and accompanying list provide
 general information and references for further information.
 
 .. image:: figures/kernel-dev-flow.png
-   :align: center
+   :width: 100%
 
 1. *Set up Your Host Development System to Support Development Using the
    Yocto Project*: See the ":doc:`/dev-manual/start`" section in
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 6c341976f9..49f36d8338 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -166,7 +166,7 @@ remainder of this section expands on the fundamental input, output,
 process, and metadata logical blocks that make up the workflow.
 
 .. image:: figures/YP-flow-diagram.png
-   :align: center
+   :width: 100%
 
 In general, the build's workflow consists of several functional areas:
 
@@ -209,7 +209,7 @@ Configuration" box of the :ref:`general workflow
 figure <overview-manual/concepts:openembedded build system concepts>`:
 
 .. image:: figures/user-configuration.png
-   :align: center
+   :width: 100%
 
 BitBake needs some basic configuration files in order to complete a
 build. These files are ``*.conf`` files. The minimally necessary ones
@@ -400,7 +400,9 @@ layers from the :ref:`general workflow figure
 <overview-manual/concepts:openembedded build system concepts>`:
 
 .. image:: figures/layer-input.png
+   :centered:
    :align: center
+   :width: 70%
 
 In general, all layers have a similar structure. They all contain a
 licensing file (e.g. ``COPYING.MIT``) if the layer is to be distributed,
@@ -551,6 +553,7 @@ area of the :ref:`general workflow figure <overview-manual/concepts:openembedded
 
 .. image:: figures/source-input.png
    :align: center
+   :width: 70%
 
 Upstream Project Releases
 ~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -629,7 +632,7 @@ This section looks a little closer into the package feeds area used by
 the build system. Here is a more detailed look at the area:
 
 .. image:: figures/package-feeds.png
-   :align: center
+   :width: 100%
 
 Package feeds are an intermediary step in the build process. The
 OpenEmbedded build system provides classes to generate different package
@@ -702,7 +705,7 @@ The first stages of building a recipe are to fetch and unpack the source
 code:
 
 .. image:: figures/source-fetching.png
-   :align: center
+   :width: 100%
 
 The :ref:`ref-tasks-fetch` and
 :ref:`ref-tasks-unpack` tasks fetch
@@ -790,7 +793,7 @@ Once source code is fetched and unpacked, BitBake locates patch files
 and applies them to the source files:
 
 .. image:: figures/patching.png
-   :align: center
+   :width: 100%
 
 The :ref:`ref-tasks-patch` task uses a
 recipe's :term:`SRC_URI` statements
@@ -831,7 +834,7 @@ compile the source code. Once compilation occurs, the files are copied
 to a holding area (staged) in preparation for packaging:
 
 .. image:: figures/configuration-compile-autoreconf.png
-   :align: center
+   :width: 100%
 
 This step in the build process consists of the following tasks:
 
@@ -889,7 +892,7 @@ After source code is configured, compiled, and staged, the build system
 analyzes the results and splits the output into packages:
 
 .. image:: figures/analysis-for-package-splitting.png
-   :align: center
+   :width: 100%
 
 The :ref:`ref-tasks-package` and
 :ref:`ref-tasks-packagedata`
@@ -968,7 +971,7 @@ Once packages are split and stored in the Package Feeds area, the build
 system uses BitBake to generate the root filesystem image:
 
 .. image:: figures/image-generation.png
-   :align: center
+   :width: 100%
 
 The image generation process consists of several stages and depends on
 several tasks and variables. The
@@ -1086,7 +1089,7 @@ Development Kit (SDK) installer scripts for both the standard SDK and
 the extensible SDK (eSDK):
 
 .. image:: figures/sdk-generation.png
-   :align: center
+   :width: 100%
 
 .. note::
 
@@ -1262,6 +1265,7 @@ this output:
 
 .. image:: figures/images.png
    :align: center
+   :width: 75%
 
 .. note::
 
@@ -1321,7 +1325,7 @@ SDK (e.g. ``bitbake -c populate_sdk_ext`` imagename) or a standard SDK
 closer look at this output:
 
 .. image:: figures/sdk.png
-   :align: center
+   :width: 100%
 
 The specific form of this output is a set of files that includes a
 self-extracting SDK installer (``*.sh``), host and target manifest
@@ -1439,7 +1443,7 @@ The following figure shows a high-level build environment regarding
 toolchain construction and use.
 
 .. image:: figures/cross-development-toolchains.png
-   :align: center
+   :width: 100%
 
 Most of the work occurs on the Build Host. This is the machine used to
 build images and generally work within the the Yocto Project
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index e171d7aaa3..f1001e0bd3 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -176,7 +176,7 @@ development:
    repositories for each of these areas.
 
    .. image:: figures/source-repos.png
-      :align: center
+      :width: 100%
 
    For steps on how to view and access these upstream Git repositories,
    see the ":ref:`dev-manual/start:accessing source repositories`"
@@ -191,6 +191,7 @@ development:
 
    .. image:: figures/index-downloads.png
       :align: center
+      :width: 50%
 
    For steps on how to view and access these files, see the
    ":ref:`dev-manual/start:accessing index of releases`"
@@ -205,7 +206,7 @@ development:
    :yocto_dl:`Index of /releases: </releases>` area.
 
    .. image:: figures/yp-download.png
-      :align: center
+      :width: 100%
 
    For steps on how to use the "DOWNLOADS" page, see the
    ":ref:`dev-manual/start:using the downloads page`"
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index e574dfa5b8..4d7b69502e 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -24,7 +24,7 @@ software customizations and build interchange for multiple hardware
 platforms as well as software stacks that can be maintained and scaled.
 
 .. image:: figures/key-dev-elements.png
-    :align: center
+    :width: 100%
 
 For further introductory information on the Yocto Project, you might be
 interested in this
@@ -638,7 +638,7 @@ these items that make up the Poky repository in the
 The following figure illustrates what generally comprises Poky:
 
 .. image:: figures/poky-reference-distribution.png
-    :align: center
+    :width: 100%
 
 -  BitBake is a task executor and scheduler that is the heart of the
    OpenEmbedded build system.
@@ -720,7 +720,7 @@ accomplish image and SDK generation. The following figure overviews that
 workflow:
 
 .. image:: figures/YP-flow-diagram.png
-    :align: center
+    :width: 100%
 
 Following is a brief summary of the "workflow":
 
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index fb1553d70d..23b67f0b59 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -197,6 +197,7 @@ in an interactive UI::
 
 .. image:: figures/perf-wget-flat-stripped.png
    :align: center
+   :width: 70%
 
 The above screenshot displays a 'flat' profile, one entry for each
 'bucket' corresponding to the functions that were profiled during the
@@ -230,6 +231,7 @@ but the entire callchain to the sampled function as well::
 
 .. image:: figures/perf-wget-g-copy-to-user-expanded-stripped.png
    :align: center
+   :width: 70%
 
 Using the callgraph view, we can actually see not only which functions
 took the most time, but we can also see a summary of how those functions
@@ -266,6 +268,7 @@ busybox.
 
 .. image:: figures/perf-wget-g-copy-from-user-expanded-stripped.png
    :align: center
+   :width: 70%
 
 The above screenshot shows the other half of the journey for the data -
 from the wget program's userspace buffers to disk. To get the buffers to
@@ -283,6 +286,7 @@ let's expand the first entry containing BusyBox:
 
 .. image:: figures/perf-wget-busybox-expanded-stripped.png
    :align: center
+   :width: 70%
 
 Again, before we expanded we saw that the function was labeled with a
 hex value instead of a symbol as with most of the kernel entries.
@@ -330,6 +334,7 @@ their functions symbolically:
 
 .. image:: figures/perf-wget-busybox-debuginfo.png
    :align: center
+   :width: 70%
 
 If we expand one of the entries and press 'enter' on a leaf node, we're
 presented with a menu of actions we can take to get more information
@@ -337,6 +342,7 @@ related to that entry:
 
 .. image:: figures/perf-wget-busybox-dso-zoom-menu.png
    :align: center
+   :width: 70%
 
 One of these actions allows us to show a view that displays a
 busybox-centric view of the profiled functions (in this case we've also
@@ -344,6 +350,7 @@ expanded all the nodes using the 'E' key):
 
 .. image:: figures/perf-wget-busybox-dso-zoom.png
    :align: center
+   :width: 70%
 
 Finally, we can see that now that the BusyBox debuginfo is installed,
 the previously unresolved symbol in the ``sys_clock_gettime()`` entry
@@ -354,6 +361,7 @@ function:
 
 .. image:: figures/perf-wget-g-copy-to-user-expanded-debuginfo.png
    :align: center
+   :width: 70%
 
 At the lowest level of detail, we can dive down to the assembly level
 and see which instructions caused the most overhead in a function.
@@ -362,6 +370,7 @@ with a menu:
 
 .. image:: figures/perf-wget-busybox-annotate-menu.png
    :align: center
+   :width: 70%
 
 Selecting 'Annotate udhcpc_main', we get a detailed listing of
 percentages by instruction for the udhcpc_main function. From the
@@ -370,6 +379,7 @@ taken up by a couple tests and the move of a constant (1) to a register:
 
 .. image:: figures/perf-wget-busybox-annotate-udhcpc.png
    :align: center
+   :width: 70%
 
 As a segue into tracing, let's try another profile using a different
 counter, something other than the default 'cycles'.
@@ -593,6 +603,7 @@ and tell perf to do a profile using it as the sampling event::
 
 .. image:: figures/sched-wakeup-profile.png
    :align: center
+   :width: 70%
 
 The screenshot above shows the results of running a profile using
 sched:sched_switch tracepoint, which shows the relative costs of various
@@ -894,6 +905,7 @@ other processes running on the system as well:
 
 .. image:: figures/perf-systemwide.png
    :align: center
+   :width: 70%
 
 In the snapshot above, we can see callchains that originate in libc, and
 a callchain from Xorg that demonstrates that we're using a proprietary X
@@ -911,6 +923,7 @@ record a profile::
 
 .. image:: figures/perf-report-cycles-u.png
    :align: center
+   :width: 70%
 
 Notice in the screenshot above, we see only userspace entries ([.])
 
@@ -921,6 +934,7 @@ the entries associated with the libc-xxx.so DSO.
 
 .. image:: figures/perf-systemwide-libc.png
    :align: center
+   :width: 70%
 
 We can also use the system-wide -a switch to do system-wide tracing.
 Here we'll trace a couple of scheduler events::
@@ -1116,6 +1130,7 @@ callgraphs from starting a few programs during those 30 seconds:
 
 .. image:: figures/perf-probe-do_fork-profile.png
    :align: center
+   :width: 70%
 
 .. admonition:: Tying it Together
 
@@ -1684,6 +1699,7 @@ events (or even one or more complete subsystems) to trace:
 
 .. image:: figures/kernelshark-choose-events.png
    :align: center
+   :width: 70%
 
 Note that these are exactly the same sets of events described in the
 previous trace events subsystem section, and in fact is where trace-cmd
@@ -1699,6 +1715,7 @@ will turn into the 'Stop' button after the trace has started):
 
 .. image:: figures/kernelshark-output-display.png
    :align: center
+   :width: 70%
 
 Notice that the right-hand pane shows the exact trace-cmd command-line
 that's used to run the trace, along with the results of the trace-cmd
@@ -1710,12 +1727,14 @@ detailed event listing below that:
 
 .. image:: figures/kernelshark-i915-display.png
    :align: center
+   :width: 70%
 
 Here's another example, this time a display resulting from tracing 'all
 events':
 
 .. image:: figures/kernelshark-all.png
    :align: center
+   :width: 70%
 
 The tool is pretty self-explanatory, but for more detailed information
 on navigating through the data, see the `kernelshark
@@ -1974,6 +1993,7 @@ with profiling data:
 
 .. image:: figures/sysprof-copy-to-user.png
    :align: center
+   :width: 70%
 
 The left pane shows a list of functions and processes. Selecting one of
 those expands that function in the right pane, showing all its callees.
@@ -1988,6 +2008,7 @@ in the perf display shown in the perf section of this page.
 
 .. image:: figures/sysprof-copy-from-user.png
    :align: center
+   :width: 70%
 
 Similarly, the above is a snapshot of the Sysprof display of a
 copy-from-user callchain.
@@ -1999,6 +2020,7 @@ left pane. In this case, the lower pane is showing all the callers of
 
 .. image:: figures/sysprof-callers.png
    :align: center
+   :width: 70%
 
 Double-clicking on one of those functions will in turn change the focus
 to the selected function, and so on.
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index a1a8bcdc98..10ca70a2b3 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -126,8 +126,7 @@ common working area used across the tool.
 The following figure shows the workspace structure:
 
 .. image:: figures/build-workspace-directory.png
-   :align: center
-   :scale: 70%
+   :scale: 100%
 
 .. code-block:: none
 
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 841abac5aa..ece378c75e 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -265,8 +265,7 @@ install the Standard SDK by running the ``*.sh`` SDK installation
 script:
 
 .. image:: figures/sdk-installed-standard-sdk-directory.png
-   :scale: 80%
-   :align: center
+   :scale: 100%
 
 The installed SDK consists of an environment setup script for the SDK, a
 configuration file for the target, a version file for the target, and
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index c5970f74fa..6bb262273d 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -233,7 +233,7 @@ shows common development flows you would use with the ``devtool add``
 command:
 
 .. image:: figures/sdk-devtool-add-flow.png
-   :align: center
+   :width: 100%
 
 1. *Generating the New Recipe*: The top part of the flow shows three
    scenarios by which you could use ``devtool add`` to generate a recipe
@@ -401,7 +401,7 @@ diagram shows common development flows for the ``devtool modify``
 command:
 
 .. image:: figures/sdk-devtool-modify-flow.png
-   :align: center
+   :width: 100%
 
 1. *Preparing to Modify the Code*: The top part of the flow shows three
    scenarios by which you could use ``devtool modify`` to prepare to
@@ -620,7 +620,7 @@ The following diagram shows the common development flow used with the
 ``devtool upgrade`` command:
 
 .. image:: figures/sdk-devtool-upgrade-flow.png
-   :align: center
+   :width: 100%
 
 1. *Initiate the Upgrade*: The top part of the flow shows the typical
    scenario by which you use the ``devtool upgrade`` command. The
diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index 802d3f3d42..ce00538b2a 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -149,7 +149,7 @@ SDK Development Model
 Fundamentally, the SDK fits into the development process as follows:
 
 .. image:: figures/sdk-environment.png
-   :align: center
+   :width: 100%
 
 The SDK is installed on any machine and can be used to develop applications,
 images, and kernels. An SDK can even be used by a QA Engineer or Release
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index 276daa9bb6..efef5c8bd2 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -19,6 +19,7 @@ The following figure presents a simple Autotools workflow.
 
 .. image:: figures/sdk-autotools-flow.png
    :align: center
+   :width: 70%
 
 Follow these steps to create a simple Autotools-based "Hello World"
 project:
@@ -168,6 +169,7 @@ variables and Makefile variables during development.
 
 .. image:: figures/sdk-makefile-flow.png
    :align: center
+   :width: 70%
 
 The main point of this section is to explain the following three cases
 regarding variable behavior:
diff --git a/documentation/standards.md b/documentation/standards.md
index a2274f6d6e..ff363492b4 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -26,8 +26,14 @@ To include a screenshot in PNG format:
     .. image:: figures/user-configuration.png
        :align: center
 
-Depending on the size of the image, you may also shrink it
-to prevent it from filling the whole page width:
+A diagram with many details usually needs to use
+the whole page width to be readable on all media.
+In this case, the `:align:` directive is unnecessary:
+
+       :scale: 100%
+
+Conversely, you may also shrink some images to
+to prevent them from filling the whole page width:
 
        :scale: 50%
 
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 9c1a93cd40..35b2383ac6 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -83,6 +83,7 @@ topology that includes a controller and a cluster of workers:
 
 .. image:: figures/ab-test-cluster.png
    :align: center
+   :width: 70%
 
 Yocto Project Tests - Types of Testing Overview
 ===============================================
diff --git a/documentation/toaster-manual/intro.rst b/documentation/toaster-manual/intro.rst
index 57e5b2bb7b..a324744b7d 100644
--- a/documentation/toaster-manual/intro.rst
+++ b/documentation/toaster-manual/intro.rst
@@ -92,6 +92,7 @@ suited for a single user developing on a single build host.
 
 .. image:: figures/simple-configuration.png
    :align: center
+   :width: 70%
 
 Toaster as a hosted service is suited for multiple users developing
 across several build hosts. When Toaster is set up as a hosted service,
@@ -99,3 +100,4 @@ its components can be spread across several machines:
 
 .. image:: figures/hosted-service.png
    :align: center
+   :width: 50%
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index dec5617173..3606b3a153 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -98,6 +98,7 @@ contact us with other suggestions.
    be going wrong.
 
    .. image:: figures/yp-how-it-works-new-diagram.png
+      :width: 100%
 
 #. **Know that you can generate a dependency graph and learn how to do it:**
    A dependency graph shows dependencies between recipes, tasks, and targets.
-- 
2.25.1



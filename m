Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D87C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 10:48:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.44924.1670323677877659340
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Dec 2022 02:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OH97qp0W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A6A281C0010;
	Tue,  6 Dec 2022 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670323676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lGNicvP4WJ118LL08K3q1sHOkZsGPTlx4u8UXmFDqww=;
	b=OH97qp0WRp3nJjxRKHHNrowscR/XLqlwi562wjho6gqYZ3xkFyiNXrNS4+G4lKkxBwZgIT
	fuALfL/kfMd9RTOSQickklEL171OCnqpb7OOpoyThgxgs1/NHLA761CUUn4YtABNzqZqut
	7yjd5KUc502ZpMqffbPT5u6H1OtMF+ccpHrenqkufC+Zu2yLUdyG2uz1o1eaBngh5nKZrJ
	BlAE8CYsth/FlDh7mVfhj9Qn3s25aXsoWFyhZvXpqkiCQUa0WlRbxw8stedrY1de/GGDn0
	ZlHM2iThSQ++xUggAytzZBkZOyNSWvKzZvMTYoECoL/r1I+mpTLaz1QnPvQrgg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Paul Barker <paul@pbarker.dev>
Subject: [PATCH] [dunfell] dev-manual: update session about multiconfig
Date: Tue,  6 Dec 2022 11:47:47 +0100
Message-Id: <20221206104747.62680-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Dec 2022 10:48:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3520

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Aligning with contents from the "master" branch.
[YOCTO #14980]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Paul Barker <paul@pbarker.dev>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 68 +++++++++----------
 1 file changed, 31 insertions(+), 37 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 9dcafb2783..8ee386a678 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -3854,7 +3854,7 @@ Setting Up and Running a Multiple Configuration Build
 
 To accomplish a multiple configuration build, you must define each
 target's configuration separately using a parallel configuration file in
-the :term:`Build Directory`, and you
+the :term:`Build Directory` or configuration directory within a layer, and you
 must follow a required file hierarchy. Additionally, you must enable the
 multiple configuration builds in your ``local.conf`` file.
 
@@ -3862,47 +3862,47 @@ Follow these steps to set up and execute multiple configuration builds:
 
 -  *Create Separate Configuration Files*: You need to create a single
    configuration file for each build target (each multiconfig).
-   Minimally, each configuration file must define the machine and the
-   temporary directory BitBake uses for the build. Suggested practice
-   dictates that you do not overlap the temporary directories used
-   during the builds. However, it is possible that you can share the
-   temporary directory
-   (:term:`TMPDIR`). For example,
-   consider a scenario with two different multiconfigs for the same
+   The configuration definitions are implementation dependent but often
+   each configuration file will define the machine and the
+   temporary directory BitBake uses for the build. Whether the same
+   temporary directory (:term:`TMPDIR`) can be shared will depend on what is
+   similar and what is different between the configurations. Multiple MACHINE
+   targets can share the same (:term:`TMPDIR`) as long as the rest of the
+   configuration is the same, multiple DISTRO settings would need separate
+   (:term:`TMPDIR`) directories.
+
+   For example, consider a scenario with two different multiconfigs for the same
    :term:`MACHINE`: "qemux86" built
    for two distributions such as "poky" and "poky-lsb". In this case,
-   you might want to use the same ``TMPDIR``.
+   you would need to use the different :term:`TMPDIR`.
 
    Here is an example showing the minimal statements needed in a
    configuration file for a "qemux86" target whose temporary build
-   directory is ``tmpmultix86``:
-   ::
+   directory is ``tmpmultix86``::
 
       MACHINE = "qemux86"
       TMPDIR = "${TOPDIR}/tmpmultix86"
 
    The location for these multiconfig configuration files is specific.
-   They must reside in the current build directory in a sub-directory of
-   ``conf`` named ``multiconfig``. Following is an example that defines
+   They must reside in the current :term:`Build Directory` in a sub-directory of
+   ``conf`` named ``multiconfig`` or within a layer's ``conf`` directory
+   under a directory named ``multiconfig``. Following is an example that defines
    two configuration files for the "x86" and "arm" multiconfigs:
 
    .. image:: figures/multiconfig_files.png
       :align: center
+      :width: 50%
 
-   The reason for this required file hierarchy is because the ``BBPATH``
-   variable is not constructed until the layers are parsed.
-   Consequently, using the configuration file as a pre-configuration
-   file is not possible unless it is located in the current working
-   directory.
+   The usual :term:`BBPATH` search path is used to locate multiconfig files in
+   a similar way to other conf files.
 
 -  *Add the BitBake Multi-configuration Variable to the Local
    Configuration File*: Use the
    :term:`BBMULTICONFIG`
    variable in your ``conf/local.conf`` configuration file to specify
    each multiconfig. Continuing with the example from the previous
-   figure, the ``BBMULTICONFIG`` variable needs to enable two
-   multiconfigs: "x86" and "arm" by specifying each configuration file:
-   ::
+   figure, the :term:`BBMULTICONFIG` variable needs to enable two
+   multiconfigs: "x86" and "arm" by specifying each configuration file::
 
       BBMULTICONFIG = "x86 arm"
 
@@ -3916,13 +3916,11 @@ Follow these steps to set up and execute multiple configuration builds:
       with "".
 
 -  *Launch BitBake*: Use the following BitBake command form to launch
-   the multiple configuration build:
-   ::
+   the multiple configuration build::
 
       $ bitbake [mc:multiconfigname:]target [[[mc:multiconfigname:]target] ... ]
 
-   For the example in this section, the following command applies:
-   ::
+   For the example in this section, the following command applies::
 
       $ bitbake mc:x86:core-image-minimal mc:arm:core-image-sato mc::core-image-base
 
@@ -3937,7 +3935,7 @@ Follow these steps to set up and execute multiple configuration builds:
    Support for multiple configuration builds in the Yocto Project &DISTRO;
    (&DISTRO_NAME;) Release does not include Shared State (sstate)
    optimizations. Consequently, if a build uses the same object twice
-   in, for example, two different ``TMPDIR``
+   in, for example, two different :term:`TMPDIR`
    directories, the build either loads from an existing sstate cache for
    that build at the start or builds the object fresh.
 
@@ -3958,38 +3956,34 @@ essentially that the
 
 To enable dependencies in a multiple configuration build, you must
 declare the dependencies in the recipe using the following statement
-form:
-::
+form::
 
    task_or_package[mcdepends] = "mc:from_multiconfig:to_multiconfig:recipe_name:task_on_which_to_depend"
 
 To better show how to use this statement, consider the example scenario
 from the first paragraph of this section. The following statement needs
-to be added to the recipe that builds the ``core-image-sato`` image:
-::
+to be added to the recipe that builds the ``core-image-sato`` image::
 
    do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_rootfs"
 
 In this example, the `from_multiconfig` is "x86". The `to_multiconfig` is "arm". The
-task on which the ``do_image`` task in the recipe depends is the
-``do_rootfs`` task from the ``core-image-minimal`` recipe associated
+task on which the :ref:`ref-tasks-image` task in the recipe depends is the
+:ref:`ref-tasks-rootfs` task from the ``core-image-minimal`` recipe associated
 with the "arm" multiconfig.
 
 Once you set up this dependency, you can build the "x86" multiconfig
-using a BitBake command as follows:
-::
+using a BitBake command as follows::
 
    $ bitbake mc:x86:core-image-sato
 
 This command executes all the tasks needed to create the
 ``core-image-sato`` image for the "x86" multiconfig. Because of the
-dependency, BitBake also executes through the ``do_rootfs`` task for the
+dependency, BitBake also executes through the :ref:`ref-tasks-rootfs` task for the
 "arm" multiconfig build.
 
 Having a recipe depend on the root filesystem of another build might not
 seem that useful. Consider this change to the statement in the
-``core-image-sato`` recipe:
-::
+``core-image-sato`` recipe::
 
    do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_image"
 
-- 
2.37.2



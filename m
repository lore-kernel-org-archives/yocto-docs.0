Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D56FECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 09:00:51 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.4211.1663750843778417002
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 02:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z7DlAhNt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BF1C72000C;
	Wed, 21 Sep 2022 09:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663750841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYzYHeBvaqo/NPJUrce4CfDkxl4ljaJ4230yQiyIFWw=;
	b=Z7DlAhNtPPIlIaoCfANsOh197miWx1jpcAp66OZ83mKzsRA05uycgu/SzMHh5Tge49cZOl
	HR3X9hUn+IFCNC5nzvaSh6VWEEyOk1SIiVi7xRegybi3SHNDD5fZUmHy0ejg4xE/Kj56tv
	WXi7tB1eY39oX2KuP9iKXFiPHMn3uVAnhfdiQLzfYQxCtS6vnfRradAilZhBEK47tx43Oz
	DAfcJEIgRgCSqyPPhKtqnhWhtedqYQSc81G9HZCnf3G0tVKyaX5vW3JmHXjyBZ2+auejqd
	I2KQS+dsAAH8P6tRlyhBG8mLTTVVD0MSLdzE7vbXYO/mYSbfs1elysxlAohuMw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2] dev-manual: common-tasks.rst: rewrite the section about
 configuration templates
Date: Wed, 21 Sep 2022 11:00:32 +0200
Message-Id: <20220921090032.56864-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <12b8b41b-caf1-5e34-0003-def37613d705@theobroma-systems.com>
References: <12b8b41b-caf1-5e34-0003-def37613d705@theobroma-systems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Sep 2022 09:00:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3196

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This now includes a description about how to create a template
with the newly added tooling, and drops the description
of .templateconf as a way to point to a custom template
(which is not correct: .templateconf is used only to point to a default
template in poky or core when TEMPLATECONF is not specified).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---
Changes in V2:
- Misc syntax fixes from the reviews from Quentin Schulz and Michael Opdenacker
---
 documentation/dev-manual/common-tasks.rst | 92 +++++++++--------------
 1 file changed, 36 insertions(+), 56 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 837824be38..cfbd0bef02 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -6466,71 +6466,51 @@ Creating a Custom Template Configuration Directory
 ==================================================
 
 If you are producing your own customized version of the build system for
-use by other users, you might want to customize the message shown by the
-setup script or you might want to change the template configuration
-files (i.e. ``local.conf`` and ``bblayers.conf``) that are created in a
-new build directory.
+use by other users, you might want to provide a custom build configuration
+that includes all the necessary settings and layers (i.e. ``local.conf`` and
+``bblayers.conf`` that are created in a new build directory) and a custom
+message that is shown when setting up the build. This can be done by
+creating one or more template configuration directories in your
+custom distribution layer.
 
-The OpenEmbedded build system uses the environment variable
-:term:`TEMPLATECONF` to locate the directory from which it gathers
-configuration information that ultimately ends up in the
-:term:`Build Directory` ``conf`` directory.
-By default, :term:`TEMPLATECONF` is set as follows in the ``poky``
-repository::
+This can be done by using ``bitbake-layers save-build-conf``::
 
-   TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf}
-
-This is the
-directory used by the build system to find templates from which to build
-some key configuration files. If you look at this directory, you will
-see the ``bblayers.conf.sample``, ``local.conf.sample``, and
-``conf-notes.txt`` files. The build system uses these files to form the
-respective ``bblayers.conf`` file, ``local.conf`` file, and display the
-list of BitBake targets when running the setup script.
-
-To override these default configuration files with configurations you
-want used within every new Build Directory, simply set the
-:term:`TEMPLATECONF` variable to your directory. The :term:`TEMPLATECONF`
-variable is set in the ``.templateconf`` file, which is in the top-level
-:term:`Source Directory` folder
-(e.g. ``poky``). Edit the ``.templateconf`` so that it can locate your
-directory.
+   $ bitbake-layers save-build-conf ../../meta-alex/ test-1
+   NOTE: Starting bitbake server...
+   NOTE: Configuration template placed into /srv/work/alex/meta-alex/conf/templates/test-1
+   Please review the files in there, and particularly provide a configuration description in /srv/work/alex/meta-alex/conf/templates/test-1/conf-notes.txt
+   You can try out the configuration with
+   TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
 
-Best practices dictate that you should keep your template configuration
-directory in your custom distribution layer. For example, suppose you
-have a layer named ``meta-mylayer`` located in your home directory and
-you want your template configuration directory named ``myconf``.
-Changing the ``.templateconf`` as follows causes the OpenEmbedded build
-system to look in your directory and base its configuration files on the
-``*.sample`` configuration files it finds. The final configuration files
-(i.e. ``local.conf`` and ``bblayers.conf`` ultimately still end up in
-your Build Directory, but they are based on your ``*.sample`` files.
-::
+The above command takes the config files from the currently active build directory under ``conf``,
+replaces site-specific paths in ``bblayers.conf`` with ``##OECORE##``-relative paths, and copies
+the config files into a specified layer under a specified template name.
 
-   TEMPLATECONF=${TEMPLATECONF:-meta-mylayer/myconf}
+To use those saved templates as a starting point for a build, users should point
+to one of them with :term:`TEMPLATECONF` environment variable::
 
-Aside from the ``*.sample`` configuration files, the ``conf-notes.txt``
-also resides in the default ``meta-poky/conf`` directory. The script
-that sets up the build environment (i.e.
-:ref:`structure-core-script`) uses this file to
-display BitBake targets as part of the script output. Customizing this
-``conf-notes.txt`` file is a good way to make sure your list of custom
-targets appears as part of the script's output.
+   TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
 
-Here is the default list of targets displayed as a result of running
-either of the setup scripts::
+The OpenEmbedded build system uses the environment variable
+:term:`TEMPLATECONF` to locate the directory from which it gathers
+configuration information that ultimately ends up in the
+:term:`Build Directory` ``conf`` directory.
 
-   You can now run 'bitbake <target>'
+If :term:`TEMPLATECONF` is not set, the default value is obtained
+from ``.templateconf`` file that is read from the same directory as
+``oe-init-build-env`` script. For the Poky reference distribution this
+would be::
 
-   Common targets are:
-       core-image-minimal
-       core-image-sato
-       meta-toolchain
-       meta-ide-support
+   TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf/templates/default}
 
-Changing the listed common targets is as easy as editing your version of
-``conf-notes.txt`` in your custom template configuration directory and
-making sure you have :term:`TEMPLATECONF` set to your directory.
+If you look at a configuration template directory, you will
+see the ``bblayers.conf.sample``, ``local.conf.sample``, and
+``conf-notes.txt`` files. The build system uses these files to form the
+respective ``bblayers.conf`` file, ``local.conf`` file, and show
+users a note about the build they're setting up
+when running the ``oe-init-build-env`` setup script. These can be
+edited further if needed to improve or change the build configurations
+available to the users.
 
 Conserving Disk Space
 =====================
-- 
2.34.1



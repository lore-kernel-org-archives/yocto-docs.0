Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B235C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 16:46:33 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.121.1651077983785933470
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 09:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hy5TeqXK;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A75F1100007;
	Wed, 27 Apr 2022 16:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651077981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vgp4E5ZhRCkAlfBEcxajgLSB6mxj50xJ6jr7nmnmrZo=;
	b=hy5TeqXKsWi/eQhs83Ld2UwDk8DKl7ReJmuSP/a6IgtTnpFL1CKMnQCPxztir1HFQ/RQNm
	B6Do6IqrhWoNNZaSSoeSAqAtzMBNO+jnpakVJZl/eItfuKqRDyNrIU3ZQxV+CgPTuqyzFn
	84hZ/qCjNRSxjmnoVm38Fe7Pdd6PGPGD266eGoGnpIBjdOrrwMFVXXYcEi8WGjtwuDQU7c
	EoPTp2QYywcO9QWUS7hBCZtOL+VcC3/zhI4+4lZX5ZZfxOR0Cf0pY1wub5G9tb1FOFgAbp
	LYLbrO0MWHssUEOCCqlKOYXE1mjh7zX2gICkyXRqYWrPpa3BRVW3LE2UPyAX6A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: improve documentation for TEMPLATECONF
Date: Wed, 27 Apr 2022 18:46:16 +0200
Message-Id: <20220427164616.247280-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 16:46:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2898

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Add it to the variable index
Misc improvements to the documentation for this variable

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---

New submission after a first submission to the BitBake manual.
See the thread on
https://lore.kernel.org/bitbake-devel/20220426214901.201802-1-michael.opdenacker@bootlin.com/T/#t

 documentation/dev-manual/common-tasks.rst      |  8 ++++----
 documentation/ref-manual/structure.rst         |  8 ++++----
 documentation/ref-manual/variables.rst         | 15 +++++++++++++++
 documentation/toaster-manual/setup-and-use.rst |  2 +-
 4 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b228c75aab..20d2fc4109 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -6432,10 +6432,10 @@ files (i.e. ``local.conf`` and ``bblayers.conf``) that are created in a
 new build directory.
 
 The OpenEmbedded build system uses the environment variable
-``TEMPLATECONF`` to locate the directory from which it gathers
+:term:`TEMPLATECONF` to locate the directory from which it gathers
 configuration information that ultimately ends up in the
 :term:`Build Directory` ``conf`` directory.
-By default, ``TEMPLATECONF`` is set as follows in the ``poky``
+By default, :term:`TEMPLATECONF` is set as follows in the ``poky``
 repository::
 
    TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf}
@@ -6450,7 +6450,7 @@ list of BitBake targets when running the setup script.
 
 To override these default configuration files with configurations you
 want used within every new Build Directory, simply set the
-``TEMPLATECONF`` variable to your directory. The ``TEMPLATECONF``
+:term:`TEMPLATECONF` variable to your directory. The :term:`TEMPLATECONF`
 variable is set in the ``.templateconf`` file, which is in the top-level
 :term:`Source Directory` folder
 (e.g. ``poky``). Edit the ``.templateconf`` so that it can locate your
@@ -6490,7 +6490,7 @@ either of the setup scripts::
 
 Changing the listed common targets is as easy as editing your version of
 ``conf-notes.txt`` in your custom template configuration directory and
-making sure you have ``TEMPLATECONF`` set to your directory.
+making sure you have :term:`TEMPLATECONF` set to your directory.
 
 Conserving Disk Space
 =====================
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 262b041ea6..12a085552f 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -261,7 +261,7 @@ OpenEmbedded build system creates it from ``local.conf.sample`` when you
 :ref:`structure-core-script`.
 
 The source ``local.conf.sample`` file used depends on the
-``$TEMPLATECONF`` script variable, which defaults to ``meta-poky/conf/``
+:term:`TEMPLATECONF` script variable, which defaults to ``meta-poky/conf/``
 when you are building from the Yocto Project development environment,
 and to ``meta/conf/`` when you are building from the OpenEmbedded-Core
 environment. Because the script variable points to the source of the
@@ -278,7 +278,7 @@ file, it uses ``sed`` to substitute final
 
 .. note::
 
-   You can see how the ``TEMPLATECONF`` variable is used by looking at the
+   You can see how the :term:`TEMPLATECONF` variable is used by looking at the
    ``scripts/oe-setup-builddir`` script in the :term:`Source Directory`.
    You can find the Yocto Project version of the ``local.conf.sample`` file in
    the ``meta-poky/conf`` directory.
@@ -300,7 +300,7 @@ you ``source`` the top-level build environment setup script (i.e.
 :ref:`structure-core-script`).
 
 As with the ``local.conf`` file, the source ``bblayers.conf.sample``
-file used depends on the ``$TEMPLATECONF`` script variable, which
+file used depends on the :term:`TEMPLATECONF` script variable, which
 defaults to ``meta-poky/conf/`` when you are building from the Yocto
 Project development environment, and to ``meta/conf/`` when you are
 building from the OpenEmbedded-Core environment. Because the script
@@ -315,7 +315,7 @@ Once the build process gets the sample file, it uses ``sed`` to substitute final
 
 .. note::
 
-   You can see how the ``TEMPLATECONF`` variable ``scripts/oe-setup-builddir``
+   You can see how the :term:`TEMPLATECONF` variable is defined by the ``scripts/oe-setup-builddir``
    script in the :term:`Source Directory`. You can find the Yocto Project
    version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/``
    directory.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f8808cc052..9020068dc4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7899,6 +7899,21 @@ system and gives an overview of their function and contents.
       toolchain. You can use ``meta-sourcery`` as a template for adding
       support for other external toolchains.
 
+   :term:`TEMPLATECONF`
+      Specifies the directory used by the build system to find templates
+      from which to build the ``bblayers.conf`` and ``local.conf`` files.
+      Use this variable if you wish to customize such files, and the default
+      BitBake targets shown when sourcing the ``oe-init-build-env`` script.
+
+      For details, see the
+      :ref:`dev-manual/common-tasks:creating a custom template configuration directory`
+      section in the Yocto Project Development Tasks manual.
+
+      .. note::
+
+         You must set this variable in the external environment in order
+         for it to work.
+
    :term:`TEST_EXPORT_DIR`
       The location the OpenEmbedded build system uses to export tests when
       the :term:`TEST_EXPORT_ONLY` variable is set
diff --git a/documentation/toaster-manual/setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
index 1e1a314d66..72a15b5f2d 100644
--- a/documentation/toaster-manual/setup-and-use.rst
+++ b/documentation/toaster-manual/setup-and-use.rst
@@ -311,7 +311,7 @@ Perform the following steps to install Toaster:
     migrations). The next line sets the Toaster root directory
     ``TOASTER_DIR`` and the location of the Toaster configuration file
     ``TOASTER_CONF``, which is relative to ``TOASTER_DIR``. The
-    ``TEMPLATECONF`` value reflects the contents of
+    :term:`TEMPLATECONF` value reflects the contents of
     ``poky/.templateconf``, and by default, should include the string
     "poky". For more information on the Toaster configuration file, see
     the ":ref:`toaster-manual/reference:Configuring Toaster`" section.
-- 
2.25.1



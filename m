Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55E6FA3746
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 10:19:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.4619.1666952389542883847
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 03:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AyM7Di1g;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B5A242000C;
	Fri, 28 Oct 2022 10:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666952387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TU7qDzZW5Cvkq2K/xqGc9TgZih3HK9r3IGfv/lTQOvs=;
	b=AyM7Di1gWCPHakWinkcW7fGCgnRM4kzUerbPH4iArf9Gfw2jGSdXj8xXNYgtkFJdoro8rz
	doAD9cbtoeL7Ey/plD8vdnIZUJVNpIFVJ2Az6ikF64BddeLcWG2HAa/mr6JKadh/rJCZ3i
	LcOtX6olPLOLUUIr152ujyBPe878C9ZwXHv83rSLPfKAL2ZyGaCLa/FV27k4SQCUYlgLfu
	+PD+hdss80+lSx6qwiOaAlvAwnA/50/SpyNC5MYwGkm5coi9yQ5KO/HJsanrSoJNVFN9g/
	s58yviUoAnE8N+f0jwvEdrgz8588/jfpocTEY9HRu5XioMumR0/A43+6BtLmRQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/5] ref-manual: variables.rst: document spdx-create class variables
Date: Fri, 28 Oct 2022 12:19:36 +0200
Message-Id: <20221028101939.93195-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
References: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 10:19:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3433

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 79 ++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0f9df3ac20..14a20711f5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7290,6 +7290,85 @@ system and gives an overview of their function and contents.
 
          You can specify only a single URL in :term:`SOURCE_MIRROR_URL`.
 
+   :term:`SPDX_ARCHIVE_PACKAGED`
+      This option allows to add to :term:`SPDX` output compressed archives
+      of the files in the generated target packages.
+
+      Such archives are available in
+      ``tmp/deploy/spdx/MACHINE/packages/packagename.tar.zst``
+      under the :term:`Build Directory`.
+
+      Enable this option as follows::
+
+         SPDX_ARCHIVE_PACKAGED = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling this
+      option multiplied the size of the ``tmp/deploy/spdx`` directory by a
+      factor of 13 (+1.6 GiB for this image), compared to just using the
+      :ref:`create-spdx <ref-classes-create-spdx>` class with no option.
+
+      Note that this option doesn't increase the size of :term:`SPDX`
+      files in ``tmp/deploy/images/MACHINE``.
+
+   :term:`SPDX_ARCHIVE_SOURCES`
+      This option allows to add to :term:`SPDX` output compressed archives
+      of the sources for packages installed on the target. It currently
+      only works when :term:`SPDX_INCLUDE_SOURCES` is set.
+
+      Such archives are available in
+      ``tmp/deploy/spdx/MACHINE/recipes/recipe-packagename.tar.zst``
+      under the :term:`Build Directory`.
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_SOURCES = "1"
+         SPDX_ARCHIVE_SOURCES = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      these options multiplied the size of the ``tmp/deploy/spdx``
+      directory by a factor of 11 (+1.4 GiB for this image),
+      compared to just using the :ref:`create-spdx <ref-classes-create-spdx>`
+      class with no option.
+
+      Note that using this option only marginally increases the size
+      of the :term:`SPDX` output in ``tmp/deploy/images/MACHINE/``
+      (+ 0.07\% with the tested image), compared to just enabling
+      :term:`SPDX_INCLUDE_SOURCES`.
+
+   :term:`SPDX_INCLUDE_SOURCES`
+      This option allows to add a description of the source files used to build
+      the host tools and the target packages, to the ``spdx.json`` files in
+      ``tmp/deploy/spdx/MACHINE/recipes/`` under the :term:`Build Directory`.
+      As a consequence, the ``spdx.json`` files under the ``by-namespace`` and
+      ``packages`` subdirectories in ``tmp/deploy/spdx/MACHINE`` are also
+      modified to include references to such source file descriptions.
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_SOURCES = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      this option multiplied the total size of the ``tmp/deploy/spdx``
+      directory by a factor of 3  (+291 MiB for this image),
+      and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
+      ``tmp/deploy/images/MACHINE`` by a factor of 130 (+15 MiB for this
+      image), compared to just using the
+      :ref:`create-spdx <ref-classes-create-spdx>` class with no option.
+
+   :term:`SPDX_PRETTY`
+      This option makes the SPDX output more human-readable, using
+      identation and newlines, instead of the default output in a
+      single line::
+
+         SPDX_PRETTY = "1"
+
+      The generated SPDX files are approximately 20% bigger, but
+      this option is recommended if you want to inspect the SPDX
+      output files with a text editor.
+
    :term:`SPDXLICENSEMAP`
       Maps commonly used license names to their SPDX counterparts found in
       ``meta/files/common-licenses/``. For the default :term:`SPDXLICENSEMAP`
-- 
2.34.1



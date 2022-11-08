Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40500C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 20:40:34 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.2360.1667940030338473563
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 12:40:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TP0wXZlV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 503EBE0006;
	Tue,  8 Nov 2022 20:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667940028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCseZsLdlGAgJ0U9mfHCSuzIuF3qp30x2duZGh5HJk4=;
	b=TP0wXZlV1xsBqoLph1icSPXrL57w9h5HRXyf61hCVj/hx4fjWSkQViRRc/k4XbAEKrmYmy
	tiO8FaNdRqhco4PoJpFVgk0LhSm5jW7mLt4C6HUnUvlb6HZ0FytSPpUV8OsSlPAHgXpwXC
	Blof2GYS6k+G9Tvc+6SMf6AN5xxeDvgbgiq5FeuMLr9x05A/RQShcN5tRDkdUKnbjSiaiX
	Gzegns1k/hQlcWrpxPryluODnUBC5SvPi4LxfDV8yDHfRExv7HzzKdWlYdAApSnc1GbIoT
	8+fwKf4yboimwt8kfLShGp03FBv6C3tU0mf6eXmpq2MSdBdGmfdoUTmwpcXbqA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] ref-manual/variables.rst: expand PARALLEL_MAKE description
Date: Tue,  8 Nov 2022 21:40:17 +0100
Message-Id: <20221108204017.494051-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108204017.494051-1-michael.opdenacker@bootlin.com>
References: <20221108204017.494051-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Nov 2022 20:40:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3476

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Explain that this variable apply not only to make, but also
to ninja, and to other build tools which support parallel jobs.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 28 +++++++++++++++-----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 147679400f..d3aae63308 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5818,17 +5818,20 @@ system and gives an overview of their function and contents.
       desired splitting.
 
    :term:`PARALLEL_MAKE`
-      Extra options passed to the ``make`` command during the
-      :ref:`ref-tasks-compile` task in order to specify
-      parallel compilation on the local build host. This variable is
-      usually in the form "-j x", where x represents the maximum number of
-      parallel threads ``make`` can run.
+
+      Extra options passed to the build tool command (``make``,
+      ``ninja`` or more specific build engines, like the Go language one)
+      during the :ref:`ref-tasks-compile` task, to specify parallel compilation
+      on the local build host. This variable is usually in the form "-j x",
+      where x represents the maximum number of parallel threads such engines
+      can run.
 
       .. note::
 
-         In order for :term:`PARALLEL_MAKE` to be effective, ``make`` must be
-         called with ``${``\ :term:`EXTRA_OEMAKE`\ ``}``. An easy way to ensure
-         this is to use the ``oe_runmake`` function.
+         For software compiled by ``make``, in order for :term:`PARALLEL_MAKE`
+         to be effective, ``make`` must be called with
+         ``${``\ :term:`EXTRA_OEMAKE`\ ``}``. An easy
+         way to ensure this is to use the ``oe_runmake`` function.
 
       By default, the OpenEmbedded build system automatically sets this
       variable to be equal to the number of cores the build system uses.
@@ -5853,15 +5856,16 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual.
 
    :term:`PARALLEL_MAKEINST`
-      Extra options passed to the ``make install`` command during the
-      :ref:`ref-tasks-install` task in order to specify
+      Extra options passed to the build tool install command
+      (``make install``, ``ninja install`` or more specific ones)
+      during the :ref:`ref-tasks-install` task in order to specify
       parallel installation. This variable defaults to the value of
       :term:`PARALLEL_MAKE`.
 
       .. note::
 
-         In order for :term:`PARALLEL_MAKEINST` to be effective, ``make`` must
-         be called with
+         For software compiled by ``make``, in order for :term:`PARALLEL_MAKEINST`
+         to be effective, ``make`` must be called with
          ``${``\ :term:`EXTRA_OEMAKE`\ ``}``. An easy
          way to ensure this is to use the ``oe_runmake`` function.
 
-- 
2.34.1



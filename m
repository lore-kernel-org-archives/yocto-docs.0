Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167A4C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 14:24:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.53422.1699021456088657469
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 07:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kx4VRgK0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B8BDFF80D;
	Fri,  3 Nov 2023 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699021454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hra/vJSDHGbyQuZ76E5lO9WsiMrHIaVSsbT+H8WbL+s=;
	b=kx4VRgK0aGscfCVjt/d3cgqCxn6LaLY5wglbBlX/uEPgqj8k7LHSA534LWmZ6ybdH9xhD7
	ZB/zpd4QYcbMC2DYiByvRyEkB1fLSIs1ao/6DXgwKB2DkEMLaYrRN8KyhhLY/1NalK2UiS
	UIm1r+EOY12XYVcnyHS346fvKxGrAhwSznHwj1RkmJ4WQYO+YcGUjziJCOMZDGN4NXXGOB
	qmjPYScuRjh10A5vl72/ljBz673wg+je88ITiOv+P29LfIZAfwG8mkeq7zzPcVoRB0SqOX
	hISD7VySMLGpIbpiUS1GomruN0WdegxIlPqdcMCLyqVFR71rR8F4PjSrh6iY9g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] ref-manual: variables; remove SERIAL_CONSOLES_CHECK
Date: Fri,  3 Nov 2023 15:24:10 +0100
Message-Id: <20231103142410.2022995-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103142410.2022995-1-michael.opdenacker@bootlin.com>
References: <20231103142410.2022995-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Nov 2023 14:24:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4582

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

No longer in use in Poky (dropped in Nanbield through
multiple commits)

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 38c63d6179..3002bda3ff 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7641,23 +7641,6 @@ system and gives an overview of their function and contents.
 
          SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
-   :term:`SERIAL_CONSOLES_CHECK`
-      Specifies serial consoles, which must be listed in
-      :term:`SERIAL_CONSOLES`, to check against
-      ``/proc/console`` before enabling them using getty. This variable
-      allows aliasing in the format: <device>:<alias>. If a device was
-      listed as "sclp_line0" in ``/dev/`` and "ttyS0" was listed in
-      ``/proc/console``, you would do the following::
-
-         SERIAL_CONSOLES_CHECK = "slcp_line0:ttyS0"
-
-      This variable is currently only supported with SysVinit (i.e. not
-      with systemd). Note that :term:`SERIAL_CONSOLES_CHECK` also requires
-      ``/etc/inittab`` to be writable when used with SysVinit. This makes it
-      incompatible with customizations such as the following::
-
-         EXTRA_IMAGE_FEATURES += "read-only-rootfs"
-
    :term:`SETUPTOOLS_BUILD_ARGS`
       When used by recipes that inherit the :ref:`ref-classes-setuptools3`
       class, this variable can be used to specify additional arguments to be
-- 
2.34.1



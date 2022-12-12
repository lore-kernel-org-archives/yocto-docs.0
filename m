Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BABC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 09:50:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.39264.1670838599657505248
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 01:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kF8BhqWw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D965F6000C;
	Mon, 12 Dec 2022 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670838597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FUhZwQ2zPwnbhgNjBfTyE2G2v08k+Lk/uazC1rL2Yo0=;
	b=kF8BhqWw627Tz5AsmkKnTS4WcHIsawBfHaKnR+0R0fA3yE88P6T2rtcZBS89nYAShQOTra
	KIZVg+zp1RxqOhOQyE0z0WqN5q+ji4PFWqRCt3z0jgpIDUB/1isdv3JqaZNNfkrVnDXhZy
	p5vXjRNeOMAm7Uf527+Qxa2dKWV+ijG5CjVu7ur2qRTGD0y5OVJA/B8XG/dLM+jtDP369l
	9y9tm7xC/a6B94ul5RE2VsCtmByzQvsqJHD0HDaGMFGkvanme5e5iT56fFnGev2pqBArjt
	1dogyonEbmNgql1O7e0XVsNkboVNElCM7YGKKZWZ9YCYgy4iaU9vLI4CSdyicA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: final removal of SERIAL_CONSOLE variable
Date: Mon, 12 Dec 2022 10:49:55 +0100
Message-Id: <20221212094955.58455-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Dec 2022 09:50:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3545

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This deprecated variable has been removed for good through
https://git.openembedded.org/openembedded-core/commit/?id=9d053af1fb570b4e3483de4ecd6827e1e0be61b7

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-2.6.rst | 15 ++++++---------
 documentation/ref-manual/variables.rst           | 13 -------------
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index 8e79a3edc9..356f720850 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -211,22 +211,19 @@ The following changes have been made:
 ``SERIAL_CONSOLE`` Deprecated
 -----------------------------
 
-The :term:`SERIAL_CONSOLE` variable has been
-functionally replaced by the
-:term:`SERIAL_CONSOLES` variable for some time.
-With the Yocto Project 2.6 release, :term:`SERIAL_CONSOLE` has been
-officially deprecated.
+The ``SERIAL_CONSOLE`` variable has been functionally replaced by the
+:term:`SERIAL_CONSOLES` variable for some time. With the Yocto Project 2.6
+release, ``SERIAL_CONSOLE`` has been officially deprecated.
 
-:term:`SERIAL_CONSOLE` will continue to work as before for the 2.6 release.
+``SERIAL_CONSOLE`` will continue to work as before for the 2.6 release.
 However, for the sake of future compatibility, it is recommended that
-you replace all instances of :term:`SERIAL_CONSOLE` with
-:term:`SERIAL_CONSOLES`.
+you replace all instances of ``SERIAL_CONSOLE`` with :term:`SERIAL_CONSOLES`.
 
 .. note::
 
    The only difference in usage is that :term:`SERIAL_CONSOLES`
    expects entries to be separated using semicolons as compared to
-   :term:`SERIAL_CONSOLE`, which expects spaces.
+   ``SERIAL_CONSOLE``, which expects spaces.
 
 .. _migration-2.6-poky-sets-unknown-configure-option-to-qa-error:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 499a26f50b..7717d6deff 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7305,19 +7305,6 @@ system and gives an overview of their function and contents.
       :term:`FULL_OPTIMIZATION` unless :term:`DEBUG_BUILD` = "1", in which
       case the value of :term:`DEBUG_OPTIMIZATION` is used.
 
-   :term:`SERIAL_CONSOLE`
-      Defines a serial console (TTY) to enable using
-      `getty <https://en.wikipedia.org/wiki/Getty_(Unix)>`__. Provide a
-      value that specifies the baud rate followed by the TTY device name
-      separated by a space. You cannot specify more than one TTY device::
-
-         SERIAL_CONSOLE = "115200 ttyS0"
-
-      .. note::
-
-         The :term:`SERIAL_CONSOLE` variable is deprecated. Please use the
-         :term:`SERIAL_CONSOLES` variable.
-
    :term:`SERIAL_CONSOLES`
       Defines a serial console (TTY) to enable using
       `getty <https://en.wikipedia.org/wiki/Getty_(Unix)>`__. Provide a
-- 
2.37.2



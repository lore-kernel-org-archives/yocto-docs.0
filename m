Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AE4C77B78
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 19:30:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.6384.1681759807923894025
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Apr 2023 12:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LC0sKRzQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CAC4C24000B;
	Mon, 17 Apr 2023 19:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681759806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eBHNqLilj3ZdgUAWzKMti8yPsW5699O0ixtdQjd4wp8=;
	b=LC0sKRzQ7SjMFxbUWS+MrgVhfgCY3/EOMB1tcn610EdsIO8vy5IyQHj3VMgZEtjuFy0Yyt
	DPam9znSdqx2ZDyu0sfBarrqGIX+MjEtgxKNaLDaO/CFXvGlX4QWGJ5ilwWEsKi5LXxq9A
	7aufKX0TbXbQRCjA4IgrCDtwY2B6pvDIS0JyXfUdZYiJvgqlbVR8j/0dap7h5EIl5CJsEX
	+WLSg0U9FhP2oJB1f6D0DLpfI3aFV6AJG2sirZWPGps7eaLD2PYqUmV/DTm6Ucv1MO/Wzq
	K4wYeSS8URzQiYZK4draSW/JW1pPwMvYCqCnVnYSYp0vowLLiQA+4O7i1P7ooA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: variables.rst: add wikipedia shortcut for "getty"
Date: Mon, 17 Apr 2023 21:29:59 +0200
Message-Id: <20230417192959.1250012-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Apr 2023 19:30:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3839

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 62f28bd278..53105afa32 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7385,9 +7385,9 @@ system and gives an overview of their function and contents.
 
    :term:`SERIAL_CONSOLES`
       Defines a serial console (TTY) to enable using
-      `getty <https://en.wikipedia.org/wiki/Getty_(Unix)>`__. Provide a
-      value that specifies the baud rate followed by the TTY device name
-      separated by a semicolon. Use spaces to separate multiple devices::
+      :wikipedia:`getty <Getty_(Unix)>`. Provide a value that specifies the
+      baud rate followed by the TTY device name separated by a semicolon.
+      Use spaces to separate multiple devices::
 
          SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
@@ -8316,12 +8316,10 @@ system and gives an overview of their function and contents.
       will be silently ignored.
 
    :term:`SYSVINIT_ENABLED_GETTYS`
-      When using
-      :ref:`SysVinit <dev-manual/new-recipe:enabling system services>`,
+      When using :ref:`SysVinit <dev-manual/new-recipe:enabling system services>`,
       specifies a space-separated list of the virtual terminals that should
-      run a `getty <https://en.wikipedia.org/wiki/Getty_%28Unix%29>`__
-      (allowing login), assuming :term:`USE_VT` is not set to
-      "0".
+      run a :wikipedia:`getty <Getty_(Unix)>` (allowing login), assuming
+      :term:`USE_VT` is not set to "0".
 
       The default value for :term:`SYSVINIT_ENABLED_GETTYS` is "1" (i.e. only
       run a getty on the first virtual terminal).
@@ -9228,9 +9226,8 @@ system and gives an overview of their function and contents.
    :term:`USE_VT`
       When using
       :ref:`SysVinit <dev-manual/new-recipe:enabling system services>`,
-      determines whether or not to run a
-      `getty <https://en.wikipedia.org/wiki/Getty_%28Unix%29>`__ on any
-      virtual terminals in order to enable logging in through those
+      determines whether or not to run a :wikipedia:`getty <Getty_(Unix)>`
+      on any virtual terminals in order to enable logging in through those
       terminals.
 
       The default value used for :term:`USE_VT` is "1" when no default value is
-- 
2.34.1



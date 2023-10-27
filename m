Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58023C25B6E
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 09:29:45 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.3164.1698398980832275783
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 02:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=agjDvemE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51D7A4000B;
	Fri, 27 Oct 2023 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698398978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MqPv6nKDRwVKR62ZpZbs/ai3yTrL0ZGTUxYsTn2HMNs=;
	b=agjDvemEs32hzSVZCcT6jQ8DXd4njhvF9sLtQRUIuOAWzH2Q8/aUpQUmeGg3uoKJaRXXER
	q1KE+Fh4zgsMvsf5RPicmqVXwNXY98vj2c2X2NyStWKxHd9gD6KREooAbvN7AePpbcE5CE
	LVWuIqdozwA8qXGqY/GHg26t5lXr5NARYBbdFSJb8ePKGDtTmy1UDyHjuTEzyAYwrIaozD
	cEwWRTpQjq2RdMlFmHuj1a3U+nUL20R5fv/9rJA3QbE27pIyvVR5YO4tWzJc9i3MwracJF
	12xIFLh3UNqYnwtpxlXrWrfRpp4u1NvVpHWgMS/+JWZ/jQgtviKSzzC5SIkgxA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] ref-manual: document KERNEL_LOCALVERSION
Date: Fri, 27 Oct 2023 11:29:35 +0200
Message-Id: <20231027092935.1601588-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 09:29:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4508

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Introduced by
https://git.yoctoproject.org/poky/commit/?id=66ed174ccdf7a89cb998f503cc6b631e2d1adcc0

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 03234d3f78..771eb91af6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2485,6 +2485,16 @@ system and gives an overview of their function and contents.
       external tools. See the :ref:`ref-classes-kernel-yocto` class in
       ``meta/classes-recipe`` to see how the variable is used.
 
+   :term:`KERNEL_LOCALVERSION`
+      This variable allows to appends a string to the version
+      of the kernel image. This corresponds to the ``CONFIG_LOCALVERSION``
+      kernel configuration parameter.
+
+      Using this variable is only useful when you are using a kernel recipe
+      inheriting the :ref:`ref-classes-kernel` class, and which doesn't
+      already set a local version. Therefore, setting this variable has no
+      impact on ``linux-yocto`` kernels.
+
    :term:`EXTERNAL_TOOLCHAIN`
       When you intend to use an
       :ref:`external toolchain <dev-manual/external-toolchain:optionally using an external toolchain>`,
-- 
2.34.1



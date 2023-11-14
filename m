Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE12C41535
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 16:49:53 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.17627.1699980591822352206
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 08:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hA1l93C+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EC9C1BF20B;
	Tue, 14 Nov 2023 16:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699980590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9OuiiUqHu/1SFQTG0Q3vJMe58xo6hoSXr8UIVybtGeU=;
	b=hA1l93C+wVs216Ms+hxIx9QawSjQ6BGzQEM1AMdX79SEy197mfS6HxWG5MILayMRrMJolp
	JfayrJA3umlDiOMlzblZrSPIxBbJlI/70+Jqh3FvuyOZ/LnMX77htfwOiMIlCp6bW4jYmO
	ExA3g86eCkWPKInpXzQ5WPhL911Vh74vt+vrImQbCTqzFLWO4L3yedQxFNzME4OWUHFZcL
	OUua7vJm96S/UfTuYmfMKL+1XW2FR8NaTSjPj0f4p+Z/MkzANvmqciZCW0QZtcRp17jmXH
	J+AtVsOR/PJxwmeXXdprcnivz4trtDdG0bYFSc7rTUs8Kv3ekVIoQCko5BSnIg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 2/7] ref-manual: variables: mention new CDN for SSTATE_MIRRORS
Date: Tue, 14 Nov 2023 17:49:37 +0100
Message-Id: <20231114164942.133472-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
References: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Nov 2023 16:49:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4622

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 58a763cb3a..5a34ea7856 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7619,6 +7619,16 @@ system and gives an overview of their function and contents.
              file://.* https://someserver.tld/share/sstate/PATH;downloadfilename=PATH \
              file://.* file:///some-local-dir/sstate/PATH"
 
+      The Yocto Project actually shares the cache data objects built by its
+      autobuilder::
+
+         SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
+
+      As such binary artifacts are built for the generic QEMU machines
+      supported by the various Poky releases, they are less likely to be
+      reusable in real projects building binaries optimized for a specific
+      CPU family.
+
    :term:`SSTATE_SCAN_FILES`
       Controls the list of files the OpenEmbedded build system scans for
       hardcoded installation paths. The variable uses a space-separated
-- 
2.34.1



Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5962CC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 20:40:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.2346.1667940021966223214
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 12:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bgWqF93V;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EAE6E1BF205;
	Tue,  8 Nov 2022 20:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667940020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UWXO2XXgTzSyg8+oCs+gX9Q/DMgTOSeCmvFBPT22VcU=;
	b=bgWqF93VVydTJ00qvDP/EZoqlO+Y+qLKYAlBly0PGap6q9KItrB+mOcJwwlLqFGCVpdTO3
	FOYl2Zt2RVpwuhaciBW646WYQmfhOhQj+YGYt7gvq+4/7mWqUGE1jbcLETbgz9fqX2zDas
	Xv0Fv26gB8jXR+EUaiWNrbPf+SYG/LETtlNT/do6cvGCSJFPblzXRQxMVQKeQb/nDiVG/K
	N1bTLfLaNXq7DDWczowk81X/XTXzeXt52/jNgtPv4JxUIUT3wEmOdsdtqSyoto7hLVRm8l
	er7BoXThSorEP8AxVR2pKObVHMg/Qftz/KlzNz1A1iplr+GGH29lPfxxhii8GA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] ref-manual/variables.rst: expand BB_NUMBER_THREADS description
Date: Tue,  8 Nov 2022 21:40:16 +0100
Message-Id: <20221108204017.494051-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Nov 2022 20:40:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3475

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Explain that reducing its value to reduce system load
is not sufficient if PARALLEL_MAKE is not reduced as well.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9909622d7a..147679400f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -530,6 +530,33 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/common-tasks:speeding up a build`"
       section in the Yocto Project Development Tasks Manual.
 
+      On the other hand, if your goal is to limit the amount of system
+      resources consumed by BitBake tasks, setting :term:`BB_NUMBER_THREADS`
+      to a number lower than the number of CPU threads in your machine
+      won't be sufficient. That's because each package will still be built
+      and installed through a number of parallel jobs specified by the
+      :term:`PARALLEL_MAKE` variable, which is by default the number of CPU
+      threads in your system, and is not impacted by the
+      :term:`BB_NUMBER_THREADS` value.
+
+      So, if you set :term:`BB_NUMBER_THREADS` to "1" but don't set
+      :term:`PARALLEL_MAKE`, most of your system resources will be consumed
+      anyway.
+
+      Therefore, if you intend to reduce the load of your build system by
+      setting :term:`BB_NUMBER_THREADS` to a relatively low value compared
+      to the number of CPU threads on your system, you should also set
+      :term:`PARALLEL_MAKE` to a similarly low value.
+
+      An alternative to using :term:`BB_NUMBER_THREADS` to keep the usage
+      of build system resources under control is to use the smarter
+      :term:`BB_PRESSURE_MAX_CPU`, :term:`BB_PRESSURE_MAX_IO` or
+      :term:`BB_PRESSURE_MAX_MEMORY` controls. They will prevent BitBake
+      from starting new tasks as long as thresholds are exceeded. Anyway,
+      as with :term:`BB_NUMBER_THREADS`, such controls won't prevent the
+      tasks already being run from using all CPU threads on the system
+      if :term:`PARALLEL_MAKE` is not set to a low value.
+
    :term:`BB_SERVER_TIMEOUT`
       Specifies the time (in seconds) after which to unload the BitBake
       server due to inactivity. Set :term:`BB_SERVER_TIMEOUT` to determine how
-- 
2.34.1



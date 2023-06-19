Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F92AEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 08:48:42 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.3420.1687164515843889623
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 01:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SWgLCT7q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687164514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NFXEZr/3NuMtdrI7eJ8xbGFOyUwW5wdSAfGk/iUkaj4=;
	b=SWgLCT7qzosybbHAY3v4zE7aQp77KL7TEcPOVvJqKmL8IGwFt40oxWgVQGArzxY7OzLPj+
	aG50iekyTvuveCLVpvJEHvQsyf7GiSF1VLEa39T/gvc4F5v9rJr/l15t+g4OxNyDDH4+ke
	g0y17Uaa8Bxi7rouf1zcxLO1JV+oOBmAbFXbgehcVclo2CuIRxrZcIyEglQya2OjHXl6kc
	p1m8F0h+PFWSp8tlYMzHj6UiXP3pQ1DkT4rT3Uh4qtrquzhrrfDpLTIbYgGGaOyl8uK8aY
	jsDmATEjHwKbkUNijrW4k+bdbegIChbpvOUCDrpV3Aq3i0hp+HUmtdKjBI2n3A==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80EDA1BF20A;
	Mon, 19 Jun 2023 08:48:33 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Hannu Lounento <hannu.lounento@vaisala.com>
Subject: [PATCH] [mickledore] profile-manual: fix blktrace remote usage instructions
Date: Mon, 19 Jun 2023 10:48:26 +0200
Message-Id: <20230619084826.860933-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 Jun 2023 08:48:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4002

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Hannu Lounento <hannu.lounento@vaisala.com>

The references to the target and host systems (i.e. the client and
server respectively) were swapped in the instructions.

Also, there's no need to specify the device node on the server command
line that is run on the host system.

The previous, incorrect, instructions resulted typically in:

    target# blktrace -l /dev/mmcblk1
    server: waiting for connections...

and

    host$ blktrace -d /dev/mmcblk2 -h target
    Invalid path /dev/mmcblk2 specified: 2/No such file or directory

unless the same device node happened to exist on the host system.

Based on

    target# blktrace --version
    blktrace version 2.0.0

and

    host$ blktrace --version
    blktrace version 2.0.0

Signed-off-by: Hannu Lounento <hannu.lounento@vaisala.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/usage.rst | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 703ac459a0..6f0b0418e7 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -2423,20 +2423,21 @@ tracer writes to, blktrace provides a way to trace without perturbing
 the traced device at all by providing native support for sending all
 trace data over the network.
 
-To have blktrace operate in this mode, start blktrace on the target
-system being traced with the -l option, along with the device to trace::
+To have blktrace operate in this mode, start blktrace in server mode on the
+host system, which is going to store the captured data::
 
-   root@crownbay:~# blktrace -l /dev/sdc
+   $ blktrace -l
    server: waiting for connections...
 
-On the host system, use the -h option to connect to the target system,
-also passing it the device to trace::
+On the target system that is going to be traced, start blktrace in client
+mode with the -h option to connect to the host system, also passing it the
+device to trace::
 
-   $ blktrace -d /dev/sdc -h 192.168.1.43
+   root@crownbay:~# blktrace -d /dev/sdc -h 192.168.1.43
    blktrace: connecting to 192.168.1.43
    blktrace: connected!
 
-On the target system, you should see this::
+On the host system, you should see this::
 
    server: connection from 192.168.1.43
 
@@ -2446,7 +2447,7 @@ In another shell, execute a workload you want to trace. ::
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
    linux-2.6.19.2.tar.b 100% \|*******************************\| 41727k 0:00:00 ETA
 
-When it's done, do a Ctrl-C on the host system to stop the
+When it's done, do a Ctrl-C on the target system to stop the
 trace::
 
    ^C=== sdc ===
@@ -2454,7 +2455,7 @@ trace::
     CPU  1:                 4109 events,      193 KiB data
     Total:                 11800 events (dropped 0),      554 KiB data
 
-On the target system, you should also see a trace summary for the trace
+On the host system, you should also see a trace summary for the trace
 just ended::
 
    server: end of run for 192.168.1.43:sdc
-- 
2.34.1



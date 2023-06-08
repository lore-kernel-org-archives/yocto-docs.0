Return-Path: <hannu.lounento@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C4AC7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 11:42:29 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.6802.1686224546546854309
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 04:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kapsi.fi header.s=20161220 header.b=ZaElZZ2Y;
 spf=pass (domain: kapsi.fi, ip: 91.232.154.25, mailfrom: hlounent@kapsi.fi)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=YmcQ18gIDDSwtXI5gB8QXC0GJeczYkp2BikauyRgv7g=; b=ZaElZZ2YCWl6uxVbCyWIstfQML
	TNA8Z/aCGARRueFsClCXYUTSQwdme6nCGpPIeXrAsLCeN1/Axd4gY6iSSxuqEhnmSYuRCJzajhukr
	0/sNLEfJ5LmibcETKjZN0Wqr63OgzesjPnFxbD2+5cQt/Gvp805NB7CXn1XS/t3RtxoSYNKh6p2vw
	En3z6dYCvUxnZ/UdoeE7ar3FNCGbS10tq4y4qeDwn3l/PYGvVwluuMODCs3RsTr7OF1bImeBaWc1p
	sFzXt471M8+9mZkyRaH/MUm6I8poqyhzadM0YiBGSgZBovRxi+4O9pxbTnKIUdXOBpMF0iyUjdE0Y
	5EzQPFLA==;
Received: from 82-203-162-149.bb.dnainternet.fi ([82.203.162.149] helo=hel-r90xmr7m.corp.vaisala.com)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <hannu.lounento@vaisala.com>)
	id 1q7E22-00FJK4-6S; Thu, 08 Jun 2023 14:42:22 +0300
From: hannu.lounento@vaisala.com
To: docs@lists.yoctoproject.org
Cc: Hannu Lounento <hannu.lounento@vaisala.com>
Subject: [PATCH] profile-manual: fix blktrace remote usage instructions
Date: Thu,  8 Jun 2023 14:42:13 +0300
Message-Id: <20230608114213.18309-1-hannu.lounento@vaisala.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 82.203.162.149
X-SA-Exim-Mail-From: hannu.lounento@vaisala.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Jun 2023 11:42:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3991

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
2.40.1



Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C010C47082
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.4429.1665393876866145098
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ckxBNxFN;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 66B8F20EC33B; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 66B8F20EC33B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=sJWDv9Bq/IeBdGfnyLjWBABP458rKJDFVWzVf/Drp3k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ckxBNxFNW8qeGh6sKsi4dWRysC1o4TNNyoe2STPeaEqtt1tYvLMhGaB3MvtXi45XK
	 THkw1/iTKHyKF2OyRn3bLuBPi30bDxm7f0G2ToyGWYaaGH3rTSXAVoO7NPK3+u6veD
	 iBTZRJhLkbSwiIOZ7QNwfclrPTbtgOixmvfaab9Q=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 13/34] ref-manual: add pressure limit variable documentation
Date: Mon, 10 Oct 2022 02:23:59 -0700
Message-Id: 
 <d0e6b7661912a5aeedc3e193ff76982cb0fc8dc1.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3312

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add BB_PRESSURE_MAX_CPU, BB_PRESSURE_MAX_IO and BB_PRESSURE_MAX_MEMORY
variables (new in 4.1), based upon the supremely detailed commit
messages from Aryaman Gupta <aryaman.gupta@windriver.com> who
implemented the functionality. There is probably enough material for a
proper BitBake manual section (particularly if we can have some good
guidance on how users should determine the values for best performance)
but I did not have time to write such a section, and the BitBake manual
probably needs some additional preamble on tasks / scheduling
beforehand.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0c6bd80..e4304d1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -530,6 +530,48 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/common-tasks:speeding up a build`"
       section in the Yocto Project Development Tasks Manual.
 
+   :term:`BB_PRESSURE_MAX_CPU`
+      Specifies a maximum CPU pressure threshold, above which BitBake's
+      scheduler will not start new tasks (providing there is at least
+      one active task). If no value is set, CPU pressure is not
+      monitored when starting tasks.
+
+      The pressure data is calculated based upon what (recent) Linux
+      kernels expose under ``/proc/pressure``. The threshold represents
+      the difference in "total" pressure from the previous second. The
+      minimum value is 1.0 (extremely slow builds) and the maximum is
+      1000000 (a pressure value unlikely to ever be reached).
+
+   :term:`BB_PRESSURE_MAX_IO`
+      Specifies a maximum I/O pressure threshold, above which BitBake's
+      scheduler will not start new tasks (providing there is at least
+      one active task). If no value is set, I/O pressure is not
+      monitored when starting tasks.
+
+      The pressure data is calculated based upon what (recent) Linux
+      kernels expose under ``/proc/pressure``. The threshold represents
+      the difference in "total" pressure from the previous second. The
+      minimum value is 1.0 (extremely slow builds) and the maximum is
+      1000000 (a pressure value unlikely to ever be reached).
+
+   :term:`BB_PRESSURE_MAX_MEMORY`
+      Specifies a maximum memory pressure threshold, above which BitBake's
+      scheduler will not start new tasks (providing there is at least
+      one active task). If no value is set, memory pressure is not
+      monitored when starting tasks.
+
+      The pressure data is calculated based upon what (recent) Linux
+      kernels expose under ``/proc/pressure``. The threshold represents
+      the difference in "total" pressure from the previous second. The
+      minimum value is 1.0 (extremely slow builds) and the maximum is
+      1000000 (a pressure value unlikely to ever be reached).
+
+      Memory pressure is experienced when time is spent swapping,
+      refaulting pages from the page cache or performing direct reclaim.
+      This is why memory pressure is rarely seen, but setting this variable
+      might be useful as a last resort to prevent OOM errors if they are
+      occurring during builds.
+
    :term:`BB_SERVER_TIMEOUT`
       Specifies the time (in seconds) after which to unload the BitBake
       server due to inactivity. Set :term:`BB_SERVER_TIMEOUT` to determine how
-- 
1.8.3.1



Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F17BC3A59F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.4251.1665393876349524983
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=KU0dMhoW;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id EF8DD20EC31D; Mon, 10 Oct 2022 02:24:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EF8DD20EC31D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393875;
	bh=9PTlhrEgYnckTSiPSA6fCq0arhdegX9AGVsM+jMzsNE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KU0dMhoWu4qEemcmgo/nSHMac1NDsqJPvNbzMIQoZCWP1/GLz3zr0XXGUQ3zgM5RD
	 bkXrKUoLdTKaO3Dxj/D1Mh+prwhiLLtk4w9ywCYXQE2rT5lhmAGbUmn1Qm8757TmXg
	 TCAopywBYiTBE9ifVB6fXa9pbeVmO2I7lG5R3iDA=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 04/34] ref-manual: add WATCHDOG_TIMEOUT to variable glossary
Date: Mon, 10 Oct 2022 02:23:50 -0700
Message-Id: 
 <06f9771ae31a22698439cdab17a186f77a80887c.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3305

From: Paul Eggleton <paul.eggleton@microsoft.com>

In 4.1 the WATCHDOG_TIMEOUT variable is now used in two places, so let's
actually document it.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8b0331c..9eb453c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8872,6 +8872,10 @@ system and gives an overview of their function and contents.
       can control with this variable, see the
       ":ref:`ref-classes-insane`" section.
 
+   :term:`WATCHDOG_TIMEOUT`
+      Specifies the timeout in seconds used by the ``watchdog`` recipe and
+      also by ``systemd`` during reboot. The default is 60 seconds.
+
    :term:`WKS_FILE`
       Specifies the location of the Wic kickstart file that is used by the
       OpenEmbedded build system to create a partitioned image
-- 
1.8.3.1



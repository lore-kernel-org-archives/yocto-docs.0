Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7158C4167B
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4280.1665393877507241423
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=n2dTnJBo;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 4088520EC328; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4088520EC328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393877;
	bh=oXjXyFx2e+xqKXG3PN5KCpq9jLACucnfpDv8WP9boZg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n2dTnJBoPnpb1Owj/vxNS0EYDOJPvzWtvBXMGls2mbgS51gyh5Elyv0ZDYteL8Cg7
	 dDFIphLdzuRfuvpFBDCBWbONTThh3WbOPOnkA4JTlygNmWqQW8DiHa9lJb/Oyplyuc
	 Zr1LAEu5U1aLGHrlNM9tkocsj0k7fYGTh5SybUR0=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 30/34] ref-manual: add WIRELESS_DAEMON
Date: Mon, 10 Oct 2022 02:24:16 -0700
Message-Id: 
 <c52fec57a3e3a65c682019f5eddec491742c9a56.1665392836.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3331

From: Paul Eggleton <paul.eggleton@microsoft.com>

Not new in 4.1, but the syntax and usage in packagegroup-base is.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 503926b..a14288e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9027,6 +9027,11 @@ system and gives an overview of their function and contents.
       Specifies the timeout in seconds used by the ``watchdog`` recipe and
       also by ``systemd`` during reboot. The default is 60 seconds.
 
+   :term:`WIRELESS_DAEMON`
+      For ``connman`` and ``packagegroup-base``, specifies the wireless
+      daemon to use. The default is "wpa-supplicant" (note that the value
+      uses a dash and not an underscore).
+
    :term:`WKS_FILE`
       Specifies the location of the Wic kickstart file that is used by the
       OpenEmbedded build system to create a partitioned image
-- 
1.8.3.1



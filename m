Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C110C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 20:48:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.3766.1678999686909019419
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Mar 2023 13:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kK1eaCuz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4E5EF20002;
	Thu, 16 Mar 2023 20:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678999684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TxsBzTO2p6xQlKMvO4boQ8jXxX3ND8YC5jwnZ0NLtKA=;
	b=kK1eaCuzQukgtRfwU4dZ8oos0628l3CgPVBWTQQb6H7Uz4kKEKoYkpb/+yp2vKqineJuHI
	rzjQOcTEBDZt6gxbgwKVkbLXuTUHNh7/IHoKvtbvwA4jOKyajZcwn8WNG/yEHMyNLNp0Mo
	ma0a0o8Pa4VkFugiak42BzQQssIZ6rXfkk4kFvTMADhSnOlbzy0bwY8vWBTM8CLQI6cD+M
	xYslbMDBXdSvbQzq8NKLxiPOuFIi5zeXs3JckjrVNf/y4luGJhIidbZX7rBan2RRDwxrBL
	h+1DH26kOedlMgPnPW42y0Z89hiZjcZuEaV5Fu66l5R/SnwJXAuHBtql+YIJsA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] poky.yaml.in, dev-manual/disk-space.rst: add rm_work data
Date: Thu, 16 Mar 2023 21:47:50 +0100
Message-Id: <20230316204750.4156695-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316204750.4156695-1-michael.opdenacker@bootlin.com>
References: <20230316204750.4156695-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Mar 2023 20:48:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3802

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/disk-space.rst | 6 ++++++
 documentation/poky.yaml.in              | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
index 3a5d2b7297..c63591cc7a 100644
--- a/documentation/dev-manual/disk-space.rst
+++ b/documentation/dev-manual/disk-space.rst
@@ -17,6 +17,12 @@ building a recipe once the recipe is built. For more information on
 "rm_work", see the :ref:`ref-classes-rm-work` class in the
 Yocto Project Reference Manual.
 
+When you inherit this class and build a ``core-image-sato`` image for a
+``qemux86-64`` machine from an Ubuntu 22.04 x86-64 system, you end up with a
+final disk usage of 22 Gbytes instead of &MIN_DISK_SPACE; Gbytes. However,
+&MIN_DISK_SPACE_RM_WORK; Gbytes of initial free disk space are still needed to
+create temporary files before they can be deleted.
+
 Purging Duplicate Shared State Cache Files
 ==========================================
 
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 7810b8d2a5..eefdd3f30d 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -43,3 +43,5 @@ MIN_GCC_VERSION : "7.5"
 MIN_MAKE_VERSION : "4.0"
 # Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64), rounded up from 87
 MIN_DISK_SPACE : "90"
+# Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) with "rm_work", rounded up from 38
+MIN_DISK_SPACE_RM_WORK : "40"
-- 
2.34.1



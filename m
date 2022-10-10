Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC19C43217
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.4432.1665393877589338435
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=IPPMTze4;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 5977720EC332; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5977720EC332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393877;
	bh=2W/PZEr6KK8HUyLwdTY+EugkdQWmDOlGmVMCZMDx+Ns=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IPPMTze4bminliZC4BthxLOa1G89+/126tzyoS4WauWFJbnaMhuyujmhsGLvbrEw4
	 n8JY3wp4yCeIKe0V2AUVGjHFsPxW+Dn+kxltlbHvAxBQeMKELvtO2OucM5LJOlxRco
	 clz7VapsefYFq4Upp1cB/IjJ2HYx9oNcliQwe/ac=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 32/34] ref-manual: add overlayfs class variables
Date: Mon, 10 Oct 2022 02:24:18 -0700
Message-Id: 
 <d7e466e90de03731bdf603a866b3918f195149d6.1665392836.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3334

From: Paul Eggleton <paul.eggleton@microsoft.com>

The overlayfs class was added in the honister release.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a14288e..00d51e5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5273,6 +5273,30 @@ system and gives an overview of their function and contents.
       information, see the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>`
       class documentation. The default value is "1".
 
+   :term:`OVERLAYFS_MOUNT_POINT`
+      When inheriting the :ref:`overlayfs <ref-classes-overlayfs>` class,
+      specifies mount point(s) to be used. For example::
+
+         OVERLAYFS_MOUNT_POINT[data] = "/data"
+
+      The assumes you have a ``data.mount`` systemd unit defined elsewhere
+      in your BSP (e.g. in ``systemd-machine-units`` recipe) and it is
+      installed into the image. For more information see
+      :ref:`overlayfs <ref-classes-overlayfs>`.
+
+      .. note::
+
+         Although the :ref:`overlayfs <ref-classes-overlayfs>` class is
+         inherited by individual recipes, :term:`OVERLAYFS_MOUNT_POINT`
+         should be set in your machine configuration.
+
+   :term:`OVERLAYFS_WRITABLE_PATHS`
+      When inheriting the :ref:`overlayfs <ref-classes-overlayfs>` class,
+      specifies writable paths used at runtime for the recipe. For
+      example::
+
+         OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
+
    :term:`OVERRIDES`
       A colon-separated list of overrides that currently apply. Overrides
       are a BitBake mechanism that allows variables to be selectively
-- 
1.8.3.1



Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5AFC4321E
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4281.1665393877519065266
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=N1USzG/Y;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 28DE420EC32F; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 28DE420EC32F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393877;
	bh=LY6oIQpM5mrLiykpSx3TN37OFDTowjpzoQA5jA91MxE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=N1USzG/Y6oq7DeKYURQAZfa90Uzme5QW0yHL/m1MRQmKC1O097HcPAcgdR9KP0Q3y
	 nq20bGBsDP0P95+eHWhJtsWCckS7fGtGInvrCjxMdMhhN3mLGS6ML+eR644/J/Rxc4
	 3JDz+KpkNdaVGLivB1NWE5zfoojXvvk/RPrqh1OQ=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 28/34] ref-manual: add previous overlayfs-etc variables
Date: Mon, 10 Oct 2022 02:24:14 -0700
Message-Id: 
 <cd3e33985601f7c8a449b47f4d75f4b568ad6dc5.1665392836.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3333

From: Paul Eggleton <paul.eggleton@microsoft.com>

These were supported in releases prior to 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ade7c03..9c510b8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5229,6 +5229,44 @@ system and gives an overview of their function and contents.
       default by setting the variable in a custom distribution
       configuration file.
 
+   :term:`OVERLAYFS_ETC_DEVICE`
+      When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
+      inherited, specifies the device to be mounted for the read/write
+      layer of ``/etc``. There is no default, so you must set this if you
+      wish to enable :ref:`overlayfs-etc <ref-classes-overlayfs-etc>`, for
+      example, assuming ``/dev/mmcblk0p2`` was the desired device::
+
+         OVERLAYFS_ETC_DEVICE = "/dev/mmcblk0p2"
+
+   :term:`OVERLAYFS_ETC_FSTYPE`
+      When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
+      inherited, specifies the file system type for the read/write
+      layer of ``/etc``. There is no default, so you must set this if you
+      wish to enable :ref:`overlayfs-etc <ref-classes-overlayfs-etc>`,
+      for example, assuming the file system is ext4::
+
+         OVERLAYFS_ETC_FSTYPE = "ext4"
+
+   :term:`OVERLAYFS_ETC_MOUNT_OPTIONS`
+      When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
+      inherited, specifies the mount options for the read-write layer.
+      The default value is "defaults".
+
+   :term:`OVERLAYFS_ETC_MOUNT_POINT`
+      When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
+      inherited, specifies the parent mount path for the filesystem layers.
+      There is no default, so you must set this if you wish to enable
+      :ref:`overlayfs-etc <ref-classes-overlayfs-etc>`, for example if
+      the desired path is "/data"::
+
+         OVERLAYFS_ETC_MOUNT_POINT = "/data"
+
+   :term:`OVERLAYFS_ETC_USE_ORIG_INIT_NAME`
+      When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
+      inherited, controls how the generated init will be named. For more
+      information, see the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>`
+      class documentation. The default value is "1".
+
    :term:`OVERRIDES`
       A colon-separated list of overrides that currently apply. Overrides
       are a BitBake mechanism that allows variables to be selectively
-- 
1.8.3.1



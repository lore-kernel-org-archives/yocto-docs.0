Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0153EC38A2D
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.4253.1665393876872641113
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=c4U/nO10;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 4EEF420EC335; Mon, 10 Oct 2022 02:24:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4EEF420EC335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=RF8O21GooT4Km+jl8G81YhMPiV4rHIKOIGb40Lg3Gds=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c4U/nO105jizh/DRa8B2q8Ycf6IeEa7+GF4IS5Yfx9OJiqXqFanX0fjkW51sTEblC
	 A3v3CVY/GghCgeG7XZ+ZeQmW94vyh1rgkXLZrNH3UgbtlI70K1uxYkgvz0lbdxMaBt
	 QkewEXdOEIi0qlDUOb2MWh5mWbb8L4jzgPGU6haw=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 11/34] ref-manual: add DEV_PKG_DEPENDENCY
Date: Mon, 10 Oct 2022 02:23:57 -0700
Message-Id: 
 <b4ea0706196c9016f4ea88ce9f6364bc5587990e.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3316

From: Paul Eggleton <paul.eggleton@microsoft.com>

New variable in 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 7707f5a..ab39fa8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1812,6 +1812,11 @@ system and gives an overview of their function and contents.
       :term:`DESCRIPTION` takes the value of the :term:`SUMMARY`
       variable.
 
+   :term:`DEV_PKG_DEPENDENCY`
+      Provides an easy way for recipes to disable or adjust the runtime
+      dependency (:term:`RDEPENDS`) of the ``${PN}-dev`` package on the main
+      (``${PN}``) package, particularly where the main package may be empty.
+
    :term:`DISABLE_STATIC`
       Used in order to disable static linking by default (in order to save
       space, since static libraries are often unused in embedded systems.)
-- 
1.8.3.1



Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D175EC38A05
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4276.1665393876831008722
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=oztOI9Yk;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id C795B20ECCAE; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C795B20ECCAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=J88DCS7uYSYhpT84Iqj7U1ikB4Sxkw6S07tGilxCXSw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oztOI9YkU+Xlc9uRNN4B2Sf6eCqfXoWPRsmTl30gsOsLVKrFptQQHyczPyKuL0+F2
	 sjxStSyj3VWgn5hfzSN37wc6/gkcWhplaQcdjlnSE9J7863ToSV2me2c1OnrekNYSg
	 dURMmsEUM8kDfG5ek28pSjqmQREik/+QM75x/xIQ=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 21/34] ref-manual: add MOUNT_BASE variable
Date: Mon, 10 Oct 2022 02:24:07 -0700
Message-Id: 
 <401bdced44432c123a92878ac1171b4325b7dcf1.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3324

From: Paul Eggleton <paul.eggleton@microsoft.com>

New variable for 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d5038e5..7c4a3dc 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5043,6 +5043,11 @@ system and gives an overview of their function and contents.
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
+   :term:`MOUNT_BASE`
+      On non-systemd systems (where ``udev-extraconf`` is being used),
+      specifies the base directory for auto-mounting filesystems. The
+      default value is "/run/media".
+
    :term:`MULTIMACH_TARGET_SYS`
       Uniquely identifies the type of the target system for which packages
       are being built. This variable allows output for different types of
-- 
1.8.3.1



Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE32C47081
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.4268.1665393876874075270
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=SXeOrRYl;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 1CE0C20F0684; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1CE0C20F0684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393877;
	bh=q+1tEHU9jC127wSLZ+gleY/qo61WOrJc86MM52gNbFc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SXeOrRYlCYuqowBP0RdlHEYUF3hqzEab47TFhde0eNorlNIxFmFKn1BIx3VmHLSau
	 9gQwEnWR3cVpNQNjEzzpbam9TDzCN3DvVq9h6S5pZ4mk3iJfMLZs9PwSkKhNLA1k96
	 m8EpY0Fzx0YaT+HW9ReiYca0W2qr/o5FM4hn+CdU=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 27/34] ref-manual: add serial-autologin-root to IMAGE_FEATURES
 documentation
Date: Mon, 10 Oct 2022 02:24:13 -0700
Message-Id: 
 <592be8e71b09c660975f752c8d53949d218e819b.1665392836.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3319

From: Paul Eggleton <paul.eggleton@microsoft.com>

New IMAGE_FEATURES item in 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/features.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index ea4d257..a5b01e8 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -337,6 +337,12 @@ Here are the image features available for all images:
    writeable for the first boot; this feature does not do anything to
    ensure that - it just disables the check for post-install scripts.)
 
+-  *serial-autologin-root:* when specified in conjunction with
+   ``empty-root-password`` will automatically login as root on the
+   serial console. This of course opens up a security hole if the
+   serial console is potentially accessible to an attacker, so use
+   with caution.
+
 -  *splash:* Enables showing a splash screen during boot. By default,
    this screen is provided by ``psplash``, which does allow
    customization. If you prefer to use an alternative splash screen
-- 
1.8.3.1



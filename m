Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BBEC46467
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4278.1665393877256512989
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=mzvKtoE6;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id BBB9A20EC312; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BBB9A20EC312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=8c2CQSAG/Ubal8arPvTlmGgX5SeMTpmpyRdvzVBq9ac=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mzvKtoE630gWz9gFlLrCXtpo4HOySMOxiiWKzgTgwzVMuVRuO/0DoasZkLc6e8hJs
	 01duIn7YtAs4XN5YwKeVt+uFSCkBdh4D6RAWzMKyy2twiYxat+A/hXvYciJy9ebHaO
	 Y03lcwyPf+RgtcuIZOibNn+jF2rlxD9FU6ZAN8yo=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 20/34] ref-manual: add KERNEL_DEPLOY_DEPEND
Date: Mon, 10 Oct 2022 02:24:06 -0700
Message-Id: 
 <5662b291ae8ca38d84af2991d2df5df42c786b9e.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3323

From: Paul Eggleton <paul.eggleton@microsoft.com>

New variable in 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 124eb59..d5038e5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4141,6 +4141,12 @@ system and gives an overview of their function and contents.
       the kernel. The default is "0" to disable this for reproducibility
       reasons.
 
+   :term:`KERNEL_DEPLOY_DEPEND`
+      Provides a means of controlling the dependency of an image recipe
+      on the kernel. The default value is "virtual/kernel:do_deploy",
+      however for a small initramfs image or other images that do not
+      need the kernel, this can be set to "" in the image recipe.
+
    :term:`KERNEL_DEVICETREE`
       Specifies the name of the generated Linux kernel device tree (i.e.
       the ``.dtb``) file.
-- 
1.8.3.1



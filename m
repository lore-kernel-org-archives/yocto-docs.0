Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCABC38A2B
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.4430.1665393877208770183
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=dNkn8uAL;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id A3A9120EC319; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A3A9120EC319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=Z+ruH/+wfHPBY9qMB6Z8ize4/BJ1i8v+YwwTpxyUgrg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dNkn8uALHoGcf66XHQpz8Lu2/3TAtnaoGVmVuLKU31A33VFJjY+k/dOmC1KMBuxDl
	 b8lqgfIRPa1eXQ05Y2rhFcmERSLqE0ybRfWccxs3YWPlQN+ea48uzs1wkST8WMFmuv
	 DJS2iwn6Pt4GhL7ccqG5yi8swtZM2MqCwUlnfmHI=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 18/34] ref-manual: add FIT_PAD_ALG
Date: Mon, 10 Oct 2022 02:24:04 -0700
Message-Id: 
 <6d363e219662599d9e1948dbf5e87122f864d610.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3321

From: Paul Eggleton <paul.eggleton@microsoft.com>

New variable in 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c226b92..3848d86 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2755,6 +2755,10 @@ system and gives an overview of their function and contents.
       Specifies the signature algorithm used in creating the FIT Image.
       For e.g. rsa2048.
 
+   :term:`FIT_PAD_ALG`
+      Specifies the padding algorithm used in creating the FIT Image.
+      The default value is "pkcs-1.5".
+
    :term:`FIT_SIGN_INDIVIDUAL`
       If set to "1", then the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>`
       class will sign the kernel, dtb and ramdisk images individually in addition
-- 
1.8.3.1



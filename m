Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2481C35275
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.3583.1650591648306416636
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=cQjMi2xl;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id BA35320E6577; Thu, 21 Apr 2022 18:40:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BA35320E6577
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1650591647;
	bh=nCouutzQzGW4OMYKQ1KlOaJ34inF9pQFHG2mIMkL/LI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cQjMi2xl3TsQfKaPBFMCUhXYo0QdI+JyA/VFZrGheYkuCZ/Ozki6BxEEsgJ7EP5VZ
	 Px998x+sXPJjH9hk/+wA2V25WukQZdCrSkd2he0OadKrInIqMRefWCcP2PQ8WE4YYJ
	 DPqaSD28MUlv+LQ+5z3UDA9BmWVdFx98eI6OB1Jc=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 4/9] ref-manual: add mention of vendor filtering to
 CVE_PRODUCT
Date: Thu, 21 Apr 2022 18:40:37 -0700
Message-Id: 
 <e13a47686dd04eebf11850f01783e4b8e7d48b23.1650591341.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2821

From: Paul Eggleton <paul.eggleton@microsoft.com>

Mention the vendor filtering functionality - prompted by OE-Core
revision 45d1a0bea0c628f84a00d641a4d323491988106f.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4df8165..0b8c44f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1485,6 +1485,13 @@ system and gives an overview of their function and contents.
 
          CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
 
+      Sometimes the product name is not specific enough, for example
+      "tar" has been matching CVEs for the GNU ``tar`` package and also
+      the ``node-tar`` node.js extension. To avoid this problem, use the
+      vendor name as a prefix. The syntax for this is::
+
+         CVE_PRODUCT = "vendor:package"
+
    :term:`CVSDIR`
       The directory in which files checked out under the CVS system are
       stored.
-- 
1.8.3.1



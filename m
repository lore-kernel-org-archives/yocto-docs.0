Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8D3C46467
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.3584.1650591648343036328
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=mttJHc+6;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id AE78920E6570; Thu, 21 Apr 2022 18:40:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AE78920E6570
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1650591647;
	bh=hRDNIpOlwmViDMG228Dw+VAOb6nrsy4nIIgZfDS5BU4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mttJHc+6HgePF5QoA8S2NPg+ss4xZRLMhDGPHPY0AwxNP0Q02/A6LIz//rw7FvID1
	 hFLzuA3zDIT/AYiMznFiYK8QkCLuKyJltbhX3HPsehrx0wCpZPQIfQvbu2eoHxJwbU
	 87WMpo3ZRqy7mqASYByoEycOyncxerDvy/E4V0Ow=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/9] ref-manual: mention wildcarding support in
 INCOMPATIBLE_LICENSE
Date: Thu, 21 Apr 2022 18:40:36 -0700
Message-Id: 
 <ecd878144f6829455df175d4afb0378d43b971ab.1650591341.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2824

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add this since the INCOMPATIBLE_LICENSE wildcard support has changed in
the 4.0 release.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f9fd551..4df8165 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3485,6 +3485,14 @@ system and gives an overview of their function and contents.
       incompatible licenses are not built. Packages that are individually
       licensed with the specified incompatible licenses will be deleted.
 
+      There is some support for wildcards in this variable's value,
+      however it is restricted to specific licenses. Currently only the
+      these wildcards are allowed and expand as follows:
+
+      - ``AGPL-3.0*"``: ``AGPL-3.0-only``, ``AGPL-3.0-or-later``
+      - ``GPL-3.0*``: ``GPL-3.0-only``, ``GPL-3.0-or-later``
+      - ``LGPL-3.0*``: ``LGPL-3.0-only``, ``LGPL-3.0-or-later``
+
       .. note::
 
          This functionality is only regularly tested using the following
-- 
1.8.3.1



Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272D3C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 17:51:32 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.767.1672941084839608918
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 09:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BPfDnA0j;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E2C4740006;
	Thu,  5 Jan 2023 17:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672941083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEB0qwuhBTr2/R0EsZKnw9G/jWm2IxtEpc8Qw6YF9kQ=;
	b=BPfDnA0jDt3Bvt3IsbVwIS9lXPUEWlLFEJWvOU6mYbOXk78F7NB3QoYj1+Qo16rOEFwkyo
	JnAQDThsC7wZGPlkVs/WE9htjA/HQ/SqmQipyEEN5Qp4NQQznw0BKKam85wp2VA/lFqYZl
	uP/ApNBB6UcffYz2l1WDdeqVg5cU9T/K0WkWkvN161xCepUHchRj0Shy4hi7lUT0u/w02E
	YtDjKgm6zFIP7eZ/R8g51MCGgjmu1j9FNZpJ7iu84Rx2ShWEJRyT8UYWHWG1tIyLhxZZCs
	N+UcxMshmWhrot6VhaqjOvKb8pqsFjomO3NzNKWWk15ylg2YUjACRiEda5D4OA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2] ref-manual/system-requirements.rst: recommend buildtools for not supported distros
Date: Thu,  5 Jan 2023 18:51:20 +0100
Message-Id: <20230105175120.2335959-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <173778D3340DBDFF.2132@lists.yoctoproject.org>
References: <173778D3340DBDFF.2132@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 17:51:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3597

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Also minor correction to supported distribution notes

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>

---

Changes in V2:
- Add reference to the section explaining how to get buildtools
---
 documentation/ref-manual/system-requirements.rst | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 1f9b3b1b58..3cd0894687 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -34,8 +34,7 @@ and conceptual information in the :doc:`/overview-manual/index`.
 Supported Linux Distributions
 =============================
 
-Currently, the Yocto Project is supported on the following
-distributions:
+Currently, the Yocto Project is supported on the following distributions:
 
 -  Ubuntu 18.04 (LTS)
 
@@ -71,7 +70,13 @@ distributions:
       has no plans to support rolling-releases or development
       distributions due to their constantly changing nature. We welcome
       patches and bug reports, but keep in mind that our priority is on
-      the supported platforms listed below.
+      the supported platforms listed above.
+
+   -  If your Linux distribution is not in the above list, we recommend to
+      get the :term:`buildtools` or :term:`buildtools-extended` tarballs
+      containing the host tools required by your Yocto Project release,
+      typically by running ``scripts/install-buildtools`` as explained in
+      the ":ref:`system-requirements-buildtools`" section.
 
    -  You may use Windows Subsystem For Linux v2 to set up a build host
       using Windows 10 or later, or Windows Server 2019 or later, but validation
-- 
2.37.2



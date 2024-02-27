Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7E3C54E58
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.12828.1709042498937472084
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KUNhmVxl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 784151C0014;
	Tue, 27 Feb 2024 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWKZ1exxJjcEr+bSJGbHWiEp3pxCkXHnjkPDysSKj2k=;
	b=KUNhmVxlTz1i/R+wTyZ7KhqrpZJDemCfRr11cJaYn7pazOV6iAsqvHOQn+6eftQZ8m2Blf
	YuShaVcuGv2xRfc8LJk8fu8wMKHuVXcA1MYsI5CoxIh4Q14IOLltbhnxjTjeTUkkvqKBNc
	v2uKHo0rr2o5WcJCJJ/r8/JCquZyzwY1LcDqmUzmF9U/NCHrbBps8UJV/R+Oi1H1zyi2gY
	0cmKFvtGj+qmVKuIEbu9uVDSmLhWa/Gpe+g477ZK3Gd9/4PmPY+xFXGq9YbrcWwCCafrbA
	Z9DbA6Jrz0v5hgacD98zZe7zi784suXhy9wmp8PZ7UItPHWwXYtG9aGZvK4TnA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 04/16] dev-manual: packages: clarify shared PR service constraint
Date: Tue, 27 Feb 2024 15:01:16 +0100
Message-Id: <20240227140128.481522-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4895

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Explicit the problems previous described as "obvious".

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/dev-manual/packages.rst | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 0e991e409a..d90ff7110e 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -205,9 +205,14 @@ history, see the
    The OpenEmbedded build system does not maintain :term:`PR` information as
    part of the shared state (sstate) packages. If you maintain an sstate
    feed, it's expected that either all your building systems that
-   contribute to the sstate feed use a shared PR Service, or you do not
-   run a PR Service on any of your building systems. Having some systems
-   use a PR Service while others do not leads to obvious problems.
+   contribute to the sstate feed use a shared PR service, or you do not
+   run a PR Service on any of your building systems.
+
+   That's because if you had multiple machines sharing a PR service but
+   not their sstate feed, you could end up with "diverging" hashes for
+   the same output artefacts. When presented to the share PR service,
+   each would be considered as new and would increase the revision
+   number, causing many unnecessary package upgrades.
 
    For more information on shared state, see the
    ":ref:`overview-manual/concepts:shared state cache`"
-- 
2.34.1



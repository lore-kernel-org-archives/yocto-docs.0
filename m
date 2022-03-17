Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9ACC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:31:28 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.9160.1647516687094776038
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Mar 2022 04:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZgAB6Kxg;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 50680240002;
	Thu, 17 Mar 2022 11:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647516685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qOmK207GWWQmYmwRPF5cANZSdUJMZfb+OnVv3JhaRfQ=;
	b=ZgAB6KxgKOdvFF/sE+MfbXv506BwSOHnuK5FD6tS68jteVJMUe9jRonHmWJbe/ptr3Uwyk
	6rngBghsL/pgg2qCVL6yO3bbC+jtmI4haKwL6VFqZBMU3K7nXixdh+S3QvywsoVYblReUN
	Qr6UOj9XjtvMy9qzAsJaZyddkswP0GrzByzgaQGAp/DMb6n1aGA1BeT9R8oEAm/cc+FkBG
	MmRIyVFKpXwy4XDkG2nKY1U7UiLStzeEPAgE5n1+v1nmwxjEvRJaxjyw0QMaFRy9N3c3Ln
	W18gESs55pS+6KmmkabKFuoRzE6Y/9pMHcu6T5HDKQCPC6j6XcWZgtx5PsD1mQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 RESEND] doc: migration-3.5: variable changes for inclusive
 language
Date: Thu, 17 Mar 2022 12:30:57 +0100
Message-Id: <20220317113057.230854-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16DD208C03B9D0E4.10472@lists.yoctoproject.org>
References: <16DD208C03B9D0E4.10472@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Mar 2022 11:31:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2618

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-3.5.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
index da09b6f449..6d452a6edf 100644
--- a/documentation/migration-guides/migration-3.5.rst
+++ b/documentation/migration-guides/migration-3.5.rst
@@ -7,6 +7,16 @@ Project 3.5 Release (codename "kirkstone") from the prior release.
 Recipe changes
 --------------
 
+- To use more `inclusive language <https://inclusivenaming.org/>`__
+  in the code and documentation, some variables have been renamed or even
+  deleted. BitBake will stop with an error when renamed or removed variables
+  still exist in your recipes or configuration.
+
+  A :oe_git:`convert-variable-renames.py
+  </openembedded-core/tree/scripts/contrib/convert-variable-renames.py>`
+  script is provided to convert your recipes and configuration,
+  and also warns you about the use of problematic words.
+
 - Because of the uncertainty in future default branch names in git repositories,
   it is now required to add a branch name to all URLs described
   by ``git://`` and ``gitsm://`` :term:`SRC_URI` entries. For example::
-- 
2.25.1



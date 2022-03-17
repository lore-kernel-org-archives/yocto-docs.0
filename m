Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29514C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 09:20:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.8149.1647508823643442296
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Mar 2022 02:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oV2Aen+m;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 480D0E000C;
	Thu, 17 Mar 2022 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647508821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5XTtR8NO57Sp8wt+zmqK39NBUc9XFzlbjLzPXi+2puo=;
	b=oV2Aen+mYu7CoJL3kJa1yFbuj1Avasd3KVxw/OVyMD6/fRZEfZnBNDaM5IVqFmJh5/z4G0
	332BISNxz9e0uWCmTgat6ZC/Pfy/VMI7WNF6xZYG/NemShjHhIr+CmvY5igZ8qPiRkFSVd
	eJAT3k+FpHptYcdrmCIhCsV6e+6qRtakSG0LiQFeBZeAm50NhMV+6drwVUBY57uydGx+o0
	iBnsOYyPbBceYhHaq1lcUgjFDzav+dUSLZvNpCxYaR2UKBHbU8xF8Q7ur2/d9I/kqhXgUL
	Xmmn0d5qQXhF6zL1y8yX5wvRSZ/3IBiqfmBwVUoG97wW2s8UktT2tlr0QlmP+Q==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] doc: migration-3.5: variable changes for inclusive
 language
Date: Thu, 17 Mar 2022 10:20:06 +0100
Message-Id: <20220317092007.223297-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16DCEA2573357EC0.11325@lists.yoctoproject.org>
References: <16DCEA2573357EC0.11325@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Mar 2022 09:20:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2617

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



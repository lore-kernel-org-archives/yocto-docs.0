Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13621E92739
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:03:43 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.25881.1696536212363139729
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aF/AhFsr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E25B40008;
	Thu,  5 Oct 2023 20:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oJqlVD2xctWRWK/WOPTZVNcLW8APwlw2NfNewjNPswU=;
	b=aF/AhFsr28HIpWJpdUMqwvsI13VYNeXVcQ2p6XmURZGiqi1PcAIVfC7A5VWMKb8d/2RxyX
	QTAbSUqHi7IdSqt7C0+AnN1obDWszdKkZ9APIAJzZvepW9f7Cb9gTQsMXJsh17A1cUcwao
	LlrIR4xlnWsq7ydrmkqS8i+lLUHcHg9cDhA5K4QdudjFHSHWfUD8CZrPgoGa/V5j8/MeKQ
	HA3qJQ5yRqvQTT2P/np9TkCPsuS4P51f2Aa/qdgJ8eZyu+NlwhEi/2pUjsXLEjfMwAJr5W
	cA18oUpP1ianJd7wOH6gcX8UOdSpgU++2ikC09UrBqb6JhqBjJX4+pFgr7EANg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirstone][PATCH 1/9] contributor-guide/style-guide: Refer to recipes, not packages
Date: Thu,  5 Oct 2023 22:03:10 +0200
Message-Id: <20231005200318.2873125-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Oct 2023 20:03:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4310

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Whilst often referred to as packages by people we should use the more
accurate term in documentation, 'recipe' instead of 'packages'.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/recipe-style-guide.rst      | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 99105179a6..1a1c1c6ee2 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -7,17 +7,18 @@ Recipe Naming Conventions
 =========================
 
 In general, most recipes should follow the naming convention
-``recipes-category/package/packagename_version.bb``. Recipes for related
-projects may share the same package directory. ``packagename``, ``category``,
-and ``package`` may contain hyphens, but hyphens are not allowed in ``version``.
+``recipes-category/recipename/recipename_version.bb``. Recipes for related
+projects may share the same recipe directory. ``recipename`` and ``category``
+may contain hyphens, but hyphens are not allowed in ``version``.
 
 If the recipe is tracking a Git revision that does not correspond to a released
-version of the software, ``version`` may be ``git`` (e.g. ``packagename_git.bb``)
+version of the software, ``version`` may be ``git`` (e.g. ``recipename_git.bb``)
+and the recipe would set :term:`PV`.
 
 Version Policy
 ==============
 
-Our versions follow the form ``<package epoch>:<package version>-<package revision>``
+Our versions follow the form ``<epoch>:<version>-<revision>``
 or in BitBake variable terms ${:term:`PE`}:${:term:`PV`}-${:term:`PR`}. We
 generally follow the `Debian <https://www.debian.org/doc/debian-policy/ch-controlfields.html#version>`__
 version policy which defines these terms.
@@ -26,7 +27,7 @@ In most cases the version :term:`PV` will be set automatically from the recipe
 file name. It is recommended to use released versions of software as these are
 revisions that upstream are expecting people to use.
 
-Package versions should always compare and sort correctly so that upgrades work
+Recipe versions should always compare and sort correctly so that upgrades work
 as expected. With conventional versions such as ``1.4`` upgrading ``to 1.5``
 this happens naturally, but some versions don't sort. For example,
 ``1.5 Release Candidate 2`` could be written as ``1.5rc2`` but this sorts after
@@ -62,7 +63,7 @@ Version Number Changes
 
 The :term:`PR` variable is used to indicate different revisions of a recipe
 that reference the same upstream source version. It can be used to force a
-new version of a package to be installed onto a device from a package feed.
+new version of a recipe to be installed onto a device from a package feed.
 These once had to be set manually but in most cases these can now be set and
 incremented automatically by a PR Server connected with a package feed.
 
-- 
2.34.1



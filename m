Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D254DCA0ECE
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 08:36:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.20621.1694507807498892808
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 01:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dFkNZtFU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42E5CE002B;
	Tue, 12 Sep 2023 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694507805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=luN/rkZ2wP+3gOLjoCHL5+mApKii2VN8EWqIWP5N3Ic=;
	b=dFkNZtFUQXiPe6ZHVlrrl3DjUsv4qcCQ5Au5xnOjLaYWX3fM8nE2QHyR5v1j/JUA7A6G98
	U3MgF3CCXIROu6UEpIshUkZ+OZLi6pl7O/GjR+HRDrr2348RZksE0LgxAiakDeFKPWj24v
	psLWv94FQkmBZGPakWiVTEYSjXDgpmqO/2BTtqZZL65q14GDeRaqY5Fp016rGDOtJcWKDu
	xmpA/WIDZtHUMvqmIKegJB9Ip5A+bsoG0dYK1RThu5OLO+FeBKIHcSC4QLvugFXUmwefED
	gjSTSyIk37uYxvnXEoYXJksZS4QsTFjoaVqWVhjbK9codLNvoqFu+jbrSGHEiQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: new-recipe.rst fix inconsistency with contributor guide
Date: Tue, 12 Sep 2023 10:35:36 +0200
Message-Id: <20230912083536.414237-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Sep 2023 08:36:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4210

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This document was suggesting a way to version pre-releases
which doesn't match the latest recommendations from the
contributor guide.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index cb9533ff5d..457f9632ce 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1036,13 +1036,14 @@ build system and package managers, so the resulting packages will not
 correctly trigger an upgrade.
 
 In order to ensure the versions compare properly, the recommended
-convention is to set :term:`PV` within the
-recipe to "previous_version+current_version". You can use an additional
-variable so that you can use the current version elsewhere. Here is an
-example::
+convention is to use a tilde (``~``) character as follows::
 
-   REALPV = "0.8.16-rc1"
-   PV = "0.8.15+${REALPV}"
+  PV = 0.8.16~rc1
+
+This way ``0.8.16~rc1`` sorts before ``0.8.16``. See the
+":ref:`contributor-guide/recipe-style-guide:version policy`" section in the
+Yocto Project and OpenEmbedded Contributor Guide for more details about
+versioning code corresponding to a pre-release or to a specific Git commit.
 
 Post-Installation Scripts
 =========================
-- 
2.34.1



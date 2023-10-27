Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC70C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 14:43:17 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.8641.1698417790142460081
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 07:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IceRNPNQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2885C240010;
	Fri, 27 Oct 2023 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698417788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RgTL+uF/sqVYbgUbg5nNOEPb+EcR5ofloHaqlmgC9G0=;
	b=IceRNPNQa74mhuCVZAJkpsOCv1yENzdJr+Ls+U8QnYPRF2TK1CcKo7czujDZaABvnYXStV
	F/0nJ6XgEQyR1r2kdmlPn2jmb3RIZPJfa0nl2qOL5JrheVDoAKGYmEgiIdJUn5O1g+iKuc
	ebIkVShiA4RTfic0cVy2ZvL2nY4jg82c4znJD4psmnGX5d1gNvh/nCgsWgE9UTbx66Bkp0
	glWD/9mZy0KiZFwfCbGf6qmRUEtP9dzeCugcShh4s7HlT1zmeUO+gNNFLdRx3Uvi/T5/o7
	Tgq9mCroLhPezhcdxX7WRrkTMoIDFsuCRnNqgHnoGd722qqrZNis9klXxKj5EA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: variables: document OEQA_REPRODUCIBLE_TEST_PACKAGE
Date: Fri, 27 Oct 2023 16:43:05 +0200
Message-Id: <20231027144305.1625112-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 14:43:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4513

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Introduced by
https://git.yoctoproject.org/poky/commit/?id=88abdec715ed0c1f613c9b5132cd45db741d5c65

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 771eb91af6..7f76c3045f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5625,6 +5625,11 @@ system and gives an overview of their function and contents.
       For additional information on how this variable is used, see the
       initialization script.
 
+   :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
+      Set the package manager(s) for build reproducibility testing.
+      See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`
+      and :doc:`/test-manual/reproducible-builds`.
+
    :term:`OEQA_REPRODUCIBLE_TEST_TARGET`
       Set build target for build reproducibility testing. By default
       all available recipes are compiled with "bitbake world", see also :term:`EXCLUDE_FROM_WORLD`
-- 
2.34.1



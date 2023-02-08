Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180A3C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 20:36:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10061.1675888565631882072
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 12:36:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S7uTD4ye;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C55E640005;
	Wed,  8 Feb 2023 20:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675888564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=plyUC1mkoF1GVQoxELABkp8yH0oJPdY0OB/jp4GxeJk=;
	b=S7uTD4yemAEXoapzV1M39enX9uw9xXTZLdeKId9hORYjZP4tZ8JFpdo7C1cywWMsTkA8H9
	HDE3jI7w+ReB4ntwcd9ZRakr9rHJYSFhnxXHGcZxYP+sgQs/zWeADqr2k2+bGB094B+FnJ
	gXZKFBJ7CKxliPZGedxNg+vJK1Af6GEyHmZXj02KihMwBUDBNWhUrYQzTpTUCOFKELY3jP
	cZ86z6bU9VYjhF7E4jbZGj22B09bZsy2xwphAlSQ1X4+kvy550a+x3c//7I+88lc7potF7
	QGvvv+2MatBDio0Ofx9IsO6S/XrTWirt8FGPTGvyd0UbnZkv176wU3tBnFSTqg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: replace unnecessary uses of 'yocto_docs' by internal references
Date: Wed,  8 Feb 2023 21:36:01 +0100
Message-Id: <20230208203601.109671-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Feb 2023 20:36:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3653

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

These :yocto_docs: references were making external references
to another section of the manual, using the https://docs.yoctoproject.org
website. It's actually better to use internal references (:doc: for an
entire document, and :ref: for a specific section, as they will cause
an error in Sphinx if one day they are no longer valid.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/resources.rst            | 2 +-
 documentation/ref-manual/variables.rst            | 2 +-
 documentation/test-manual/reproducible-builds.rst | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 5a09909c70..d2344e39a0 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -173,7 +173,7 @@ Here is a list of resources you might find helpful:
 -  :yocto_wiki:`FAQ </FAQ>`: A list of commonly asked
    questions and their answers.
 
--  :yocto_docs:`Release Information </migration-guides/>`:
+-  :doc:`Release Information </migration-guides/index>`:
    Migration guides, release notes, new features, updates and known issues
    for the current and past releases of the Yocto Project.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index edc3aa6523..73a9975905 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8481,7 +8481,7 @@ system and gives an overview of their function and contents.
          responsibility to ensure that the toolchain is compatible with the
          default toolchain. Using older or newer versions of these
          components might cause build problems. See
-         :yocto_docs:`Release Information </migration-guides/>` for your
+         :doc:`Release Information </migration-guides/index>` for your
          version of the Yocto Project, to find the specific components with
          which the toolchain must be compatible.
 
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 2a2f7790d2..50256fb197 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -24,8 +24,8 @@ reproducibility matters. The primary focus of the project is the ability to
 detect security issues being introduced. However, from a Yocto Project
 perspective, it is also hugely important that our builds are deterministic. When
 you build a given input set of metadata, we expect you to get consistent output.
-This has always been a key focus but, :yocto_docs:`since release 3.1 ("dunfell")
-</ref-manual/migration-3.1.html#reproducible-builds-now-enabled-by-default>`,
+This has always been a key focus but, :ref:`since release 3.1 ("dunfell")
+<migration-guides/migration-3.1:reproducible builds now enabled by default>`,
 it is now true down to the binary level including timestamps.
 
 For example, at some point in the future life of a product, you find that you
-- 
2.37.2



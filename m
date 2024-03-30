Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F0DCD1288
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 18:08:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.2695.1711822119436245932
 for <docs@lists.yoctoproject.org>;
 Sat, 30 Mar 2024 11:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YZpfpCsg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 198FF40003;
	Sat, 30 Mar 2024 18:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711822118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7RqGRYPs6soVNCamIVt7M94PhoVVchFlOQ1Sdf4BXso=;
	b=YZpfpCsgRsHSXqhPodXmvGo2LjrYzwhv81xE0s+EIbjVoM6UPNTOzFbJNaP/C8So7sRMXt
	JNEQlYnrc9sKssKzHoznP5H6MttKDD/e1kiz0OeKiKPGfvk/gntyacIh914/wgZmkJcmms
	h/jxEnu3uVQ1uFKIW9uSAtc0Ex46G2BQdronq1d2aQnClyRqDjQHxoMfYE9DgZ4I6h964b
	66jzUqf4euKGNqqmIHSfr+EclNRaRHsN5UFSx9yHKEgcYhbcVvR9auK1UsaMIKkVD03nM9
	7A9GDZhpjRlzoDbdR1INU9nns1CpNxFWiVBh4eMw3hPlEDwS9XWRNMN+Wepiog==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 4/4] migration-guides: add missing opening tag colon
Date: Sat, 30 Mar 2024 19:08:29 +0100
Message-Id: <20240330180829.1749526-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330180829.1749526-1-michael.opdenacker@bootlin.com>
References: <20240330180829.1749526-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 30 Mar 2024 18:08:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5036

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

As reported by "make sphinx-lint"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-4.2.rst       | 2 +-
 documentation/migration-guides/release-notes-4.0.4.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-4.2.rst b/documentation/migration-guides/migration-4.2.rst
index 1db6fbca42..f5f12c8871 100644
--- a/documentation/migration-guides/migration-4.2.rst
+++ b/documentation/migration-guides/migration-4.2.rst
@@ -121,7 +121,7 @@ Removed variables
 The following variables have been removed:
 
 -  ``SERIAL_CONSOLE``, deprecated since version 2.6, replaced by :term:`SERIAL_CONSOLES`.
--  ``PACKAGEBUILDPKGD``, a mostly internal variable in the ref:`ref-classes-package`
+-  ``PACKAGEBUILDPKGD``, a mostly internal variable in the :ref:`ref-classes-package`
    class was rarely used to customise packaging. If you were using this in your custom
    recipes or bbappends, you will need to switch to using :term:`PACKAGE_PREPROCESS_FUNCS`
    or :term:`PACKAGESPLITFUNCS` instead.
diff --git a/documentation/migration-guides/release-notes-4.0.4.rst b/documentation/migration-guides/release-notes-4.0.4.rst
index 611109a77e..1d6e525bbc 100644
--- a/documentation/migration-guides/release-notes-4.0.4.rst
+++ b/documentation/migration-guides/release-notes-4.0.4.rst
@@ -247,7 +247,7 @@ poky
 
 openembedded-core
 
--  Repository Location: oe_git:`/openembedded-core`
+-  Repository Location: :oe_git:`/openembedded-core`
 -  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
 -  Tag:  :oe_git:`yocto-4.0.4 </openembedded-core/log/?h=yocto-4.0.4>`
 -  Git Revision: :oe_git:`f7766da462905ec67bf549d46b8017be36cd5b2a </openembedded-core/commit/?id=f7766da462905ec67bf549d46b8017be36cd5b2a>`
-- 
2.34.1



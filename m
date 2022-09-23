Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627A6C07E9D
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:29 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.534.1663955601200039427
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cYIsyqJp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7DE8EFF803;
	Fri, 23 Sep 2022 17:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WGnMCrfzyXsQ9Wbq0kOpHVb46fDTcM+hyhhlfmb47IA=;
	b=cYIsyqJp1OWf3GMhrvYEYDs4GAd1Ofh8m3GvfzXevE4wYXG0A335cPoavzFJeb14jm6Hss
	VBGScJXarelq/WmJsNNe2p/EBCB/QMfTlPg7vF18VACe0BG3utTKj2tr9ZbY4U9xcK5YRF
	je0EMb2Y2ayA20j//3mmDGxpTjZvFe4TwwjGhjJYJ6BWFJzMbQ50eh+IV1RBIDQ/np3JO4
	EtF35ukta6sZQXHZrq/ZmlkYFXST+lY0pY8y9OMtXPxJ28foiA9KeutXzuocIzlWKafo2a
	SiBs58+s4Rnw8k7h9TOW8iuVnEt7BLQCi4ea+sA3LmJT9vMfLe4Acenfwzp/rw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 09/30] manuals: add references to the "do_package_qa" task
Date: Fri, 23 Sep 2022 19:51:58 +0200
Message-Id: <20220923175219.6652-10-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3224

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-1.7.rst | 2 +-
 documentation/migration-guides/migration-3.1.rst | 2 +-
 documentation/ref-manual/variables.rst           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-1.7.rst b/documentation/migration-guides/migration-1.7.rst
index 8213ab58d9..7b179f2aa1 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -165,7 +165,7 @@ The following changes have occurred to the QA check process:
    more parallel execution. This change is unlikely to be an issue
    except for highly customized recipes that disable packaging tasks
    themselves by marking them as ``noexec``. For those packages, you
-   will need to disable the ``do_package_qa`` task as well.
+   will need to disable the :ref:`ref-tasks-package_qa` task as well.
 
 -  Files being overwritten during the
    :ref:`ref-tasks-populate_sysroot` task now
diff --git a/documentation/migration-guides/migration-3.1.rst b/documentation/migration-guides/migration-3.1.rst
index cc788efeba..a6106eefae 100644
--- a/documentation/migration-guides/migration-3.1.rst
+++ b/documentation/migration-guides/migration-3.1.rst
@@ -234,7 +234,7 @@ Packaging changes
 Additional warnings
 -------------------
 
-Warnings will now be shown at ``do_package_qa`` time in the following
+Warnings will now be shown at :ref:`ref-tasks-package_qa` time in the following
 circumstances:
 
 -  A recipe installs ``.desktop`` files containing ``MimeType`` keys but
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8fac7f77ad..45d058a281 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6710,7 +6710,7 @@ system and gives an overview of their function and contents.
       the following tasks are added:
 
       - do_populate_lic
-      - do_package_qa
+      - :ref:`ref-tasks-package_qa`
       - do_populate_sysroot
       - :ref:`ref-tasks-deploy`
 
-- 
2.34.1



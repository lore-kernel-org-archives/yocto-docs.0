Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F780C636D3
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 20:01:34 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.914.1675972887284450994
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 12:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=D0W2vbEf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 06379E0009;
	Thu,  9 Feb 2023 20:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675972885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M16lBTWC89SmJMDs18rqSqUJOoznH3pWjws32hEvLEE=;
	b=D0W2vbEfbHclhmaMayMeLXcFq0RspD9QFDxkCtQBHHvQhiyJsJmL5PNd/YLxXocwTmf94C
	bdCRzfaMuU/YSIvTFMYCUqY+xzv/Qg3hDGMEss7IRBgpY1eosPw9m4BsAP0qINh6Riv658
	TH0GA8P3/XHcZ2DvnhzaMpqR6bVEvzLe5VEnuerCkHRME2LrYp8ecApMANntxLT4qQ5vSW
	JQJ8fa33mCD/ll+XfhemOuEEkCtQi+noy0sXf2I9wuNCSIjq+8e1jsBx4l9urCmnlGalra
	ni61g6XiDJzVMg+GrVDxLtSRLVFVbqjFyMLmYlesDs28Bs/lRqRB2nFUTnIq/A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [kirkstone] ref-manual: document SSTATE_EXCLUDEDEPS_SYSROOT
Date: Thu,  9 Feb 2023 21:01:23 +0100
Message-Id: <20230209200123.178966-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Feb 2023 20:01:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3657

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Backport from master:
https://git.yoctoproject.org/yocto-docs/commit/?id=b6690011c14ce4bf30571f045152a9d324ad5039

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 061b1c28d8..968e8d6e05 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7335,6 +7335,32 @@ system and gives an overview of their function and contents.
    :term:`SSTATE_DIR`
       The directory for the shared state cache.
 
+   :term:`SSTATE_EXCLUDEDEPS_SYSROOT`
+      This variable allows to specify indirect dependencies to exclude
+      from sysroots, for example to avoid the situations when a dependency on
+      any ``-native`` recipe will pull in all dependencies of that recipe
+      in the recipe sysroot. This behaviour might not always be wanted,
+      for example when that ``-native`` recipe depends on build tools
+      that are not relevant for the current recipe.
+
+      This way, irrelevant dependencies are ignored, which could have
+      prevented the reuse of prebuilt artifacts stored in the Shared
+      State Cache.
+
+      :term:`SSTATE_EXCLUDEDEPS_SYSROOT` is evaluated as two regular
+      expressions of recipe and dependency to ignore. An example
+      is the rule in :oe_git:`meta/conf/layer.conf </openembedded-core/tree/meta/conf/layer.conf>`::
+
+         # Nothing needs to depend on libc-initial
+         # base-passwd/shadow-sysroot don't need their dependencies
+         SSTATE_EXCLUDEDEPS_SYSROOT += "\
+             .*->.*-initial.* \
+             .*(base-passwd|shadow-sysroot)->.* \
+         "
+
+      The ``->`` substring represents the dependency between
+      the two regular expressions.
+
    :term:`SSTATE_MIRROR_ALLOW_NETWORK`
       If set to "1", allows fetches from mirrors that are specified in
       :term:`SSTATE_MIRRORS` to work even when
-- 
2.37.2



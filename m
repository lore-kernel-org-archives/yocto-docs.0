Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214ADC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 17:02:28 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.8455.1655139738714247470
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 10:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F6QoOmdl;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E2B49240005;
	Mon, 13 Jun 2022 17:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655139737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R1NvwTIN8t8Ci++u9jyMjk6XPDjfMTUcD9mosh3e5m8=;
	b=F6QoOmdlBmuxVulj42TL8NU5PNITw8ARjHRe0cLK7X7u9pRYo7XeS2TNumCVtDKnIVn4Xr
	LLqne0O0M/MyDlMpbisQXr+GWlUF6l6/ULVZelwgshLHafd/qeDhf6nDyK9kQbP3zftT4a
	J7IpKd2Aj2CNSEjZboIT1SFl8lfBt+7La0bPJ4xgIa4IoeerQj9Br4yXhUc9AbCIPV7FbU
	ZBIqUCjNo1GytjW+7PnMEwNnVm+FioQEMC8L4SDkiKvXwDOT5Elk4LYFGlhLNsKrDqRClh
	VHAewgE8SeKRbs093ILd3Lo6QvPk9WgFeijK9KD0qQvFsNaQiejIxgu4L/KQ/g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: document SSTATE_EXCLUDEDEPS_SYSROOT
Date: Mon, 13 Jun 2022 19:02:10 +0200
Message-Id: <20220613170210.100270-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jun 2022 17:02:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2994

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 375333e7f0..3a334f4282 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7218,6 +7218,32 @@ system and gives an overview of their function and contents.
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
+      ``SSTATE_EXCLUDEDEPS_SYSROOT`` is evaluated as two regular
+      expressions of recipe and dependency to ignore. An example
+      is the rule in :oe_git:`meta/conf/layer.conf </meta/conf/layer.conf>`::
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
2.34.1



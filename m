Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55098C636D3
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 20:12:14 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.1208.1675973528249130989
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 12:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i/iB09i2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 67BBE60004;
	Thu,  9 Feb 2023 20:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675973526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=01Hrrfc4aeUPi7d6rmY3XKz8mDsXejYHlHjfQkr65dI=;
	b=i/iB09i2pnZMWTT75QKBUVnNE6SKj/b7K74G+UOtbmfOleCObhqyoEPRU+jY1gY2ZWIOUH
	T7o25Vav/9ENbgktCIK2WxV5QLJIJKYlR3K9HEPnzErO0dAWHxZife5iLTQ1LVpkeaVflU
	WpmtGgxFNxVuO1DjSPSQg0+W7wUGu2jyo6YNFLeUd17r3zkKo8Pg0HSA28IEPVKTdFZx8r
	Qjg+2MIzN/7Im3awhoA7nH5xkTLKbzXAwEFPI42JJDRCyA//P8zQRsinyU+6Sz4kcwGx8B
	ecZjqAvuHXd+2U6uMnO9YrCb5FRm+wjpiZxUNqjZhU34TIxxha41+aFYoHA1rg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [dunfell] ref-manual: document SSTATE_EXCLUDEDEPS_SYSROOT
Date: Thu,  9 Feb 2023 21:12:04 +0100
Message-Id: <20230209201204.180274-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Feb 2023 20:12:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3658

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Backport from master:
https://git.yoctoproject.org/yocto-docs/commit/?id=b6690011c14ce4bf30571f045152a9d324ad5039

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/conf.py                      |  1 +
 documentation/ref-manual/ref-variables.rst | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index df67a5cdf2..e9078e054e 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -97,6 +97,7 @@ extlinks = {
     'yocto_git': ('https://git.yoctoproject.org%s', None),
     'oe_home': ('https://www.openembedded.org%s', None),
     'oe_lists': ('https://lists.openembedded.org%s', None),
+    'oe_git': ('https://git.openembedded.org%s', None),
 }
 
 # Intersphinx config to use cross reference with Bitbake user manual
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index b8d56a082b..f582bc72ea 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -7147,6 +7147,32 @@ system and gives an overview of their function and contents.
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



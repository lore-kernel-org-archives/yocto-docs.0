Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E41C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 10:13:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.126266.1680689582635273881
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 03:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RDWvGz43;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6390BFF80B;
	Wed,  5 Apr 2023 10:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680689580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wM4510wnuaTVIvx5RBreOepkK8Db9qNFAF6OHcOlpFA=;
	b=RDWvGz43TErlClDq+4L6jT0EMhIjeyHjruzXZeLIeE87tUQartf/lNXB4/ZtqRfG4lS7VD
	XzXIUu/NvTUyLqBmadr2/KAup4rNAlqtrW8mXywDacRy4x0IynEtMIzcRxy/9kbbxmJaqp
	4uhmWQ23SR+1m9ytwLNuQybN9u9WTBxdVeDC63sZpvUhkoJEkbBMv0/FQmWa6xlDlb1d2f
	oANA2p9K8GiAOnU71q7NeQ83eGRUrZgQzF1g+3XHqzNtIoLgtgDt3CtM+5E1Cf0jkpY6FD
	fTjqnIMsGSSkpvI/Cf0t4kMjCU4TyibR+8shlRtek2Q2i3I2qR7KDrGWqOPUJQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Trevor Woerner <twoerner@gmail.com>
Subject: [PATCH] ref-manual: variables: document VOLATILE_TMP_DIR
Date: Wed,  5 Apr 2023 12:12:48 +0200
Message-Id: <20230405101248.203432-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Apr 2023 10:13:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3824

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Trevor Woerner <twoerner@gmail.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c787a17937..62f28bd278 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9387,6 +9387,18 @@ system and gives an overview of their function and contents.
       file is not persistent. You can override this setting by setting the
       variable to "no" to make the log directory persistent.
 
+   :term:`VOLATILE_TMP_DIR`
+      Specifies the persistence of the target's ``/tmp`` directory.
+
+      By default, :term:`VOLATILE_TMP_DIR` is set to "yes", in which case
+      ``/tmp`` links to a directory which resides in RAM in a ``tmpfs``
+      filesystem.
+
+      If instead, you want the ``/tmp`` directory to be persistent, set the
+      variable to "no" to make it a regular directory in the root filesystem.
+
+      This supports both sysvinit and systemd based systems.
+
    :term:`WARN_QA`
       Specifies the quality assurance checks whose failures are reported as
       warnings by the OpenEmbedded build system. You set this variable in
-- 
2.34.1



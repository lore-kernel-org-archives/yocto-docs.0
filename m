Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09645CD1284
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 15:22:28 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.15245.1712330538613735637
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 08:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AkKgKj7w;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B39AE0004;
	Fri,  5 Apr 2024 15:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712330537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08b00KQa6xvUWjmoHE3pRiWkIDTI7T5Bd+3rhtSEGwY=;
	b=AkKgKj7wQ9IVgytqK01RBpIGYR71s2Rdt5uhmtUE2eN4q4Nu6DB1t83VNkQifqxue7R3tm
	ddpMaQVvdstl/ojLUFWZfQS93PUF3vas+D1J7Wbbf9KcQe5+g4gwdLa63axIhw9FcpUw0v
	vLVNGsrz/KuZ442uQ3KzGJ9Gpmns71TvujkXHgNOkYeJsppFRhomE+E2ISx9Y4XuLIjP9O
	7ylDzlhSHZ4Acr/b5C+Fly20314LLJ76+XK+IWl8fzxItpd7eYiHEGQZbvkRf4zO+W7Cn4
	5LEwIW+mvGQf9jcVJDj/xgE+9YWWEPIRcRHaH/sUbSSZ20AJPi+tF0haWei5RQ==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 1/4] migration-guides: list removed variables
Date: Fri,  5 Apr 2024 17:22:09 +0200
Message-ID: <20240405152211.2285650-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405152211.2285650-1-joaomarcos.costa@bootlin.com>
References: <20240405152211.2285650-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 15:22:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5084

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Fill the 'Removed variables' section for the upcoming release 5.0

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index 902cc11bf..10c5c16ed 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -89,6 +89,14 @@ Removed variables
 
 The following variables have been removed:
 
+-  ``DEPLOY_DIR_TAR``.
+-  ``PYTHON_PN``: Python 2 has been removed, leaving Python 3 as the sole
+   major version. Therefore, an abstraction to differentiate both versions is
+   no longer needed.
+-  ``oldincludedir``.
+-  ``USE_L10N``: previously deprecated, and now removed.
+-  ``CVE_SOCKET_TIMEOUT``.
+
 .. _migration-5.0-removed-recipes:
 
 Removed recipes
@@ -98,7 +106,7 @@ The following recipes have been removed in this release:
 
 - ``libcroco``: deprecated and archived by the Gnome Project.
 - ``linux-yocto``: version 6.1 (version 6.6 provided instead).
-- ``zvariant``: fails to build with newer Rust
+- ``zvariant``: fails to build with newer Rust.
 - ``systemtap-uprobes``: obsolete.
 
 .. _migration-5.0-removed-classes:
-- 
2.43.0



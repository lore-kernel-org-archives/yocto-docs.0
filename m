Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A31CD1299
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 14:35:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.13742.1712327706598333967
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 07:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ml8KctUK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05447C0004;
	Fri,  5 Apr 2024 14:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712327705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eXxPW99/FlFxrWZdyxlSGCEgHu7XQJdVSoNOEub33ZQ=;
	b=Ml8KctUKK+a0hXH4haroTFXwgZkNkymgMcFeNp6R2VrRZrbgUkHdXEhWlQCKNVCVSz2+eB
	anbXoxiSjuIfYlkQlGVY2O6x4xRqqlJjuwRP24UW5wgpoSPzulq9oVcCTHZ6P/CZ9qdJ+u
	P/fEYGrV5Vhvpt9zsNMew2Y/gdYVutQbI3gEqmI/hAZyDL7DpvjwaghxjIZnxsSnzyI3fD
	aL6PxfOONr16FfUVipk7c693c6itCltFXsUnPMDyOgVQjo5a1pm1KriNIn3kubOPtY57kn
	dtuxEiUp14AyzCVAOB8TgklCuyM4RdwPMAhkX8AAHH6FnvcvsVzg0JlwnvNhRg==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 1/6] migration-guides: list removed variables
Date: Fri,  5 Apr 2024 16:34:48 +0200
Message-ID: <20240405143453.2281900-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
References: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 14:35:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5076

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Fill the 'Removed variables' section for the upcoming release 5.0

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index 902cc11bf..ab6b191cf 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -89,6 +89,14 @@ Removed variables
 
 The following variables have been removed:
 
+-  ``DEPLOY_DIR_TAR``
+-  ``PYTHON_PN`` - Python 2 has been removed, leaving Python 3 as the sole
+   major version. Therefore, an abstraction to differentiate both versions is
+   no longer needed.
+-  ``oldincludedir``
+-  ``USE_L10N`` - previously deprecated, and now removed
+-  ``CVE_SOCKET_TIMEOUT``
+
 .. _migration-5.0-removed-recipes:
 
 Removed recipes
-- 
2.43.0



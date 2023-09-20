Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB53CE79B3
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:16:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.32326.1695197766849834094
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=N9JOLvBW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6194CC000D;
	Wed, 20 Sep 2023 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ijEGndecr/WjTQJTnZweIU1EP/VfYAKJFfVvLEs/QKE=;
	b=N9JOLvBWGf1tCW4DA2A5Ryi+GPZHatg+kvTZ+FyrlSxIOLXT6p3PGorZBW8M+YhrNVllHx
	Xs1eVfHZklkGcF9rDjn7NpXfSmIfQJFmR7YNRN4SYojqTXGVD7sJiLwMtj4glXA6qKk8xx
	5ylXs+2OcU53wodGJlwSS2QY+d7c+DuP+CtxmqSTHbSUjAAKhcAj0Z4DSD2g8/rHCz9/uF
	JJr0EhkS3PhrezcgQyqvJ9FcugwsyRnLqN6DaY/yPJ3suck/5subwV0cFfOfSdn6oVpA7p
	F/D8CpQAwMekSTRYysPESSK8Sfo0WkjS9/vA4opCXG4j6SlEqn4a3T/VdLrcHQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [kirkstone][PATCH 06/10] dev-manual: licenses: mention SPDX for license compliance
Date: Wed, 20 Sep 2023 10:15:40 +0200
Message-Id: <20230920081544.1226760-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
References: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:16:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4253

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/dev-manual/licenses.rst | 30 ++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index b485f77708..15e5c7396a 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -300,14 +300,28 @@ There are other requirements beyond the scope of these three and the
 methods described in this section (e.g. the mechanism through which
 source code is distributed).
 
-As different organizations have different methods of complying with open
-source licensing, this section is not meant to imply that there is only
-one single way to meet your compliance obligations, but rather to
-describe one method of achieving compliance. The remainder of this
-section describes methods supported to meet the previously mentioned
-three requirements. Once you take steps to meet these requirements, and
-prior to releasing images, sources, and the build system, you should
-audit all artifacts to ensure completeness.
+As different organizations have different ways of releasing software,
+there can be multiple ways of meeting license obligations. At
+least, we describe here two methods for achieving compliance:
+
+-  The first method is to use OpenEmbedded's ability to provide
+   the source code, provide a list of licenses, as well as
+   compilation scripts and source code modifications.
+
+   The remainder of this section describes supported methods to meet
+   the previously mentioned three requirements.
+
+-  The second method is to generate a *Software Bill of Materials*
+   (:term:`SBoM`), as described in the ":doc:`/dev-manual/sbom`" section.
+   Not only do you generate :term:`SPDX` output which can be used meet
+   license compliance requirements (except for sharing the build system
+   and layers sources for the time being), but this output also includes
+   component version and patch information which can be used
+   for vulnerability assessment.
+
+Whatever method you choose, prior to releasing images, sources,
+and the build system, you should audit all artifacts to ensure
+completeness.
 
 .. note::
 
-- 
2.34.1



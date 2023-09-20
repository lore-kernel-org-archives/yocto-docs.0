Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7553DCE79B6
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:16:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.32195.1695197768882771850
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VDHKfy5r;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71D4424000A;
	Wed, 20 Sep 2023 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnB0saRDlfFvl8xJ2t/3SKHBvlGOigfF1UUsNQYKBao=;
	b=VDHKfy5rXjUPBQDmvvs+CmPZA9ghhGba18gkCtf6S15mSG38tOyDCFFYoDlnXVvsajKuy8
	k2Ulehk+rYghFIN5SReTc3cILaHJN2jqYyn9I2d3zc8Po9ZuPltIDq2UqmR4hfHT3/5Dx0
	DgrK8HqomM8IDx5DW8O2ObAGKe9zU4vthT9p4HA/17zST5g3Oa0dSzEhM+yBCCFHtKkZo5
	xZjJZ/M80Zw5BmfekdgUxEry9J0+4/nfS3DNPi0vLHuqDryMNTZaVRMtg4cKjVi7k1tA83
	XFRkwdH2bTvteQ8A5VXa9rXeUl4esB01S6CydTP2WPRl7Dyefbkysu7/ybDA7A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 10/10] dev-manual: licenses: update license manifest location
Date: Wed, 20 Sep 2023 10:15:44 +0200
Message-Id: <20230920081544.1226760-11-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4257

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Fix broken markup (wasn't displaying properly)
- Update the path to the directory containing license information
  (this change applies to the kirkstone branch)
- Fix typo later in the document

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/licenses.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 15e5c7396a..419af7c326 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -326,7 +326,8 @@ completeness.
 .. note::
 
    The Yocto Project generates a license manifest during image creation
-   that is located in ``${DEPLOY_DIR}/licenses/``\ `image_name`\ ``-``\ `datestamp`
+   that is located in
+   ``${DEPLOY_DIR}/licenses/<image-name>-<machine>.rootfs-<datestamp>/``
    to assist with any audits.
 
 Providing the Source Code
@@ -444,7 +445,7 @@ with source as defined by the GPL and other open source licenses.
 Providing Compilation Scripts and Source Code Modifications
 -----------------------------------------------------------
 
-At this point, we have addressed all we need to prior to generating the
+At this point, we have addressed all we need prior to generating the
 image. The next two requirements are addressed during the final
 packaging of the release.
 
-- 
2.34.1



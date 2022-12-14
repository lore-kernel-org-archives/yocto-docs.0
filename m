Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A94C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 10:01:43 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.98882.1671012099457769940
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Dec 2022 02:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ccTf5Gt2;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E8A39240002;
	Wed, 14 Dec 2022 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671012097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wQrAeDTmRA07WHEGeNgju2jXKnQ5t0U6yV/bufixFmg=;
	b=ccTf5Gt2W/Ztsgw1Msn0NJB8ASx8r7QR5bolxBv4i3w4TYy0SrSjZ+v2yQThom6LnlWq1m
	rOdh7WtL/igNVIeyu3x9iYEGl5myTupQydoTX/VbHjjNoDBZ+F41PmSfviBoomWaAopTDD
	wSKKsz9EBArDpTawxeUsU5d9hloZg2Xo2IrdFMSkY3aUbCocXQ9a9yOE/+VFjZbARefcMK
	D6+rdlVFgtJqr/SS3qXcWuApHHojHxwSrrVhaZFgl100dhhHFG/2eieysWAst2Gj2WIBBN
	cBH0d7U67BPJe3CWnoskUT41sa4KXNJBiCOVeNjT8T2BFwwCSzLVwxqoKVpzqQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] documentation/poky.yaml.in: update minimum python version to 3.8
Date: Wed, 14 Dec 2022 11:01:34 +0100
Message-Id: <20221214100134.200829-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Dec 2022 10:01:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3555

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Now required by Bitbake:
https://git.openembedded.org/bitbake/commit/?id=744310f360d2288ac2ef07745abc86852126b5b9

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/poky.yaml.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index ce67c4d3d3..cdccf6f3ca 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -41,7 +41,7 @@ CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
      rpcgen mesa-libGL-devel zstd lz4"
 PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
-MIN_PYTHON_VERSION : "3.6.0"
+MIN_PYTHON_VERSION : "3.8.0"
 MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
 MIN_GCC_VERSION : "7.5"
-- 
2.37.2



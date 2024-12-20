Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059A4E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.150876.1734697026313523385
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q6G27XVY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D934E40007;
	Fri, 20 Dec 2024 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b67KB3n9TDnELx+MW/YqTKjyBUnnJLt4ibJTKwSUI2s=;
	b=Q6G27XVYC1XumnDS+UQm/mMdMpJyb/j7WvAE7zEbeeJ3CIxTTpdqkmtQ3UeMr3iU+9tR3j
	IAxB8un6YCdODzWYqePnHWuCIFQQwkZ6eXLx5RO4HRDes0RcCIj6GYTagh6tCcf9PjE4vA
	fbdfMFcmOGPHl5wuYwuqR/4nmaK+B6mXOF/1T2PoXy8jjuU9NyWRJBAYD06VAXl36euZvN
	+oifeCPBlWpIHh54lf30fxl0Ay4U5IDf+MhtPv9ar0fX17tCM7SZ6vdnhnHk6a9+W0KzON
	FyuhunPmNBP3zpqwDOiyKbz3ktZuS/MdWLje6w27w4pPsOG6UaL6LfLPs8Wo8Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Dec 2024 13:16:31 +0100
Subject: [yocto-docs PATCH v2 04/14] ref-manual/variables: add missing
 entries to SDK_ARCHIVE_TYPE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-release-note-5-2-updates-v2-4-df29527f3fc5@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
In-Reply-To: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=840;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=B5fY0I30rsaW4C+6FdkaS9gi/mJl/QsoIdgo13j0B/0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA+heSZE+9I+3n2y8d8GT7Qd2EXwnI0QWc+n
 lvNhgOUt66JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPgAKCRDRgEFAKaOo
 Nm9QEAC4BF8gohbpRUFoLgzXQp6RcmW0F6Ve3e7tLiORrSRD/yhBLDY75VNr67I9skiSBZmx4ul
 ASOC4iInt3camfND8gNZd6QoIGF3HicLjeJSzizH3KQVMvnQW3MRaIC28Eq7V10jebjqxq/LBrT
 NDsiKPiugVDbnOVn2kzts6KeYxZiBHr3vZgbBEHmzV1BbPmH3ihwT+ZsgRWIrgDYZ3Zdujmr2ou
 CegBinICQqq+nmnNncx/8h+Z4KGBxhiNVRnuQ7N4xUc4x+lpp0Wcph2NNhn4KJRRWhjcln1rPzF
 M9YhrSbYrDTrA2/brqlcwnrWkbgIphqQqjVx8jIU+bSEYMGloe05CK0ovoKpNWAfsAZ+oMlN7TV
 ok5BrGeY6A7soLSyG5Ag3z7XcTkEhfaUL1x/izpu8dh1ZrK9bgSI6tjO3xucPmJ7LaB+XBBxo3G
 R4DCX7x19bsY1fd+LLttnkF1l+nYfYhR+K7Ke2beUH5StSTcpUDzuU01enCKxxa5sF0v7PfnodX
 nullYEGt3g8l0L0nfA/DBDR8CTcVSd0Gbt6n/oeKCNqg51dnvmfzDEfpT0Feb95s4r0+ORewdfK
 KwbEPYfOkDCDzXYRos0+0xdciYTnG22CPZ+yf2HBnnAN8l8B7DOH++M+IiHD8mRqCLpgFLJHPg2
 2Q7LrQqGqemaqKw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6000

Both added recently in oecore.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 21c4c78873e67786e09ac49a0ac15efedfb0240e..193c4933cabfd3057ab71ccdedc184341984371f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7517,6 +7517,8 @@ system and gives an overview of their function and contents.
       Specifies the type of archive to create for the SDK. Valid values:
 
       - ``tar.xz`` (default)
+      - ``tar.zst``
+      - ``7zip``
       - ``zip``
 
       Only one archive type can be specified.

-- 
2.47.1



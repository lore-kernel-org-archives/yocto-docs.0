Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1BBEC01AA
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 08:50:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12768.1774255823939486111
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 01:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Pwvd6/xH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F2CEB4E427A7
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9AC45FEF6;
	Mon, 23 Mar 2026 08:50:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F318110371342;
	Mon, 23 Mar 2026 09:50:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774255821; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/HWaYiI5FPny6tkjo0RXEwy7AccJ9F+UhMC+ScyuokU=;
	b=Pwvd6/xH7Sr6OIjTTjGYawUAZ++tLX+rPfuLGQy9PSIfqctbP0MRSuJB/QlFwUQWwEQ5n+
	683lRgSJGvK/qP+7kJU+wUPKBxqe1ucysvPTH6ovEmL4XP1VxQxWQVgBvHv6SXCwPM5HjL
	aiJbtu3BDaldUHcfPKr0zPLwSlUH6EqgEPx2iyB9ni1lg56Dm3HJXWfcvdjAqm9O7eqiSY
	kSVgJ5FuMMnAlz/0b65/sFKPIY3bua1FbiB4ZXNGe0TyHvPaBBeWJYdmpsTUk0HzfDlFac
	sEUp6yDRtZDGtqiZEN3j8VPTU43x51chVotZ9up5HctTbM2sCUgLCZdxTDGhtw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 0/8] Update the documentation for 6.0 (Wrynose)
Date: Mon, 23 Mar 2026 09:49:51 +0100
Message-Id: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NQQ7CIBAF0Ks0rMXA0GJ15T2Mi1KmFlPBQCWap
 ncX2o0m3fzkJ3/eTCSgNxjIqZiIx2iCcTYVsStI2zf2htTo1AkwkAy4oB4HbAJS60YMVFJGD0K
 oktVSlroj6e7psTPvxbxc1x5e6o7tmKG86E0Ynf8sTyPPu9UXDDb8yFMcpQSNWNXVkZ+Vc+Ng7
 L51D5I/RPgxgG0ZkIIrrTgqXkKD/8Y8z18c83F7CgEAAA==
X-Change-ID: 20260213-release-notes-6-0-733b408664df
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yVgSN5E0nZlROQzk3fYyb1sqCVdGUQpOH0temVwOCvM=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGnA/sqixQvZeGBJKqFssTjVO3RAj+GlRGBbths0DZ73gG07p
 YkCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJpwP7KAAoJENGAQUApo6g2/qwP/2wz
 SWa7Tz04GNj/3eaeclhXfL1gIjkCMfBFxnoq7dr3TqeUooyyhzvH/xHWzjJ9bpaASWci0sUdyR3
 5d8nZa4aagMaiwh0whhnbGj6A3EFpi45nhyzCJPatR0zDsmZdRKH2zNGuIiyEmhPkgvaT9oGIfW
 kB0OIh3pV+IKV8d4HRRu+lfwitmN9DUjo40DpI8Sp0jZ0jtkoaiHvCcTPHV86YmbR5Sb+Ia5tlt
 hXRwJ33f89Zuxsx4hWROqKyOMxbJi91CDBakYrLEdwsdPMscdrfcKo/lxqvEnK94hY1yjIc1Ymi
 UOYAbpxXb+xgBojHu0Z3lOgyjGBtqgzccdcqGLPHus0ojo/4mVe6mQ3TP2PE4GDvFAWCry0RNI7
 IY8sA6Il2iv13aMeQa80EmOxQWqTujz75zv6XBdyxQtptNfU6jBaadGm0H+mRCvM2e9xc2tegza
 9uMwjK/Z1Aa4igcL8c4Chh2UxTnzGgkDxvF76YPoK7kIczc1fUqBeHIPw/FH4hS/WsMFUZvop7I
 rNNorx5+0nWBxY8k5qz96TD0V88KXl57muip0Be1vOJ/5ddeK60F5WKTPOH8tw2bzuX9MU0nZ46
 qWwWafNZDLGCLxod6vcpamQvH8UUz89zIPFXoEZIkL1+Ixw/nAR0fe8oMSv/TnmaKfUCh6hHo3z
 mbm7Q
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9114

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- No release note content change, I only converted short shas to full
  shas and set their display form to 7 characters. 7 characters seemed
  like a good length to make it look like a commit without being too
  distracting.
  Thanks Quentin for the suggestion!
- Link to v2: https://patch.msgid.link/20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com

Changes in v2:
- Apply suggestion of Quentin in v1 (thanks!)
- Link to v1: https://patch.msgid.link/20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com

---
Antonin Godard (8):
      conf.py: define new {oecore,bitbake,meta_yocto}_rev roles
      ref-manual/variables.rst: document qemuboot variables
      ref-manual/variables.rst: SPDX_PACKAGE_URL: add missing parenthesis
      ref-manual/variables.rst: document the LTO variable
      ref-manual/variables.rst: document the SPDX_CONCLUDED_LICENSE variable
      migration-guides: update 6.0 (Wrynose) release notes
      docs-wide: add warning on disabled NPM fetcher
      ref-manual/faq.rst: remove the CVS proxy note

 documentation/conf.py                              |  16 +-
 documentation/dev-manual/devtool.rst               |   5 +
 documentation/dev-manual/packages.rst              |  10 +-
 documentation/migration-guides/migration-6.0.rst   | 193 ++++++++-
 .../migration-guides/release-notes-6.0.rst         | 455 ++++++++++++++++++++-
 documentation/ref-manual/classes.rst               |   5 +
 documentation/ref-manual/faq.rst                   |   2 +-
 documentation/ref-manual/variables.rst             | 172 +++++++-
 8 files changed, 831 insertions(+), 27 deletions(-)
---
base-commit: ca057a6b477b72698409d7b6c6ec49100f73d05d
change-id: 20260213-release-notes-6-0-733b408664df



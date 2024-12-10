Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248BEE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 10:00:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.6753.1733824829280386418
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 02:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i0cFbADQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CC254000F;
	Tue, 10 Dec 2024 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733824827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lZUg3CwukWQZoXF5PITUSg92Y+X9VTfL+AsyaGbu1/A=;
	b=i0cFbADQAaFIyYWIkqVuLZagJvKHzUD5eSLWi1WFP3PVrk8mEUjBXoZRzgdk2232gtU1DL
	P3cB2ZzaUowW09/4TiiTNuKWX/KRBiHa87bqxtwCpCJm4A4db6bgnCZxX6Enevn+1T3ibj
	+IuqQecu2G45MxJ/8aFLMUCvXGPBvrJy5p4ZAfRb+xg5KcQzDhqjFgL0Uvt9f2q3TcDb6E
	Y9v0tJyyLBZBehe4r/pY5Ub0p0qedotBr6rmUWOq/SRHRJLNjutMUkXnEkn++lr9J6hA2x
	QipMuQEIFLt2/qYgZQJ/NP4JOLhCQsIUSt5GaT+m2uOnHfJKvxJ56gaQvdOHCA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [yocto-docs PATCH v3 0/6] Update the dependencies in poky.yaml.in
Date: Tue, 10 Dec 2024 11:00:18 +0100
Message-Id: <20241210-update-doc-deps-v3-0-534699936ddc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADIRWGcC/3XNQQrCMBCF4auUrB3JTNOWuvIe4iJpRhvQpiQ1K
 KV3N+1GRFz+D+abWUQOjqM4FLMInFx0fshR7grR9Xq4MjibW5AkhUgSHqPVE4P1HVgeI6CtWm2
 sIcRW5Ksx8MU9N/F0zt27OPnw2h4kXNf/VkKQUEmmutGskMqj8X66uWHf+btYtUQfgaT6FSgLa
 FujZF2qpr58C8uyvAE5EfCU8gAAAA==
X-Change-ID: 20241120-update-doc-deps-1d59abdb2119
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2298;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wW8svRYK0LWHKmN5WWI+M3K/8SlJ4WI+4OC3ntKiZ3w=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnWBE6eKLfGIRtbXTLIeTV4rDfLVusYykJzpB+4
 b4IsyUD++uJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1gROgAKCRDRgEFAKaOo
 NgghEACqTGhw5VwRyA2ZNivqikmYZ1pHYlkdBdCw0+ZkOLk3mYCPOdMUD1CRl8T2s/mn4PJwg7E
 nhOx9sH5NZjoBh0XwCBpNUdrd9Tbhs/Cbi3Yj4UNJllbKabBQw/CcrFJIMOTvzSv+JNFLox9hfs
 8N8uG7Jhs7se1Vur8pV20GGpof6tjXCbeYF7Y0BwSTdZuxzuSwv9h3icbpx8iH2ZI8ELsXN6k4x
 JYGQjI+NQ4gACLJnn38MXIt5l2/Kd3XTe6gG0B6oClaTVm6H4tZsUG84E6xilpk1WTzdHjHXo2z
 4MbmlMF7vx6qzam1Q+/dV10wX/beXHti6JXPtNTfph5P8IB/F1rB5W3gxnUzMmlCuF/7fTUoaGj
 TakO4dju2Ok4fzmL3H3ari+8tDwwiQ/8LqAeG2sCJ/qZsWxb6pUGL/OYx+1XggYob96u5Eyo6p8
 t7QFj9tmxT0v1U0Uu0CxpRW8FAVCS3oOpZQZEzIuaL8j4HXfSAKL1XPcHrnnPn45miezVku2KFx
 pPHgYXkN4+koQAAPpB9Z3chp67i+Zrty1OFfJT1TErGQXo3pReKCe7vrINsE1F3qsgqPEDp+n+M
 PAryDP7RlU1fAKbQkn+BRl98H3oa6hDnbRTWxF7DuBhLocw+xmcMbMOxCN4ps+TmlZ98xpGd0qv
 6cr2pGhaMHkhoQg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 10:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5910

This patch series aims at gathering the dependencies required to build
(both the image and the documentation) in poky.yaml.in, and updating
them with regards to recent changes (PDF, Epub addition / switch to
rsvg-convert).

Having all the dependencies listed in poky.yaml.in makes it easier to
track and compare them across the different distros. Also, these can be
reused by scripts (note: I am working on a patch that uses these
variables to build a container image ready for building the doc).

Also, add the dependencies required to build PDFs/Epub files. These were
initially listed for an Ubuntu 22.04 docker image I was working with,
and "translated" for other distros using https://pkgs.org.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Comments from Quentin (thanks!):
  - Re-order commits for easier backporting.
  - Enquote texlive-collection-* to avoid shell errors.
  - Remove extra doc deps on Fedora that weren't there previously.
- Move the texlive-fncychap dependency to the PDF specific dependencies.
- Link to v2: https://lore.kernel.org/r/20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com

Changes in v2:
- Fix sorting of the yaml lists.
- Split commit for Fedora 39 addition, to backport on scarthgap.
- Use texlive-collection-lang* to match all language texlive packages in
  fedora and opensuse.
- Link to v1: https://lore.kernel.org/r/20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com

---
Antonin Godard (6):
      Gather dependencies in poky.yaml.in
      poky.yaml.in: add missing locales dependency
      poky.yaml.in: replace inkscape dependency by librsvg2-bin
      system-requirements: add fedora 39 to supported distros
      system-requirements: update list of supported distros
      system-requirements.rst: add dependencies for pdf builds

 documentation/brief-yoctoprojectqs/index.rst     |   2 +-
 documentation/poky.yaml.in                       | 263 ++++++++++++++++++++---
 documentation/ref-manual/system-requirements.rst |  59 ++++-
 3 files changed, 289 insertions(+), 35 deletions(-)
---
base-commit: 30002019198a168e48537407bb928facb26af82a
change-id: 20241120-update-doc-deps-1d59abdb2119

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>



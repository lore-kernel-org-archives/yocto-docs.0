Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53A5E776C4
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:24:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123069.1766593484484655650
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rcHrmz+A;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4DA071A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17DBC6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B59D210AB12DD;
	Wed, 24 Dec 2025 17:24:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593481; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=d7kWMkh+8ub6AUvvaHrVVg3uEm3aEXpX5+IoVaHrnSQ=;
	b=rcHrmz+AZcUJPPnCgvdbtG11tkPSjNs9JL3hrWOUbBRmFuUDhmltScm43sGEFXFUpBfqnC
	nw7OcYMhJY2XKS7AL1WRXZRblBQXEJK1luuTkLH7rKZBg9Tbz1JXS2qHEN5+adTgt0VvBe
	90liwtXe0J4yQPumU8bhuntvOGrU9oRXqgUeoX3LfNddrgMEZuvEazbJnHMflezsn3uer4
	2dm+5WDdkWwuGC3Qm0xUH9bOhrQuROqiwNEnBTm4xTO48wTBLh8xaUyr/TXKA+PTaH+C3+
	Bv5YRxwT5ihR306N1guIXp+up56C2X8wpXecDiV4JMWCq3Fx/itScQFcQC+frA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/5] Redefine terms now that the Poky repository is
 obsolete
Date: Wed, 24 Dec 2025 17:24:15 +0100
Message-Id: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK8TTGkC/yXMQQqDQBBE0atIrzOgjQPqVSSLOFNqC2roNkEQ7
 +6YLB9F/YMMKjBqsoMUXzFZl4TikVEYX8sAJzGZOGdfMJdug87mFL3CRhdiiJ5rwOcVpc87DbL
 /eu3zb/t0E8J2R+g8L8pLZ8JxAAAA
X-Change-ID: 20251224-terms-refresh-cdcd529ee508
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KFGLVYJuKh9peBnBJ1akEsPoqJej9SkOTRWmWfld728=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBPHa6xl6VKc6fFK+0dK9OKAHjJ1w6ze2w5ho
 fE7HS/s4LyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwTxwAKCRDRgEFAKaOo
 NqW3EADBcpQJbCS7XBatQX4/sxoO8fX18H+PQ4BgGbP5k86XHap71XxlR+CC7rnaOlU8ajkMAQ/
 bwvP0eBVTUG6MOZkHQMfVknDrkcjGqN9MK6cJbCuSRbSZ1oJmYdNsWbL/NuEVnefgtUgfVXZjXb
 5CNpftFKQFEgzAby1I+eUHrEut6DeqYJn7Cs+3t/wCN20RZ5WNEKRc429k72JmcxChN93hnH3X6
 gjUV3YSpbjtcJ6T05ZXWwPDwHwwhK0WzpV8cC/7P+P8vEnDtglnYF7zGLS9bubWOpwQoO/DLYCY
 OUpzh4UuwIochVgbE5K7dihqdUJdGIe8aK4zaRpzy6yZmXCIx4F+t9EBBki5ztAOsLXWYjQ6NHe
 ruLaslvkrCWJpVBF9hoaioOddpYQfPacnQeic5d6k4fGShLQmmo0OGBJf53qEOfN78F084KUvwt
 0RpvHMUWYh+FXxdnzv5rNBAR33Ujr99lwH1RBNWHmf4Unx7Umitj3oAZi5syNcEDdKJOTg0OmKb
 9XpPfqegK/WihXWTuIyECyiEnduedxs1yti0w0hUviJpDm5wLTJb/FZi/oxu1je5B9F68Uk5fKQ
 /FE5qZq6rVBaBGxeSHwON2eEx2QVGKUtJ8oPQuHhRhxoutTB19SL1C3VyUnzSOnxYRyVkye2nUc
 6jvs26Hq3XH8N5g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8324

The Poky repository's master branch is no longer updated:
https://git.yoctoproject.org/poky/tree/README

Redefine the terms in ref-manual/terms.rst to adapt to the new
intended way to set things up, that is: either using bitbake-setup or
manually cloning the oe-core/bitbake/meta-yocto layers.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (5):
      ref-manual/terms.rst: refresh the Build Directory definition
      ref-manual/terms.rst: refresh the OpenEmbedded-Core definition
      ref-manual/terms.rst: simplify the Source Directory definition
      dev-manual/poky-manual-setup.rst: mention the Source Directory
      ref-manual/terms.rst: refresh the OpenEmbedded build system definition

 documentation/dev-manual/poky-manual-setup.rst |  10 ++-
 documentation/ref-manual/terms.rst             | 118 ++++++++++---------------
 2 files changed, 55 insertions(+), 73 deletions(-)
---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20251224-terms-refresh-cdcd529ee508



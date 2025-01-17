Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10132C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 10:09:18 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.7673.1737108551529075312
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 02:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R/b4YQm4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 756BE40003;
	Fri, 17 Jan 2025 10:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737108549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=umFKQRyFOx0j3H2jrX/LWm7RsoGGxrvZDxyCMEL+Zd4=;
	b=R/b4YQm4Ctypa9kgJvsd/kBk1MNLgR0I2/nI+HnOqb+PE+CvFrk84bsoEBx5ET6SlH21za
	f5HhK+xV91iQvOUrgmYkz5ZoRuh7u6jFAwAu1J8628mp8G/Nbr7ACnpHxqq3UyjhrUDA2j
	sUpjHEmQzcp62Pi2VOcTDHOMKzkJtKjMDhC9LvEI/Jl++nnhZrDvNxCXx0FRfI+dwz+UYU
	dgcC6yJZQxa3ha2tAFnYeBvItBga0u8hGfqsILIGS4tIVTHhslNjyfKH7af20Os7YR6Ed4
	h9maC3c5GAteA9yojd09hKoNtVaNQpluNZkJ/MipkC27dthFrwJPDeVKpb2Mog==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [yocto-docs][PATCH v2 0/2] Update the autobuilder links to
 valkyrie
Date: Fri, 17 Jan 2025 11:08:48 +0100
Message-Id: <20250117-update-autobuilder-link-v2-0-3ca2d22ab24a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADAsimcC/3WNzQ6CMBCEX4Xs2Rq3En48+R6GQ9kushEpaQvRE
 N7dSuLR4zeT+WaFwF44wCVbwfMiQdyYQB8yoN6Md1ZiE4M+6Ry1LtQ8WRNZmTm6dpbBsleDjA9
 Vly3WVFFJVQVpPXnu5LWbb03iXkJ0/r0fLfhNf87yr3NBhaogZMLcnHVnr61zMVVHck9otm37A
 PMQ/+vAAAAA
X-Change-ID: 20241226-update-autobuilder-link-97b19c8c7c88
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BAPMHUAOzsSi4zrZFpZJozDSE16i39TbHgS6Al8TxbY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBniixFgiOot2NuosVsSAKfSvPxUJbvwMGzkgZf9
 WIk20d7Y/aJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ4osRQAKCRDRgEFAKaOo
 NjxWEACF4FadbJ43uKxlHsNAgJE99d5GxSkJS1Vse2VudXHZFUGd4hXPmQS2si5iSXXyfQvwpj3
 egMwJOy1KbIn8dM3z9KxUNnLCCfGmtU5oZ6sFm2Kro6RueV2CR9tQYs9q6u64ryhn8AQeb+XanA
 6s4X1aKdSjjFQo9fgMuRXdCPaI3h1nJgFmMkJjszdMliwvfeeA/Y48jWLIYiJ5hkwSkVC57HKoz
 Sv3JyDSKVNPsmd1uhzijkkPKbXCnUdjOqKR1ny99RnjyriA+CPChje/oJ51Nm4CWAsD9E/Se0jy
 i+EUiMyBmqH0Ue5omQ/8tNPHy0hFSUcfX3kULZqXQRbfgbiHx/q77wwlaHL35HGnbS+82hXGsvS
 hHZlUlOI9vd6gU+4BmyfWHt7kdyt5ej3zYamFDgb+i+5ulWU0QxF5IqSPyHJcXUGxh+JZKywtS5
 qrz0vUHeF5klM93PgcI9ZgoWAkXiaih6x4d1NnCwRATJEmxgWCp8LIO/0W2a3OO6j9oQitqUg2W
 6k5ic99zBaV7QZn6GI6KNStQISmVWVCQ7Yjr54XCKxLm/deVs+JUIilh13SWDdRn7LgTEXYG4BH
 3WmiVgDwoRFhsz+9cXM9gGicC/d+/mKU7XXStPe/YjZJw1iftZtQyBJ0a/nagbAlgcaytDzysw6
 zDXrlcyBVY0mWJA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 10:09:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6122

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Use autobuilder.yoctoproject.org/valkyrie
- Add commit to remove distro specific reproducible links
- Link to v1: https://lore.kernel.org/r/20241227-update-autobuilder-link-v1-1-6c1ec14a32fd@bootlin.com

---
Antonin Godard (2):
      Update autobuilder URLs to valkyrie
      test-manual/reproducible-builds: fix reproducible links

 documentation/poky.yaml.in                           | 1 -
 documentation/ref-manual/release-process.rst         | 2 +-
 documentation/test-manual/reproducible-builds.rst    | 8 ++------
 documentation/test-manual/test-process.rst           | 2 +-
 documentation/test-manual/understand-autobuilder.rst | 2 +-
 5 files changed, 5 insertions(+), 10 deletions(-)
---
base-commit: 6b44257874858db3aa426d3e84a79c41cb4937a3
change-id: 20241226-update-autobuilder-link-97b19c8c7c88

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>



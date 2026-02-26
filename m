Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B89AFCE086
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:01:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70537.1772114460273889373
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 06:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=c5fdY9/G;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B59554E4122A
	for <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 14:00:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8ADDC5FDEB
	for <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 14:00:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E9951036937F;
	Thu, 26 Feb 2026 15:00:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772114454; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=YyojuYhZlN8fy2iBKzYJBtWyfoxIMISpJCYjUq5c1F8=;
	b=c5fdY9/GhlwNIhyQg1d84S0k7hy7reH+gVjuJDf9OiSMIWFQ7kFTeZ2/G0xEq5CvgLku/Q
	YWhgtlBf3dJEz78PGMppqMg41r3jIdtvPo9UFcXaYGpt+wJ9DybBr58YWF6VFhN885PsIA
	P4+k2FdY/kAlocc98qjPB+RrdS3Ev0jOkk2+vJJm0X7iKTZcdMp/Yv98ybVYrGTwNecn8k
	Q8ljOQpF0kCAzCU3vo8vrVNKXQe99BWB+o3Z6VZBhUqPJiEBwv1ZG64o9SXmoSQLpCenlr
	r391Wy9XsqIzO1NarBmzR3t2t2TblF1nHvJyQLcOzrmofTmC40vl0xRkkQdg6g==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/3] set_versions.py: build with versions from
 releases.json
Date: Thu, 26 Feb 2026 15:00:44 +0100
Message-Id: <20260226-releases-json-v2-0-6ba4a3b37b24@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Nyw6CMBBFf4XM2po+RC0r/8OwADqVIdiaDhIN4
 d8FjBuXJzn33AkYEyFDkU2QcCSmGBbQuwyatgo3FOQWBi31UWptRMIeK0YWHccgrPG5Ox+cs6a
 CZfNI6Om19a7ll/lZd9gMa2Q1WuIhpvd2OKrV+7Xzv/aohBQe0Xipaqvs6VLHOPQU9k28QznP8
 wc8wpoSvgAAAA==
X-Change-ID: 20260223-releases-json-93f5d84dd93a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=bKaLcp8xHT91cTP0u3SHyXegimspWrszw2q1U7bNl6g=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpoFIUVYq0WzgtqezntSvAaeaeQLAdCf8SUa9D9
 bXBiUivVxGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaBSFAAKCRDRgEFAKaOo
 NutTD/wJLR5NzsxBjU2H0ly3SJKZtB9lPTSa9xABxZxrWwNzzq//bD7FiC7kxw+GXPqy0cz8BFa
 +V6x2KHYe6JubfajesuGwqADxC+XCTUVqYj13yfYBS1ytRc/7Zo57765EeUlertaIVeIuBmhUdk
 3hUxWZPLuy3dq7AL2SW0d7AQ7fWtDkwK/HHl6msLkRx6axE2Rtzv6T7YnKQrxsREU2qTjpPNSn9
 EbVXZyhduPip/Za7IIyRQ7S8zckT99pH7+Le/9/M1gN/wTS0sCcE5Oz/bo6K/h/J5NC8AU11laH
 PJbI4dr6JFY55Xgk5bi6sA/D3o6Ep+avGjduVXWvMFqP68XAWwiiXGujuiy1I18OsdoOLLnD7KO
 abiFK/ir3Gszw6FTB6SHhGPG9i8S/JH0wmQOQ3G8XHtw57IpcLWKZwU8RxxwKULCw7tSmmsLUdz
 6z+7E7dSSdqn7RMV0AmiXFpPadPaclCjdfry3FpsKUAkchZWMPrbkvLbFDg6vGrMO5qOqKyfk8y
 qtjbysCXFAh+fb2fgxxJR9DV4Xek42P9OO6G73BL1gZJDCQI/MD46VQtbZrCzzJqhj4yZKLiC/Z
 CFG4CpoNmjZXbw2I2ZqPpndPE67P7eS9204qXBU9Ebn1i3/1PMpQjqVCZneRh0LBspKAw9nuTa8
 bzZ7HK28mMXhmfQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 14:01:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8995

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- add a python script to fetch and format the releases.json file
- instead of a make target, make it possible to use a different
  releases.json file using an environment variable
- Link to v1: https://patch.msgid.link/20260225-releases-json-v1-0-fee3f01b9197@bootlin.com

---
Antonin Godard (3):
      tools/fetch-releases-json: add to fetch and format releases.json
      set_versions.py: build with versions from releases.json
      set_versions.py: make it possible to use a different releases.json file

 documentation/README                    |   9 +
 documentation/releases.json             | 623 ++++++++++++++++++++++++++++++++
 documentation/set_versions.py           | 100 +++--
 documentation/tools/fetch-releases-json |  30 ++
 4 files changed, 723 insertions(+), 39 deletions(-)
---
base-commit: ff3cfb0ed3515fe42ef25f055e039ebdfe66dac0
change-id: 20260223-releases-json-93f5d84dd93a



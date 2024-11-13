Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C5AD462B4
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:30:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.13057.1731508239145120514
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 06:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eIPAh61O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3435E0003;
	Wed, 13 Nov 2024 14:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731508237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VwypoJGgAfrWsbZnayYnh1+LG8ZNnQs7swRwVEQWJGA=;
	b=eIPAh61Oijzz+hO5v/DRDtq0UbLWd83kswGbfiIcoWgnHFfgHyVsDoNL8agvijWqTOWRru
	TWFX4FGZj2b4IWlX6981vSgHleYlRA/XAVahh55RzMSMHzXUFbzxpJQ7IKy8sSQwc43/3i
	lQ8aRFunMcZMSg7+wgIbFW67kerdk+mCgY1auMQhHfyRThV/7qjJtpadqucXiILaaxjZWb
	y/vCForTNhsX9TLwkoTWvfYXt3cqXRhUqfrppR9obts2fxcAQ1mCML5+6+/bZ8qVT/vDnD
	e0K3wlxa4QGsmEsF19+QjUTShF65OIX0hfIjLUHHfvhnLWco8xUK+2HZUEUuiw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [yocto-docs PATCH v3 0/2] Document how to provide configuration
 from layer.conf
Date: Wed, 13 Nov 2024 15:30:21 +0100
Message-Id: <20241113-layer-confs-v3-0-3a84b0eb2750@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP23NGcC/23MQQ6CMBCF4auQrq2ZDgjiynsYF7VMZRJsTUsaC
 eHuFjaGxOV7yffPIlJgiuJSzCJQ4sje5VEeCmF67Z4kuctbIGCloAQ56ImCNN7ZKE+VwZoMtU1
 XiizegSx/ttrtnnfPcfRh2uJJre//TlISJNimM7aqgbC5PrwfB3ZH419iLSX8aaVwrzFrRA2tV
 Rr0mfZ6WZYv7phhHOYAAAA=
X-Change-ID: 20241030-layer-confs-54c26ece97d3
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XO/Vv/HLoJNDFZwij+EpvSV+In6opctofOOZvC0vdbE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnNLgLmWSs5aky3tpepVO0CxMp1eYUMH/zcALz1
 VqCFD6CRRWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzS4CwAKCRDRgEFAKaOo
 NpSTD/9gIMZoaAjus8b6JZWRl8xiSO79UiPTcyXDil7X9TXVe5TBJPTk8HITkYSX9clNu75qVvB
 OUORJIcmp/tj/rjNsmlcUatdjH//CMvwn00Q2d5ysTb+hn5iEQ6WfCuclfWrfXTnX1y/oY4PPcD
 ANWOfMQqGyQ1RcM+9xIzzaue2uixWGwpWHoX8YmdpD9qJOHXV6hzpurdYqlJ8G1j0/2KqOsFIAi
 cDBPJLutDnjqpNGzuG4eG9SJVFX4Jm1ivclJLXlCeak1HAWtB+Hv8atM0edv3EWx4XJewM7I/P1
 xWdfdRL/2SaJU2cOUKZzYX3D88d0jLWOlLEHKo1/6VIndYWaqtNdQCUjCTUZPdsKwAPBameZ3S/
 FObNlDDoPAXMj3K0OXqNnuLtgckw/1426BMr7xI5ZqzCd8Dh3KCqUhpUGBbfiJCdudtyfqUP9p1
 6mCYRoJKKP8UKGdRh5a00V8fEXczEgi/VnlifKuU/r4P5GpnFDAjP79pNyVkN1ybOidNjAHprWS
 /ReaFPITaVkJzp9a/AqAJQlmHC1jYI2CH2HRP0xTv7t9o/cohS3zp8Wd/83oFAZOZ2UkrCWnrF/
 jeGo9IdKq1XdE+znuIYVWfn/aL+7F1y3HHv0ooa9Mr/c0iYwJ1TSxtVID6981nFI1pK+LVKbcVn
 Kdhbh2L2LfPKhIA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 14:30:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5732

This series documents how to provide configurations from layer.conf, be
it unconditionally or conditionally. I wanted to reference a file in
bitbake, so I added the :bitbake_git: new term for that.

This is a attempt at closing
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12688.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Replace attention block by warning block.
- Create an anchor for the conditional confs section, I was getting a
  sphinx error.
- Rephrase the PREFERRED_PROVIDER sentence.
- More precision on PREFERRED_PROVIDER assignments, with other conf
  files..
- Link to v2: https://lore.kernel.org/r/20241112-layer-confs-v2-0-22a09f1a0a8e@bootlin.com

Changes in v2:
- Create an `.. attention::` block to tell users _not_ to set
  unconditional confs from layer.conf.
- Fix typos reported by Quentin (thanks!)
- Add "Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>" on first
  commit (thanks!).
- Simplify "your layer is part of BBLAYERS" 🡒 "your layer is part of the
  build".
- Fix code blocks spacing (three spaces).
- Link to v1: https://lore.kernel.org/r/20241030-layer-confs-v1-0-0f7dcf460e27@bootlin.com

---
Antonin Godard (2):
      conf.py: add a bitbake_git extlink
      dev-manual: document how to provide confs from layer.conf

 documentation/conf.py               |  1 +
 documentation/dev-manual/layers.rst | 90 +++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)
---
base-commit: 13caec1386708d8609dff5f42956d2329a074f37
change-id: 20241030-layer-confs-54c26ece97d3

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>



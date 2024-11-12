Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E686D32D9A
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 11:33:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.84610.1731411181205991445
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 03:33:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=njDl2MwP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DD25C0002;
	Tue, 12 Nov 2024 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731411179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T098As3xX7i0qHFAOMlsEIXBwO56TJKt9AaDsL8rjD4=;
	b=njDl2MwP1uucpgP1j+5NWBsTtvT7tNkYGdAHTMxQVb0EcL1XTC8LVe0cZwaqFGhUf7vPDS
	MhuMuf6Ou2Nlnrq9M6mvjcDWBc1mx3+hEC2KFwBK2FLMYM/Ip/xm6MY+aSjEv4sAjBltO0
	gCEP36MXW6bEuy9DECcxFn7ekIQRhfvcbO7TmH2gvNZsJd6m05Y1RlgegNKW1ZGGaL+usi
	Q1QtdZgQpHRqqAP/kxpFoX6pTqlBMqSCB9GM5S2mdcPrHDIkZI/Z1MmSwoGIXXZ3h1CJF9
	1kD3fl/RPwiJdkkNxE1VNIMx5vy1WryzlJGZkROqYH0s94xXBL67ALsw2ewLYA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] Document how to provide configuration from
 layer.conf
Date: Tue, 12 Nov 2024 12:32:52 +0100
Message-Id: <20241112-layer-confs-v2-0-22a09f1a0a8e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOQ8M2cC/23MQQ7CIBCF4as0sxZDKZboynuYLioMdpLKNNAQm
 4a7i127/F/yvh0SRsIEt2aHiJkScaihTg3YaQwvFORqg5JKt7KTYh43jMJy8ElctFU9Wrwa10F
 9LBE9fQ7tMdSeKK0ctwPP7W/97+RWSCG9cdbrXqIy9yfzOlM4W37DUEr5Aqw7OByoAAAA
X-Change-ID: 20241030-layer-confs-54c26ece97d3
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5mrJdxT0EBw30yWDmsZxmHV8A0ctua+D0xt7q/fsC/4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnMzzqJ6xS+zwIiMcZkWxc++WX22CoRkbAwCdjU
 HammXCyAWGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzM86gAKCRDRgEFAKaOo
 Nk2sEACShIlhVXkwizf6rQW6Y3GPQ+NHsPz55z/2EHoNxYjjD/cCjpk/Tn5/Qbfh9HT5HBlnkbL
 r+s5zxM0UuLHZhENQmD9KzsEhAf1VGVLuR+AVPE7I/FMhAxzduiXqkdXlbtTgseyl6g60Ob15oD
 Q2UtetB2/rwQB9s10v0mgl4+Bbm+OacgU+tFoRvka99uP/tNq/Wz98BBPNXN+KAaiigJQIaOuzM
 cOwgStDMSIQfrx8ZKEgDTkZbiaixfuBUkLnQFdwkNWrg/7+3CZXHlihtUUgNNpG1RMalb1T/iPE
 LGU5Edtj8oCiFb0ACQBiKzs9tbuzByZlmed3DUEls7lFZxAsIv4E0R+A5ugIYl1ZEPAnGznrtGG
 85ZQd2nJxeDdOiazVtGWvbbdzpYF+CHkgXJl4Qa2GUT7ShGb64PPOUT8tQE5V0Z8U5ROtZ3lsAN
 cMWznXDVvbjGCd577yCB64o7eKObNC0sbmo9XsbJbpGxrnnex7W7OIgatARW00NjdgYB6QZ5l+N
 0nr9kp4EXp2KAYrq3ikDBgTPqY4IR/g7WtJDOltqnJroOXgB3o5rUiow3qg4r+udPtwqCCZ/ItW
 wyxs4z4lkY6MNIJRey816v9LdL+uLlFAvh0fp8UXvJggly2/LctaYqt14bZ0b+SPMoHuKMdY6Ed
 qyyUZ4e15Q0C/vA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Nov 2024 11:33:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5715

This series documents how to provide configurations from layer.conf, be
it unconditionally or conditionally. I wanted to reference a file in
bitbake, so I added the :bitbake_git: new term for that.

This is a attempt at closing
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12688.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
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
 documentation/dev-manual/layers.rst | 86 +++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)
---
base-commit: 13caec1386708d8609dff5f42956d2329a074f37
change-id: 20241030-layer-confs-54c26ece97d3

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>



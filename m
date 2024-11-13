Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6450FD462C4
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 15:28:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.14130.1731511703553462368
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 07:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GcM/s15X;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83CA7240002;
	Wed, 13 Nov 2024 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731511701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CCVPM9N3q05H000zal+e0hEW41kNJ179L4xz7KqfbZA=;
	b=GcM/s15X/R2aRAkOwc6MdUjMlQq+mnPcmUUHp/xtQl9V+f5+k1iRkz1Jag8lvOebEyX7gg
	t5W5o6VgP/7fn8QAbQleWsMoAYfMSA2o9fh0v9yF57pNsCyFMLhUWCfg+I1IF4sDQvYa6N
	afT4xcXdlgRVuGYImGl4cuDXe8yUoU4kSOpZuINPjHg1mFLruqGEWnr3cBqcZskTXPIv55
	of9v8XRTHC8BDAydQ1kmAzu6HBVk4Wno12d6dj7Z04aB2iZ/EWCGr0EIJDiseWHtJOIIJU
	ajm2TDLB4La83vrRBg6Tk/lkIFrgsaCiHwRXPAGBPVSQz2gJpQXRGTa4/h7vcg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [yocto-docs PATCH v4 0/2] Document how to provide configuration
 from layer.conf
Date: Wed, 13 Nov 2024 16:28:10 +0100
Message-Id: <20241113-layer-confs-v4-0-a4758fa4d1a8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIrFNGcC/23MSw6CMBSF4a2Yjq25vS0vR+7DOCjlVpogNS0hE
 sLeLUyU6PCc5PtnFik4iux8mFmg0UXn+zTU8cBMq/s7cdekzRBQCZDAOz1R4Mb3NvJMGczJUFU
 0kiXxDGTda6tdb2m3Lg4+TFt8FOv7vzMKDhxs0RirciAsLrX3Q+f6k/EPtpZG/GghcK8xaUQNl
 RUadEm/Wn5rudcyaalLVQPVWGSw18uyvAHB/uU6JAEAAA==
X-Change-ID: 20241030-layer-confs-54c26ece97d3
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=29IQ5aoNFOzvPIKWSfes6SLx04i7UYyl06iLiGsiWnY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnNMWUn9qWPowBu10Cl0shS3BdUfG+Rb74yWSEQ
 DIdt1zj4MyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzTFlAAKCRDRgEFAKaOo
 NhWcD/0fKHqxiWuRbcI5o9+IWrf9xwnzt4vMg5hY0mtrXQnBUYeNSkB5dLorxClPcbyV68W4c/K
 rL9sLcLky7NeCwh2yIXG0iYu7wSl7+G+P0uA7YXONEPy3If7P1asyWbfsqcPqCPif3VLxh6UokH
 240ubkiXAbXdQjCw46WwjghfGaOlu5PBwxX2Y0EOFtjZWmrQ/wXc9n91Mke3WD3YWqdv78z3oa8
 pkAIqQelBYc3mONqcoQiY0WcKNrOR4McaLafWituOyFxUP5V9QhYG1j51eywwgFJZRmW4hkNi8P
 aKMXvigGbB1Y1tLpDTGcMNX2Jzm/4dGisMHny8NXLRiSI0/Ot3LZBVVvvZF6SDFzrRoJYO/6Pgj
 WDJpBb03VTH+lovPRO/wgsMumDgv+qFmPz1cdNIJBieJdfl/88CJvp17oKh9WRtQhcQSEm87d+H
 0bzl7WiNTQ/BmTorS/norifpgcasN1gx0wR7hJnWa3/LJR1vACM5hfi/YYus300lzdN1LcHeVoL
 JKBtRKBtL3M+twNlUDVYbTpH+IWQGdXXjR5rHEbl14yNw7+GQ5pA/S4ua/Ocy0b05eORluUrFfq
 DKMHyS7MVlyEzyJtzqtaCqkQ+I3ZhmczQNA/jYh03KyDuJsFfQ6n8h4Evo1gQPyVmmpBxSGF6QS
 SVDt1ncDrBPIwZQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 15:28:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5739

This series documents how to provide configurations from layer.conf, be
it unconditionally or conditionally. I wanted to reference a file in
bitbake, so I added the :bitbake_git: new term for that.

This is a attempt at closing
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12688.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v4:
- Fix include -> require mentions after being replaced in v2.
- Suggestions by Quentin:
  - until -> unless
  - it -> one
- Link to v3: https://lore.kernel.org/r/20241113-layer-confs-v3-0-3a84b0eb2750@bootlin.com

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



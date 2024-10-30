Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44FED2AB2C
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 09:23:41 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.10684.1730280216960680880
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 02:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IoncPLnz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B093FF805;
	Wed, 30 Oct 2024 09:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730280215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JLAggswfP4oRL6dSuC4MlZiozcBeguwWEAjMjnnHA1g=;
	b=IoncPLnzSKewspg/lCQQ99L8OKdBiObOKmsXvpVQ5n6F+RF3Cd84J8cLQqoDA791EGe3x8
	u9XlELGAgJcHxRrdAl6AbuTIGRZmrS/0Z814j60aYK2cJrOOhfZ0H8f2e8m1xkn0jkskX0
	ljm8VF7dauTkGyHtnDv5Ff2xUFwfTMeNL1uB6bw4sro/Wlszpv7/5QHTqypkAZy3ss4XPB
	1UAfx5R9EOVi12ffZKDdwe/hxea7+IhLCrm5Ug+JlKzkc5cc1MlE9IqkBYujx+wocphSqu
	i8rfilol+MMSS+25zNiP9IPthzz7VS/S3LTgzL/logE5w7+kl6kPOYNM3M9FOw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Document how to provide configuration from layer.conf
Date: Wed, 30 Oct 2024 10:23:12 +0100
Message-Id: <20241030-layer-confs-v1-0-0f7dcf460e27@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAH7IWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA2MD3ZzEytQi3eT8vLRiXVOTZCOz1ORUS/MUYyWgjoKi1LTMCrBp0bG
 1tQCcCGKPXQAAAA==
X-Change-ID: 20241030-layer-confs-54c26ece97d3
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=838;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=K4KlXZcnScAOMWXEr5LnCF5FD4nrZrHHVj8gq3p+rL4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnIfsWYaRmETVDDLRIM1OfDBveFA3CVwYU1eota
 KUglXbMhCiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZyH7FgAKCRDRgEFAKaOo
 NphqD/4ofCaOuFw4+QfQh+ZZRysFQaxFAGYccFwPnki0HgGzjQxO0+ODaq97MYCfdZFy9CCQiCa
 8uhF53TKdgcpgdHBMcJ+T6BlogxcH+Tl3188roZ44q8WzzQQ7Q9PuT3/zSx25x3678Ca7vAAMsO
 3LwgtMZ8ZlMfVIddToDYqIzJxVKYBwAvF3TGEKg5dSRvGkllchv9UKAsIT5GoWmQ4qcU7RLGKpn
 IuAhdigYmoPmVQBGUE5qgFNTcyKRu2AB+LdjYZZnp7FQLe1Pzpd+B6+yy3G588hON6VryDIJCNI
 +xBmiTck6JZA6zwWjfcALv8p/Voaad1Vd6aIwCCzMy+LLA+jiMFRk2Oo7owJqY3XkiwIeTZw0uD
 nsoy39lgb0agggkKIojNXzYA8Vp9l2+jjHgEPxjhffICAHPvxGKAaK/+xhu+1R1dJryNUmjb+nz
 ErlPS3No8IPmyO0bt+ziGbeo1Lyln0dze81ej1+jsUf6yedBrSh4WZvCbxqD0UchjmimqlKqQe4
 X1H/BQ5AjnvgR3YbR/tRdRo2KglWtzklgX3Y84Y8GqUKOqJJRGI3Ua/rIB6NQ8VJN7amsmrkoGp
 JPIyVIWBuFJAtp0aRzR8SeAi30uTQpDdXet36ekXIodV70h95em3NmitA0rNvvirxAChvYhQYmv
 l1oK5E4JIQjJZtQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 09:23:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5610

This series documents how to provide configurations from layer.conf, be
it unconditionally or conditionally. I wanted to reference a file in
bitbake, so I added the :bitbake_git: new term for that.

This is a attempt at closing
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12688.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      conf.py: add a bitbake_git extlink
      dev-manual: document how to provide confs from layer.conf

 documentation/conf.py               |  1 +
 documentation/dev-manual/layers.rst | 78 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 78 insertions(+), 1 deletion(-)
---
base-commit: 4c81e2856c268d7d0221ebb6b8156ad65b9e83ca
change-id: 20241030-layer-confs-54c26ece97d3

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>



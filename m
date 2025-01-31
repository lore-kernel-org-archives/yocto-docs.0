Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8199FC0218D
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 09:53:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.16107.1738317224287551346
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 01:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xu+7Abg7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B0B7442A0;
	Fri, 31 Jan 2025 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738317222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LQDmpM3aTfZ9Ratds6abWL7Zus2I9iUFpdTulDBKP4c=;
	b=Xu+7Abg7grWX7K9TUgVKJEIUSiWyXb5sn9l1zNMBHFIGbgiJawQ9p2k4agcup8Wp5GSG59
	TAw0CbvpTLL+Ntay94atWp89ROXXS0leFevjs5t59H3nZMn9tFuDYueUa9NLs9NyUcG05J
	GXSmA/zQI7xbl4mvnBvLI/4dpsryHUyphCKgTil3/vozMEDPGJ6l0jwwgWYMxkPNiatavZ
	Cwa0I1KVZxiyVyaGiSqCbunFRTK5NEh2a0kJl+ITLeWqaxkBUUnSAk+mndcXSYZlJ/U5Jg
	rP0Av2nqDdzYm6KRvU0FnwIbS+bJQpNHEcFuROKNsyjlydKbU6yPPsSZLXO3Fw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 31 Jan 2025 10:53:34 +0100
Subject: [yocto-docs][PATCH v2] ref-manual/faq: add q&a on systemd as
 default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-faq-no-systemd-v2-1-a6f44b5040f3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJ2dnGcC/3XMQQ7CIBCF4as0s3YMEKriynuYLko72EksKJDGp
 uHuYvcu/5e8b4NEkSnBtdkg0sKJg6+hDg0MU+8fhDzWBiVUK6Q6o+vf6AOmNWWaRzxJS05fSBv
 qoZ5ekRx/dvDe1Z445RDX3V/kb/1LLRIlkjG6tVYYQe5mQ8hP9schzNCVUr5co95mrgAAAA==
X-Change-ID: 20250127-faq-no-systemd-61bef48e49ea
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2245;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6mfcamDwJxEWqCpRdZVtIdZOfT4LyWF/dIqlnsXp3bo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnnJ2kwgE4TgCX7OKCjOZGO3mux5xhmC+lKWuGx
 hJONuO3T9GJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ5ydpAAKCRDRgEFAKaOo
 NrI/D/46QRrzuJH0N1JA4YerUWDQUpyMqKQ5oPPRj2EhFKCvGDTPQ/kdkxAsgrB76JahJS+xGVO
 uVZ5nUjiHuSfqZ8I1TSyx5xhvbRKWcCsqux6gZic9FocevMVMnaIiqoO2/lbsi1fJ8bLFUmyw5Y
 Ym8/6urwFhWXh+HuvOjW04HHHfD9wuz8u4y/7IPeopR3Ni5dYQbS1qgvg6YZnbNQ9aC/12tMXXO
 IVQRduT2MS66+qCQzMeJgQd/zssW+bce4Fc2HVimc+QtDP9DjRl0xZbUzkN7iCA1rPQJwb/qoK2
 qpq6d4Oh2vKY+ghaKxIwb2TY58vy4R235grdR7A6bziv3/dUY7msctRcFlFUqYVkqPQfwGsxG/y
 fJU38VDq3ujcaL1GhspHrkoZ01iUBi4IPtKaQj7LfKO0xr2N4//ORK9Mpbt2EqcIsDBgIkQGReQ
 tPAV9EE/gUM6bwZNKLrd5occ8buuaPqhUGcl3Y4Ed+c2GxkIlM/4LW59f6nPRD9xdcQGg9rN/QU
 zs1NvDZ6yBrtg1dqLpjUqdTIKkAx2FRWvZcLuCXz73/8SZSBcUeGTStWKWCkpAiuJmF6OBTEKmI
 xge7SVxk2rYsTfVdqA2OwC2wJzPm/ABTq+STphyOfUMVej2sPcj/O2ddao+b6nctlWJi28PHnCw
 l4NKi0UMBQg5vrg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhiefhhfehudetffehhfeuudekkefhhfetjedvfedttdefhfekvdetteduvefhueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhshihsthgvmhgurdhiohdpmhhushhlqdhlihgstgdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgur
 ghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 09:53:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6221

Originally written by Richard Purdie, but formatted in rst syntax and
slight rephrasing.

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Suggested by Quentin Schulz (thanks!): mention that poky-altcfg is a distro
- Link to v1: https://lore.kernel.org/r/20250127-faq-no-systemd-v1-1-e9945bb090ef@bootlin.com
---
 documentation/ref-manual/faq.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 9e3418e10..7dd37c7a5 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -45,6 +45,28 @@ See :yocto_wiki:`Products that use the Yocto Project
 Wiki. Don't hesitate to contribute to this page if you know other such
 products.
 
+Why isn't systemd the default init system for OpenEmbedded-Core/Yocto Project or in Poky?
+-----------------------------------------------------------------------------------------
+
+`systemd <https://systemd.io/>`__ is a desktop Linux init system with a specific
+focus that is not entirely aligned with a customisable "embedded" build
+system/environment.
+
+It understandably mandates certain layouts and configurations which may
+or may not align with what the objectives and direction :term:`OpenEmbedded-Core
+(OE-Core)` or Yocto Project want to take. It doesn't support all of our targets.
+For example `musl <https://www.musl-libc.org/>`__ support in systemd is
+problematic.
+
+If it were our default, we would have to align with all their choices
+and this doesn't make sense. It is therefore a configuration option and
+available to anyone where the design goals align. But we are clear it
+is not the only way to handle init.
+
+Our automated testing includes it through the ``poky-altcfg`` :term:`DISTRO` and
+we don't really need it to be the default: it is tested, it works, and people
+can choose to use it.
+
 Building environment
 ====================
 

---
base-commit: caedbca4eced4cf5bc74aaae64e4ad2887c2fc65
change-id: 20250127-faq-no-systemd-61bef48e49ea

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>



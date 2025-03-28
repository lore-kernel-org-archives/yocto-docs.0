Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB5AC36018
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:07:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10715.1743167256144139582
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lssKMePo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB2DD42D46;
	Fri, 28 Mar 2025 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743167254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4vBWL3gACZ/LM8tXboNhHgrV0DHjEP8KL9cWeZzB4I=;
	b=lssKMePohNgD/SJRkWhUJ9rYTh9IjmDAMvbllQ5x4DJ4o+a2nAmNMWGm24NjB5lDFyOGnQ
	2a9+ahETaA1sA1zFcyN5LwhDzJIGGeSFgCpZD+HTRTaD6t9OEKobvvELnB3K9vDDQMq6Iu
	wu3NQNjp4E5oPKRLCKP0fmxwJX5M8m6t0y8uergCA5S4QKQaOb8dfHGHL58vylkvSkVlgX
	f9gIcF1mhmZiBvdkXxXvE82oPs/824DQ3D8UlOseollRRpXb2TOkV81/YGPL3NThwrMSz3
	/IKHKJAhZH90y70+OQlwVBQLm+d8dxPZkVZGF3MhEv98Cp9XZwajXFvY25T5EA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Mar 2025 14:07:06 +0100
Subject: [PATCH 03/11] migration-guides/release-notes-5.2.rst: add LICENSE
 recipe changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-release-note-5-2-updates-2-v1-3-c913513e9140@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3445;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EZ3pax1A831iEzxWGkSLNG+6PjHWiBNuM8452MowLno=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5p8UVv6rep1ZiRO9bNXAKbe4ZZhRjMyjUvhZB
 rR/EvwDk6CJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+afFAAKCRDRgEFAKaOo
 NvSeEACRtRZ/wqN2EaTfXyRQt9SSqHjaPdd1N56VTuqZGMsGz8g1IcyOQkDtF6gBEkZ/n6WQddy
 DP40Esg8Jzvh6LzCyv2SCIDWXr82azhCvx5biWE+DJz04T9Wx2taG0A3v0QGi7yud6xsZI+QVVL
 ZtADoejO/TvJ6s4o1ULuD76f4rPHnG96Unz1EaSmwr1ntVZfg7JMKJOf1E7y4jkmUgzKZxgtoFB
 /g3+IFYBpC+9t6Zpjr9srZ/Y0lPG5wfzbDcYQndGyt5VXBIbvFTwFnnT+y65Y+CgwOg+8ZCKLU1
 xPmktzFUkNBOYzLBT3zxDmJKwTLWnLPC4RThFccejUs79TMe/Ptfu3Aqf2/Bp9fwh8QAFnUM22W
 3txMEDWzN0arwZvchKVEL6VMoGt1eab6aeUSC2dLHazfWLHNco9rcKjzlstVsAn7z5DYp1x98k3
 fOp4Ke2dKvr/mdfkf3TdBfqCckbltXb/9y9lX4WUkpLJ+cgpsp0Ag372AJ57NANTcvt72XjBuo0
 uDkSYlk5wXXbyIRONScpmtSphJc2f9CKnSdKg9ttNXDGscXOpBJ/b68w0mfznefpXaIytopKSKC
 k/2ipRgV7JqL7BuLNsVsA/2nU3G/EsQtPsxqTJ9E7tIzgs2sbd9YoVNMXKGiwbX1fomNHrnbsHd
 Vq3L3/JC8BBQZsw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6657

Document LICENSE changes between the 5.1 and 5.2 release.
Extracted for commits message containing the "License-Update:" field in
Poky, between tag yocto-5.1 and walnascar.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-5.2.rst         | 58 +++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 081100870..1e05631d9 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -704,7 +704,63 @@ Known Issues in |yocto-ver|
 Recipe License changes in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The following corrections have been made to the :term:`LICENSE` values set by recipes:
+The following changes have been made to the :term:`LICENSE` values set by recipes:
+
+.. list-table::
+   :widths: 20 40 40
+   :header-rows: 1
+
+   * - Recipe
+     - Previous value
+     - New value
+   * - ``babeltrace2``
+     - ``MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause``
+     - ``MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0``
+   * - ``busybox``
+     - ``GPL-2.0-only & bzip2-1.0.4``
+     - ``GPL-2.0-only & bzip2-1.0.6``
+   * - ``dbus-glib``
+     - ``AFL-2.1 | GPL-2.0-or-later``
+     - ``(AFL-2.1 & LGPL-2.0-or-later & MIT) | (GPL-2.0-or-later & LGPL-2.0-or-later & MIT)``
+   * - ``diffstat``
+     - ``MIT``
+     - ``X11``
+   * - ``docbook-xsl-stylesheets``
+     - ``XSL``
+     - ``DocBook-XML``
+   * - ``font-util``
+     - ``Unicode-TOU & BSD-4-Clause & BSD-2-Clause``
+     - ``Unicode-TOU & MIT & X11 & BSD-2-Clause``
+   * - ``json-glib``
+     - ``LGPL-2.1-only``
+     - ``LGPL-2.1-or-later``
+   * - ``libbsd``
+     - ``BSD-3-Clause & BSD-4-Clause & ISC & PD``
+     - ``BSD-3-Clause & ISC & PD``
+   * - ``libxfont2``
+     - ``MIT & MIT & BSD-4-Clause & BSD-2-Clause``
+     - ``MIT & MIT & BSD-4-Clause-UC & BSD-2-Clause``
+   * - ``libxkbcommon``
+     - ``MIT & MIT``
+     - ``MIT & MIT-open-group & HPND & HPND-sell-variant & X11``
+   * - ``man-pages``
+     - ``GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT``
+     - ``GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT``
+   * - ``ppp``
+     - ``BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD & MIT``
+     - ``BSD-2-Clause & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD & MIT``
+   * - ``tcf-agent``
+     - ``EPL-1.0 | EDL-1.0``
+     - ``EPL-1.0 | BSD-3-Clause``
+   * - ``unfs3``
+     - ``unfs3``
+     - ``BSD-3-Clause``
+   * - ``usbutils``
+     - ``GPL-2.0-or-later & (GPL-2.0-only | GPL-3.0-only)``
+     - ``GPL-2.0-or-later & (GPL-2.0-only | GPL-3.0-only) & CC0-1.0 & LGPL-2.1-or-later & MIT``
+   * - ``util-linux``
+     - ``GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT``
+     - ``GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT``
 
 Security Fixes in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
2.47.0



Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C675BD1170E
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 16:14:25 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1087.1764692062362974274
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 08:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NNpbpSgP;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1EF80C16A20
	for <docs@lists.yoctoproject.org>; Tue,  2 Dec 2025 16:13:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45873606D6
	for <docs@lists.yoctoproject.org>; Tue,  2 Dec 2025 16:14:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66D5211919CF5;
	Tue,  2 Dec 2025 17:14:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764692059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=vOYpn/jLfHb0wJ1pwZ92xWJKx71K8cSrLvT71QbdGc0=;
	b=NNpbpSgP00Fyo+6YEHKmQXc+DyQVX8DBDQL4+CLWihYB2Jjlo3brFDT+Cx3Ms2dL25YbJ2
	sqRDmp3j+ncw5o1JKLlop3DHO2yIcxepE+dd395/zmjhBqSqb3duZmOFHVwNa/Lbwa23ll
	CayombbCdYSVZDxfnbTe1Mrlzn1XyYi/ij8IuMMbRoSX8K3anUV2C6m7uOT2+m2rjV9YJm
	DOYEjoPCVgsxboTicP8+F79LG90ezQffYuSzwq6jGlWj2jt/gnrT/bdIqMjHQJ3LkqJ/YF
	abGMbQ88TVMtuY+xKVIfniHg41kBney7xVz+SBA+/r3QLru71rMGsDpqe8mpHQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/4] Whinlatter release updates
Date: Tue, 02 Dec 2025 17:14:12 +0100
Message-Id: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQQL2kC/yXMwQpAQBSF4VfRXZtiagqvIosxc3AlNBcpeXeDz
 alvcf6LBIEhVCUXBRwsvMwReZqQG+zcQ7GPJp1pk8dRAROsQO2rtxtEdaX2BXxhWu0ovtaAjs+
 vWDe/ZW9HuO3N0H0/mAqxjXMAAAA=
X-Change-ID: 20251202-release-updates-f92d8ed85b2c
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1048;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Mc3NvtfPfaz2dsGBWlxRSutGip7W+md6u7KCAUor7tc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpLxBauQrtyqRzwzjA63e54Gxd93Sl5RcxMuhDL
 a7sNbmFufuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaS8QWgAKCRDRgEFAKaOo
 NkVND/9ErB9i8MsDEbJq3QeBwVb3Tg65KPk9B/Sn9I85rVAplnLq01/Y2yk8N+ubrj7EqZ8c1wQ
 5iWZYx85boO7RFIx7YnKOal98qA0g5/hfmEN7xJRXuCqvTlRY2/hcP377Tn4cuREIMeB/4BTt9V
 oBqLaTtnEwtcJDcOTih/roO6jA8kAJ0/eOlI9uBLbuXje2cbv/n/q/6UT+VLZV0TZwR52uZTRdf
 FMnNGuQwKBNIsRQhDa8ZKJTS2kGV14lc6dx627nz9wXr1ymlGoVk8im8VqEp6mMk0bRAk55SjXu
 BNvwk8ROzwSL0UFD5iw63++FfS5is+SPytxrQsbsd4pDaZQ7Y7JfSgxt17ib8hmpWzXEXYf8QfB
 TjQQ2MIIYiGtAsQ4yvRt4L8vGD0jkp58RGP8AY92VGVGGyiHR6rVhGqTlCTt0mo5Tkt60KsBzIK
 K5gsK0ubr41CWpzh9Tq10JjtQvHT5WlUuMdYA6k/nq+ICAAenZONJYQ7AUIoqyWaKDfl+uk179I
 kTgxRhhPK5njuGMiWhJMJNyBEvFNhffN72/UxZa9cS46Zd8qfrZl1IO6aCmXcAUHespCoICn8zs
 b1IcWtOLRYvm0xSlDbfnsJ1d/k4oOdlhB0nf7E7PBnAltlezHgm68HL4q463WOgXcO9xbNHF3vS
 xfaSHcHE9iBNfQg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Dec 2025 16:14:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8185

Regarding which patch to merge/backport:

- The first patch can be merged and backported to active branches.

- The second patch will be backported to the whinlatter branch once the
  release is out.

- The third patch should be applied to master only when the release is
  out, as it depends on the tags being created.

- The fourth patch can be merged.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (4):
      ref-manual/svg/releases.svg: mark styhead and walnascar EOL
      ref-manual/svg/releases.svg: mark whinlatter as current release
      set_versions.py: add wrynose as devbranch
      poky.yaml.in: split automatic and manually replaced macros

 documentation/poky.yaml.in                | 11 +++++++++++
 documentation/ref-manual/svg/releases.svg |  8 ++++----
 documentation/set_versions.py             |  8 +++++---
 3 files changed, 20 insertions(+), 7 deletions(-)
---
base-commit: 9d394db4f88b66500e4d5a2a518d25f08a0c9472
change-id: 20251202-release-updates-f92d8ed85b2c



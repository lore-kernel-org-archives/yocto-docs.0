Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C429BCF6A83
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 08:28:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2314.1767860908198444063
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 00:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JhzcUepw;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1D5001A26FB
	for <docs@lists.yoctoproject.org>; Thu,  8 Jan 2026 08:28:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC4CE606B6
	for <docs@lists.yoctoproject.org>; Thu,  8 Jan 2026 08:28:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 787CB103C87DC;
	Thu,  8 Jan 2026 09:28:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767860905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=NlUP3g5WlV4c8Mm+tVMK35X9fk+YP0UYcgsUnjv+O7A=;
	b=JhzcUepwvYU55bQIDkzL+gHcHEMZC66qCOL0opvk+bnbc0VY/n81V5u/RVzKFVKaduMVE6
	gl/z7ab8mM72bXHKqBCf//vxZT+DpkPMyijn0qmRSTrwsivsciOXaHpNNwqHUtCTmMz0Uu
	LhnahiEJUnWr37EJDEJTcIudRONcQvgXOBfJ34mIaRM8nLtuADu1o1YQyTPkJ8GNKKiQ2k
	An1F0D2R5eJWOS7aP7FeFfKASfoYznwET/hTO9cWf9J6Pl5shnhd2d5+e2uUvO5w4VQ8eW
	ysDdWlRRIt25mZD1EZrcp1TTLvi4z6tbpFqjtfVRf3lIE8jMzLsmYLDy2VNCUg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 08 Jan 2026 09:28:07 +0100
Subject: [PATCH] set_versions.py: remove missing_tags array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-update-missing-tags-v1-1-ff1986f73c73@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJdqX2kC/x3MMQqAMAxA0atIZgM1KEWvIg7VxprBKo2KIN7d4
 viG/x9QTsIKXfFA4ktUtphRlQVMi4uBUXw2kKG6MtTiuXt3MK6iKjHg4YIiWTtS08yj8x5yuSe
 e5f6v/fC+Hy2HVhBlAAAA
X-Change-ID: 20241029-update-missing-tags-277b255fbadd
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2656;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=sIslYnM7hjxEmJcBA264D6psnKkFq2fX9u1jzBdtE4k=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpX2qoPwfJLizC7u/ewDQ7kR4wwCh8PSDN+mhmD
 ZwuN5B9X++JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaV9qqAAKCRDRgEFAKaOo
 NsYoD/42lq268WH22fQm/QMbi8p2eLg2UZZreTecV+LJEqJgpQYGGRl9pcCwvBNmEaJTZAauFfX
 WEnrQBcjUWVFhaXI2jWf8n32kS8oSScksRb9xjN4pqTYGdcSsfYwNVsn9bX+sGrVok1xMn/Dk0V
 YkV3vZ/4iLA0DeOUjSQxVhC8s85GW05x5Lw9jFpI6a+Rc2omfO8MN40rp0aby8DshA/jOz1dQvM
 jEAWKKxRuqRjj/xcvFDS4SNMRSUs5SdbRNFselxrj0k2ov+TDsja/aJTec0yF5qzy/wp/kEFOZB
 B61iuJQn3Wfzl1qlSICjirR0x4/1GPGC0Z3oMpjsqN1H0I18Xq1O1sZStJ205Xwk6DrL/hFgtZk
 LHIhbwefi+G+MzNAEgVNIysEG2SyNqjyQo0QcoszooC1GeQwZu/h7Er3jJwlJ4hka2xTlreKvT/
 8khksfafe83XaMTK845wscGRjGGdisZtokxm8Wa6ZvHlS2Iip1A0P8PvOJP5dCS9UGgShu05vfc
 h+jhpVMSWJarV3Tofdmovn8CYuKhYs3fAEAkK2cZtNTV9frkYICmWe1DME/eVSMVNObgnAdc1Dh
 tnEDPlp3IZaWI9m+cstk87l0dSj5q/3B5Xr0eQKenEog1MLadsSfOIL0xFjemHrhQKkn/2lQeTH
 VXFi4CBa/SUhBLw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Jan 2026 08:28:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8419

As we now have tagged the documentation with all the missing tags, we
can remove the missing_tags array and also the sorting algorithm, since
git already sorts them.

One thing that should be noted: the yocto-1.4.5 docs page will be
removed after this. In fact, 1.4.5 was never released for Poky[1], so
there is no need to publish documentation for it.

[1]: https://lists.yoctoproject.org/g/yocto/topic/status_of_dylan_9_0_4/61295742

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 30 +-----------------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 91aa2bdf2..5123019da 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -263,35 +263,7 @@ print("switchers.js generated from switchers.js.in")
 
 # generate releases.rst
 
-# list missing tags in yocto-docs
-missing_tags = [
-        'yocto-0.9',
-        'yocto-1.0', 'yocto-1.0.1',
-        'yocto-1.1', 'yocto-1.1.1',
-        'yocto-1.2',
-        'yocto-1.4.4', 'yocto-1.4.5',
-        'yocto-1.5', 'yocto-1.5.2', 'yocto-1.5.3', 'yocto-1.5.4',
-        'yocto-1.6', 'yocto-1.6.1', 'yocto-1.6.2',
-        'yocto-1.7', 'yocto-1.7.1',
-        'yocto-1.9',
-        'yocto-2.5.3',
-        'yocto-3.1', 'yocto-3.1.1', 'yocto-3.1.2', 'yocto-3.1.3',
-        ]
-
-semver = re.compile(r'yocto-(\d+)\.(\d+)(?:\.)?(\d*)')
-
-# git is able to properly order semver versions but not python
-# instead of adding a dependency on semver module, let's convert the version
-# into a decimal number, e.g. 11.23.1 will be 112301 and 1.5 will be 010500 so
-# it can be used as a key for the sorting algorithm.
-# This can be removed once all the old tags are re-created.
-def tag_to_semver_like(v):
-    v_semver = semver.search(v)
-    v_maj, v_min, v_patch = v_semver.groups('0')
-    return int("{:0>2}{:0>2}{:0>2}".format(v_maj, v_min, v_patch), 10)
-
-yocto_tags = subprocess.run(["git", "tag", "--list", "--sort=version:refname", "yocto-*"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout
-yocto_tags = sorted(yocto_tags.split() + missing_tags, key=tag_to_semver_like)
+yocto_tags = subprocess.run(["git", "tag", "--list", "--sort=version:refname", "yocto-*"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout.split()
 tags = [tag[6:] for tag in yocto_tags]
 
 with open('releases.rst', 'w') as f:

---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20241029-update-missing-tags-277b255fbadd



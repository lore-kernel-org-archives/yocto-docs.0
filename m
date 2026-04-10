Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B57F459F3
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157871.1775832226504946383
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AfuIp6wS;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6F700C5C1A6
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97A8660404
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5A7D10450026;
	Fri, 10 Apr 2026 16:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YAANWQvRifTM9egpgcLo4IqpMU/HJp7s9E6AlEgml2w=;
	b=AfuIp6wSbEwBmDIOY+RpwNwo8q319vRdQ8WUKwoHNHbcXWruJsymzG+3+X+GJHptALzE/K
	o7aP80GpfFTVKCdX6wIvqD1NFbsVAmQYNKb9PZL1x4CdcbAxEg5bHlTmeHSoYw+s5d52+5
	uJHexVQ9j/ugODhexHTNxES4WONrQjIcp14ibUy2Is81cQfP/zp8TrOtMUEt+V8/ozfVqG
	tMOcYaDYUExKTKpVinEDUocEewY6zsfviV6IGtb0H00LzJHSXsacRdidF7JuYiHZkneIM3
	PbeBymSOqLVGU6WJj83IsegzvRnV4aj85LuJbRArkiqB8cxBS3jKo85nctacKw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:25 +0200
Subject: [PATCH 01/18] conf.py: define new *_path roles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-1-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=oKWZHEFZZjoQTF/f/jo2iN6Z20eS11HHu5FFpon0JEo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyWpIKlZisyAl4/3dXe6LR5aGepfKn8LL0oC
 f3dwqyqGCeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMlgAKCRDRgEFAKaOo
 NkrBD/9VN8zHQ9vdCVLUQe8sN9mwity9N76TuaCZsgXobdPH6CI1VmUxz4y9tnXlYowP2OzTjfn
 D0D6ummb/uAKvBqvOOjB/1o1e9+d5iw+H1yk28NHZdMm0IT1vRHTK5ILRpmWn4JkE1dPzZJZ36+
 fJCO/5ncW7ClSxkndFUUhNU+57/DBPDNxOmZ5x7q+iekUzWAKUBK7vGVeyxPw9Jc8+OHSdPXaDm
 AkhXp6B0bfNffxoBW5CsB9SzA7l+6TwsaC8pdOizwfHY+exzXl5q6B7gXPqmHrpkDSGJG7qB8Et
 bqzm2HK9m0LMvdJ2XbnT7hmcGrFWXWCrtZ/Vbj/eZung3xZla+ULULlqA6rDBOUxgEfqG71ci4m
 fib/SqyR1h2l6OLLtZPG+lMd7krbm2SwSVfM7efvf1qurfARYFe4mBQuD17BlsBK595+CjJISTg
 ZnCjEntHMsN+59z+oi0em2KoZ1LUsIsdYhPRW2sNoDj+DkFIxdXlgc6AaVcf8S1Kx8s8qfMAPuR
 pyZwSX/uY8A5fwjffigmI6xbn8IXz3GoV5hngwnZTo2GomehIgF8ARHD4YTcDeq+rQ1qbdT3Nbx
 X2ekt3RFr4NNotFix60dYlXMj5Mz1J3iazpCQr+HID4l0u8rmEPSaxph29ujFKZ9kkjSpZxuqVm
 dtguxLPA1Nby+bQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9232

Defines three new bitbake_path, meta_yocto_path, and oecore_path roles
that can be used to quickly reference a file or directory in one of
those repositories and link to our web interface for the path, e.g.
:oecore_path:`meta/conf/bitbake.conf`.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index e5e3a8a89..58c6406f1 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -101,6 +101,7 @@ meta_yocto_git = f"{yocto_git_server}/meta-yocto"
 # external links and substitutions
 extlinks = {
     'bitbake_git': (f'{bitbake_git}%s', None),
+    'bitbake_path': (f'{bitbake_git}/tree/%s', '%s'),
     'bitbake_rev': (f'{bitbake_git}/commit/?id=%s', '%.7s'),
     'cve_mitre': ('https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-%s', 'CVE-%s'),
     'cve_nist': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
@@ -112,11 +113,13 @@ extlinks = {
     'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
     'yocto_docs': ('https://docs.yoctoproject.org%s', None),
     'yocto_git': (f'{yocto_git_server}%s', None),
+    'meta_yocto_path': (f'{meta_yocto_git}/tree/%s', '%s'),
     'meta_yocto_rev': (f'{meta_yocto_git}/commit/?id=%s', '%.7s'),
     'yocto_sstate': ('http://sstate.yoctoproject.org%s', None),
     'oe_home': ('https://www.openembedded.org%s', None),
     'oe_lists': ('https://lists.openembedded.org%s', None),
     'oe_git': (f'{oe_git_server}%s', None),
+    'oecore_path': (f'{oecore_git}/tree/%s', '%s'),
     'oecore_rev': (f'{oecore_git}/commit/?id=%s', '%.7s'),
     'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
     'oe_layerindex': ('https://layers.openembedded.org%s', None),

-- 
2.53.0



Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696F2FC72A5
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 12:15:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18176.1776687327583862244
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 05:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=m5qcJBEA;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B165DC5C999
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:16:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D60695FFA5
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:15:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CE2010460869;
	Mon, 20 Apr 2026 14:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776687325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rJpkbc5T0xYcDbW4NeA0HWE6bsDB0D574DU4OD/+dUA=;
	b=m5qcJBEAbLH8QK5uzkgpQNxqm3OlNWI8WftBx6rH0yTZ5jUH5IB7LUZ9HChgNwIemWL6me
	jmEghlD9X7Kh/mfVzKV0tFTWYlCkfKj8SUa6Yew/jHQMiqkDyVhWCgAXDPBwMDt7po+KFz
	sZmt7OeMnr+19V51NCIkdFxZuwuCGRQfXQVGSsHwMti++DOj0n1lXcslA9td6E2r57G1qo
	40yzMBgDIfO7MsKgd8bWG5Q27EafoOHni+OpgGWVU5Bbege9wnP4tJjSLH4sxOcJCnPFoT
	VJmzIOMReG1e/OoU+zi920BEN92tMSq+aDttQ5qaEu0feVve4kL24KZr81OSHw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 20 Apr 2026 14:15:17 +0200
Subject: [PATCH v3 2/2] ref-manual/system-requirements.rst: instruct to
 install a buildtools tarball
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-python3-websockets-requirement-v3-2-22bfa3f411cc@bootlin.com>
References: <20260420-python3-websockets-requirement-v3-0-22bfa3f411cc@bootlin.com>
In-Reply-To: <20260420-python3-websockets-requirement-v3-0-22bfa3f411cc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=j/5nrzfO34fCGesDK+bGiFh2iy83XqrQjLM3HG90+lM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp5hjb1OMl9DK9U4wgaZNrpmdLYZ5vlsoUl+y6L
 3XjPnmhKBSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaeYY2wAKCRDRgEFAKaOo
 Nu0hD/oCv5oKNhiUafAWtxBnEir0gi6qmn767GAC5iXFnlf5IAYPp2Edm2lFGXhNHa5/w3L2YCq
 UYaOAKbxBLEjL3/5D7UYgzWkqcVXo6cSZziSDSwVcAE1M+Erj+7M+ZGp3hg/fCcqxIVFFpMEude
 Zk4tBcWceORu6MrBltRGHHhrIksNCwWVZTs/XJa8SqafN9bRhkXkH6UE5NiRQdkAqVKC/1eZ887
 7RNE3rwXs7qUbY3xmlToJ1ETP0e/UtKiyHB6GHJiou+VBtlKdaurNUgVZx02BoDEi3zmb+mTB4W
 VgzB2drHSQzmt5bev0j1fgdA+r3/a2/1yO1XNrCkTdZziQ52GOvxSsEraLJQfeOLTix0S0K1dhH
 DHBbuADArB9Kya1p5wBwTeIetrhxV/pfny7LHh330ttsqccdogcAm+vQSb1PmDNvPHVUAByTZir
 LMnTEw362rD519pkFKusCnwUOZ9b6nV6uHoooL8MzsfbK2GXtyhtUbzUgT9K4904Dr03V+AdQ0f
 4xknRphQQ4fH21yXlq1Tyy3zTbDZStt4Oy4jw0CaoUzX/Pst79tjQDcqykWAQ0YiJ7ZiEVORSmU
 zLAvxujFHx+x3zEKAMLjsayfh1g9raXBg88eeqRmldTH3Tup4/8cJwUFY+P7d3fbnDVeaSXu96U
 afkkv0JMtSiqd2Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:15:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9293

I noticed that openSUSE Leap 15.6 provide Python 3.6, which is not
supported by BitBake (which requires Python >3.9). Instruct to use a
buildtools tarball, which is how this is done on the Autobuilder.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index dba11a135..05c852043 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -246,6 +246,11 @@ with a supported openSUSE Leap 15.6 distribution:
 .. literalinclude:: ../tools/host_packages_scripts/opensuse_essential_15.6.sh
    :language: shell
 
+Additionally, openSUSE Leap 15.6 requires a :term:`buildtools` tarball to be
+installed and set up, as this distribution provides a version of Python that is
+too old for :term:`BitBake`. Follow the :ref:`system-requirements-buildtools`
+section below for more information.
+
 Here are the packages needed to build Project documentation manuals:
 
 .. literalinclude:: ../tools/host_packages_scripts/opensuse_docs.sh

-- 
2.53.0



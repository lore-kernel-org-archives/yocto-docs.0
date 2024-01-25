Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150BEC47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 16:41:36 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.23052.1706200888259783110
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jan 2024 08:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=Q4vmJGR9;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 31015240103
	for <docs@lists.yoctoproject.org>; Thu, 25 Jan 2024 17:41:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1706200886; bh=6FO1DFb0KjYIxz8fc0TjQMAiiIbGGiRTQfCdtgSvpmM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Q4vmJGR90fPWq11XfZxQLCZ0snYG0+c4geaZhNLQoIwjNpbMgWJnD6yFY42C6LR44
	 Msvb0BozfuYohdo+7+cADVPDFO3ZMMQrQRRgSPVmquKXO86vHvGY+OOu8NTwNOOfHk
	 jJWOXH3JhNOnT35cGblOr4r5pPn+ozTaAMRa9m/b/LUD99y2/81hvo5xayEnbzK/Nl
	 COAOsjbFhmuW8NIb+j56xqCzeB7J/29Q0rbj3rwx27v1UB+TUEeL241aqCjaM03Ivd
	 +w72u2x3t6YkFOh6ehaPepflnSt2AJ8GkVcrT1f6lMnEH49s3VSIBIEJEhyFMlsFxo
	 Bfq2kvn1WuZAw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TLRRT30r5z9rxB;
	Thu, 25 Jan 2024 17:41:24 +0100 (CET)
From: simone.p.weiss@posteo.com
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] bsp-guide: correct formfactor recipe name
Date: Thu, 25 Jan 2024 16:41:18 +0000
Message-Id: <20240125164118.6943-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jan 2024 16:41:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4790

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

This recipe was renamed some time ago. Update the name here as well for
consistency.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 documentation/bsp-guide/bsp.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bs=
p.rst
index f92b1177b..29c69a930 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -336,7 +336,7 @@ the :yocto_git:`Source Repositories <>`:
    meta-raspberrypi/recipes-bsp/formfactor/formfactor
    meta-raspberrypi/recipes-bsp/formfactor/formfactor/raspberrypi
    meta-raspberrypi/recipes-bsp/formfactor/formfactor/raspberrypi/machco=
nfig
-   meta-raspberrypi/recipes-bsp/formfactor/formfactor_0.0.bbappend
+   meta-raspberrypi/recipes-bsp/formfactor/formfactor_%.bbappend
    meta-raspberrypi/recipes-bsp/rpi-u-boot-src
    meta-raspberrypi/recipes-bsp/rpi-u-boot-src/files
    meta-raspberrypi/recipes-bsp/rpi-u-boot-src/files/boot.cmd.in
@@ -620,7 +620,7 @@ You can find these files in the BSP Layer at::
=20
 This optional directory contains miscellaneous recipe files for the BSP.
 Most notably would be the formfactor files. For example, in the
-Raspberry Pi BSP, there is the ``formfactor_0.0.bbappend`` file, which
+Raspberry Pi BSP, there is the ``formfactor_%.bbappend`` file, which
 is an append file used to augment the recipe that starts the build.
 Furthermore, there are machine-specific settings used during the build
 that are defined by the ``machconfig`` file further down in the
--=20
2.39.2



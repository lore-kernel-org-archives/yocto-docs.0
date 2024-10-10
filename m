Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9606CF11EE
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:11:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.41663.1728562260212186652
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oyh//ErL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4C16FF80D;
	Thu, 10 Oct 2024 12:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TvrHEU9HZXONsoXuU1C4MCQlLga7HTfIrOyanZYMjP8=;
	b=oyh//ErLArMtyD62UZUyqSuBLuyonXL6bTulEveSejvk5ri5mlmFtEhLyTKFL6X24D3C5l
	yFBF7h26TYlHZV6R1mcadhwPypHcvT2GYuYz5ZzDoslEO3XQ0K6iXCQg1Agca+F2jgZLE/
	SP9w+YB2P3iUjwAhzCUffYNnPcZM5IHhsBZ5UfKkmsjzHnn4UG/5eSHYZm4MABEZ02ks7P
	Kt9b/axuEvTHpb+Uihg4NFnOjl6joBEzsPe/+6sJadQa+hF4IYbzdDqt3Ab0R0tCu4mfXk
	hkrRuhEHjYgwELq1e/BnCRStjCsCC5i+9VebmF+0LVG/0jpep/biNvI9I1Y2XA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:35 +0200
Subject: [PATCH v3 10/16] ref-manual: drop TCLIBCAPPEND variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-10-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=soMQJZn9AOx6pRyAuO8hHCOI9lchxTswT58jAvj0utQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8ROZVPyphyUYbLhmflQO0RGW+TS2B2/u1KRj
 pJsvwPc+VyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETgAKCRDRgEFAKaOo
 NoKOD/wLhr1WxzyPWB0RXJQduDDT53RnLVNH+IU03ROwQwQxtoCldfArGdJsSFD8gq52a2p/Fou
 0UGo+KCllbSANpHEn7YetfwYPPA7uiecL0+y39aBYyqxRGj08sru0xxGFr1TRUqIkzGtRylHMx6
 OqsdznoyCofUeWTEOxvES6b7+4AZoGz3f/MF/8HVGl7NMI++tSjKM7LJR9/ksF0mrmblbWVH3tk
 ctfkrfIk9WDA9UwwRHVVLL4IOfPoCWo5IpCTP2laUX2s0ei9kWY1myrI0RoSxAoVU4FHnRkDVwO
 4gfmXIgSic6fiDW54ycCCtleBZdkD3MgNBa853SMmHQQ0v+KsXgJePj3LA947sg1EFSkoeglGzt
 B9XJ7McjmVyFTVBgR2nYyQspUyJuPsEf39aWYrT8PFNtX3Csr0/s4Lye3RFY2hqtgvXPR1yN5Av
 XXvd5viwsPFXqRqJvQq3U8VdaZLUD8TX3DawKNJLY3YxccgfXl4r7mngFie7+bHyW5n66Coxe+O
 rT+rWXFas4dq+CkwZc+I/slbP3cF9sb5/Lu0KRV78Cr4JyLwOR48Rk9SPugdUdEX0jD9QyRxtmG
 ncLDUn6SDhDi6a55wjtyi0HxqdMlv+1T9B5U/urqmb6L5neBaShoh89AMm6lVH9ZAQpKNx20Jgq
 x9CkKA0X/sq5XKw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5462

No longer required as TMPDIR can be shared for multiple lib providers
nowadays.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 206e75833..5f4ef0251 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9031,19 +9031,6 @@ system and gives an overview of their function and contents.
 
       You can select "glibc", "musl", "newlib", or "baremetal".
 
-   :term:`TCLIBCAPPEND`
-      Specifies a suffix to be appended onto the :term:`TMPDIR` value. The
-      suffix identifies the ``libc`` variant for building. When you are
-      building for multiple variants with the same :term:`Build Directory`,
-      this mechanism ensures that output for different ``libc`` variants is
-      kept separate to avoid potential conflicts.
-
-      In the ``defaultsetup.conf`` file, the default value of
-      :term:`TCLIBCAPPEND` is "-${TCLIBC}". However, distros such as poky,
-      which normally only support one ``libc`` variant, set
-      :term:`TCLIBCAPPEND` to "" in their distro configuration file resulting
-      in no suffix being applied.
-
    :term:`TCMODE`
       Specifies the toolchain selector. :term:`TCMODE` controls the
       characteristics of the generated packages and images by telling the

-- 
2.46.0



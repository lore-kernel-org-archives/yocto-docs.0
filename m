Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DFBD116F9
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 09:55:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18456.1764582935190023827
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 01:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vPkNpQNM;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 77238C17B4A
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 09:55:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A948606BB
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 09:55:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A0E711911998;
	Mon,  1 Dec 2025 10:55:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764582933; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TB7qhZIDbt3HPYktpEiSggzYANtsNr44baMuvLahaUQ=;
	b=vPkNpQNM7i3K80AeXId869q/7snBmT9OXCTN4GcQMi7S/zbN6peVRA1palIFTuUkZgDmLa
	NMgU9AoWmsBGmu9BTMQ+fLWMZIY12cZfh/dXEgE1GxwvHT9ysGPMwcttdznAicuFvnpnws
	imcMa9nY5PoReyh3KM/d5dJAwaszI9aPLZuMyWHEkKW6Ep3ab7aRHQeXUxhcDCmXenmjbV
	TtXI7WPpH4uPo1WwXj0+K3g5/+FbAMAAgFkEq3w1eOzjRzVz7tjXRBA3Kpnk2s2xF0/nI/
	2bmRKQjgnzYv1sE5/qq1VplzbO9wQvEO8hFNB/028kQ76d4POkn3Ro4B1OBqvw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 01 Dec 2025 10:55:21 +0100
Subject: [PATCH 3/4] overview-manual/yp-intro.rst: change removed ECOSYSTEM
 to ABOUT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-fixes-v1-3-1cf15a5a4cbe@bootlin.com>
References: <20251201-fixes-v1-0-1cf15a5a4cbe@bootlin.com>
In-Reply-To: <20251201-fixes-v1-0-1cf15a5a4cbe@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=aS5EyiH3gdOfF4NcU735ULXweo9WMHEFrZtgaYuaoTg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpLWYTz/T6yfozSFHxzBxOiq3TuadKzwPDaNN1u
 PXEi1fpvBGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaS1mEwAKCRDRgEFAKaOo
 NtttD/4vs8rg8VHhF6exMldy7eu0zeePzyF+H0v0IDNO5Hon3hMpp2LWws6wPLBMLk633kpHIRr
 YQHZIBGReJuG9JfmW7jan8U6qc3QknmFqAXdyr2y5WK+L6ZnIGu1xxjJY4aC+dnMnn+0hnZcg3p
 EafwFAXPPMKJ2mtLF1O94N11GTR04JEX8Zx6mSlNotkCQWnHQuJJuQT20WNJhZioBLy6/+jt3E7
 j472O8ez3DLeHAQubxY9+6BWYn4te4DkErBtDDO24lTegL9eykWaAwsceXvDvvzHda3kyzmdRCB
 CoPhrqYax+IL2Ue6ND0hrLtSxbCdPECrgSvGdTI98nQ1nbsAm//MvMNRALyo2iZ3YEC6cMhLzxU
 pHVfxDUo3tH0sMMNWb07Ecz/O7VlaOIlYnXV2IHnizD1IWKUvtCX5j06tgwsyZFBrSTuEFznSht
 PXtleUSBeThHQKaBGVshK1KkfGZvostY8e5LKjJKSog0De925seh+hhIhob7T9xPjcF9SHw5wnG
 /E3m+KRuu3wsLkdSPB4skxUHInfPis4PJ2Fel9H0gTGs+kboqGEQLNb1SHKM3v56WtytniSC5li
 ng3YVaBTrno0P15ZaW/zscsDmESl0aC2hxPskHDmT+wG7nHqv8k3zJPeG+ZmCOrYs1+LPZzvDAi
 TB+gDItYjeN5saQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Dec 2025 09:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8182

The ABOUT tab is where the members/participants are listed now.

Reported-by: "Robert P. J. Day" <rpjday@crashcourse.ca>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/yp-intro.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 4e2eedbf5..c724a397b 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -44,7 +44,7 @@ Here are features and advantages of the Yocto Project:
    system, software, and service vendors adopt and support the Yocto
    Project in their products and services. For a look at the Yocto
    Project community and the companies involved with the Yocto Project,
-   see the "COMMUNITY" and "ECOSYSTEM" tabs on the
+   see the "COMMUNITY" and "ABOUT" tabs on the
    :yocto_home:`Yocto Project <>` home page.
 
 -  *Architecture Agnostic:* Yocto Project supports Intel, ARM, MIPS, AMD, PPC,

-- 
2.51.0



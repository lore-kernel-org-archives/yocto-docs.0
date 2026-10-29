Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11258.1793278750900389056
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2026 05:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wwRaHOWN;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 98D4CC49F43
	for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2026 13:00:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42CF560360
	for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2026 12:59:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58342103290E0;
	Thu, 29 Oct 2026 13:59:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793278744; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uDXMySxk2aJ+lodNQWxmx/4T2MUO/mSuSIOVPt5jApY=;
	b=wwRaHOWNxaWTHt5CDcIWWR8/m6kiPr/mL3wd+5JqQeA3PirrzalIZ22J9e2jmFhzH/A501
	qyzX2prmVRdrqSC9y2cx4Jnmyv3AU4VXpb6AAMRWwKkg//DDPqR34c77PLMi4S8I2cD3Ly
	d37mb1Bzw6JfWhoDro+eRilxkX2N8hY+fYppl4/pruLJtMhtP0HR8pzGEii0wGeJiJf5gV
	bp8+uZJC4xe2Wp19mPPRxZNw2fXiH3Ft1fvq/k/W/O5cDSEw33ptvXtAunYw9fJPwpdueN
	Yq4zn71I5CleMUk3v8syZ9xvz6eLRYv8H4u5XXM2XS2B9ydSHKO488fxGtowyg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Oct 2026 13:58:51 +0100
Subject: [PATCH 2/2] standards.md: update our admonitions encouraged usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-admonitions-styling-v1-2-8990714284a1@bootlin.com>
References: <20261029-admonitions-styling-v1-0-8990714284a1@bootlin.com>
In-Reply-To: <20261029-admonitions-styling-v1-0-8990714284a1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lPKoYVF555KAyEc2kPFrv1RYfuMhuRVkqxlsLxSMOtw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq40MMMjPP9+icWUFkvWFaZJ+JRWrTcKI7E1x0S
 WMZ/mjQVa+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauNDDAAKCRDRgEFAKaOo
 NuBoD/9QgoPmvHJnLcKIBeA1zStpAF6Rg1tFWrYJSpv9lrYfjawdAuABzlpLrj9USGHcWxalItf
 yOojuZMiW4rW2LXuWA/HxKRcxZW9yF14ocvurAtFKME13DLp33nhByrF8oqN7+StrCKn8piwMcB
 HmXu4lGE9ll571dgG+cTNkrVQJIO24FYTjQthsOPJ+aOEu8Li89lE5B93y1MOparK982vu+cXP+
 qEl6Fw3qhYL78Ubij2TLTB5B+aOMp4QgP4KUI1uKCRer193FJ7TSLwNq1umUjV7AFXbG10oiEww
 tKMzbx9rGnbeD33hsUSFrdUFQbtDdZ9J/dsn/s3No+BfTS6hxdqDHdxWURc/P8/GyUOXFF8d/le
 NJeswIs2qLB1C+pgC7MSoMvn1gjmWwFCdWdfuTRdqsHJy228L3fT8DyrFkfqrl3J9AOzJHC0jjU
 +/YTT2nFqbk8YN9ypn9G12Ci9UxtV0iPx/zTDCDjHf4l7Jb4XIV5e+beiw3JVDJb26Z6045JgB6
 AKVx409Pufszi3fYWBi1MhrPjmmBOaysH0GhHK8nrtGu5vCeswTXD2X5T/7KlkRo6cDgmfDmFGg
 TqWKOHnd2KQb76PQfrBAAB+ZvnYCFtIsVMFNv443lVCyr9zr2L1Q2M7+wKtl2eX3O0Bv1P/Rskl
 aflft8JDZIPep/w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2026 12:59:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10742

The previous commit sets the coloring for all Sphinx admonitions so that
they are consistent. This means we no longer need to limit the ones we
can use. Remove this limitations from the standards.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/standards.md | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/documentation/standards.md b/documentation/standards.md
index 30d48a5bb..496a1f003 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -111,8 +111,9 @@ glossary before or in the same patch it is used, so that `:term:` can be used.
 
 ### Admonitions
 
-Sphinx has predefined admonitions that can be used to highlight a bit of text or
-add a side-note to the documentation. For example:
+Sphinx has predefined [admonitions](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#directives)
+that can be used to highlight a bit of text or add a side-note to the
+documentation. For example:
 
 ```rst
 .. note::
@@ -120,10 +121,6 @@ add a side-note to the documentation. For example:
    This is a note admonition.
 ```
 
-We try to limit our usage of these admonitions to `note` and `warning`, as the
-Sphinx documentation [warns](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#directives)
-that most themes only style these two admonitions.
-
 ## ReStructured Text Syntax standards
 
 ### doc directive

-- 
2.55.0


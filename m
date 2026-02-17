Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB4AE909D5
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 16:17:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15963.1771345028432857581
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 08:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=252CnE8y;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 350571A1025
	for <docs@lists.yoctoproject.org>; Tue, 17 Feb 2026 16:17:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B479606D1;
	Tue, 17 Feb 2026 16:17:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D009B10368A76;
	Tue, 17 Feb 2026 17:17:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771345025; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=bxKz7lXTUI8BdK8TOx6BXNP2b1phHlO9bzvbquEVsis=;
	b=252CnE8y06nEZE4JQcskJkMqXE7LF9D1CVgsplzL3HMUkE1bPhkv4Iayg+esSFOwiSDe1I
	ndmxZ1BmFEMR6swV8rhxqa2+NmWJwI9F/AJZAemk5Q7KBB8lSVmTRi80DjWRQwNIFttz9U
	B+ljVaGO3RwAeDF3u0YZv65WqP5gttMHZfrobGItle3uUPGWVMxZNUTO+/mjvlOsUOhDVh
	18zwaSAIVH+T84P++CCJrfk2/Ku0JnMco7wQQBILe44vDpkmm3EX/IyQohbBBgkQKyOUIA
	7GSE0cR9KXvqOz34gQ1ZwJAmV3vAAl7GUsfDl6ll+8cmc7qVieol0BC4huiGFg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Feb 2026 17:16:53 +0100
Subject: [PATCH] tools/host_packages_scripts/tlmgr_docs_pdf.sh: install
 perl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-fix-latexpdf-target-centos-v1-1-2e2abee7a078@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QrCMAxA0V8ZeTbQlWnFXxEfaprOiHSjyWQw9
 u9WfTxwuRsoV2GFS7dB5beoTKWhP3RAj1hGRknN4J0/Od8HzLLiKxqvc8posY5sSFxsUgzkhmM
 O5IdzgjaYK7f6N7/e/tbl/mSy7xH2/QPzahTYfgAAAA==
X-Change-ID: 20260217-fix-latexpdf-target-centos-7c045f7c248d
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1oVqdHaaoj4JPLnprnoRKerSm6Au8yceJwIw1tKCmTc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBplJSAJjeTNcZYdB1ZJT2+KZHreEfr7oYX22jFk
 7rG775KpaiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZSUgAAKCRDRgEFAKaOo
 NkOuD/9ge5Ds9IYoaDiPY4zYmstGCQU0ShKNTrBqjmpErsGGhs12Q9iWKbzfuELfLy6vD49cHbK
 Id9+z28bWJp902Iw8YCyFAV3knfAdGlBQFtVsIGY76Fk7KDe7yCX+u9bk+CI7dSMQhxHLvlnNV7
 MAeUNWLCeLAViaQH9WXrFy3Myfe/wtQHHRP+XBEHmJ56f/MRUaEZzS+dXNOYtVsTQuLyKs3TeZx
 6yZsqhuel8rTessFrSy3ywSJ3wN+r998MhN3JzRKbQMfMmCoh02oaFFwa4WMmHK+az9AODf40wK
 7o1D9Lst2ilQyqG0fhJufIJ2kiYP9dmZa1jl+AaznNAvV8yEwqOEkyl63Bn4Abt9WOTwoiiXAwg
 jgZ65o39Qk4cEQjKMtZpRshD4vc6loaTDyCc5aknXMWqpjjwZ6WRoKxM8cztUKZkYhZXqUJLKT/
 epo5e8VKajOinMp9y+f+HLdjySFmzT0yxqFpxAvoGitwPC1XZt5VdzhZEOZkN4eaweNi7JTMCXq
 EzxW0yj1DH9pUGNooUVaD2C823jehcmG7ydK1sH6UiwtuLioGUe+JUiNr4EBH5H/1OP5bb3Y7SX
 nHT4FGqE8eUIkl1TTe8FSoHsLa2pRFpyUsmAwbpQg1KbaZvdtejY7gZ8J0CeSn3jQQuOoO3ywxQ
 3OBiRQ+RIZCzQUw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Feb 2026 16:17:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8944

Fix an issue reported by Quentin on IRC:

  The LaTeX files are in _build/latex.
  Run 'make' in that directory to run these through (pdf)latex
  (use `make latexpdf' here to do that automatically).
  make[1]: Entering directory '/docs/documentation/_build/latex'
  latexmk -pdf -dvi- -ps-  'theyoctoproject.tex'
  Can't locate Time/HiRes.pm in @INC (you may need to install the Time::HiRes module) (@INC contains: /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /opt/docs-build-tex-tools/tl/bin/x86_64-linux/latexmk line 97.
  BEGIN failed--compilation aborted at /opt/docs-build-tex-tools/tl/bin/x86_64-linux/latexmk line 97.
  make[1]: *** [Makefile:28: theyoctoproject.pdf] Error 2
  make[1]: Leaving directory '/docs/documentation/_build/latex'
  make: *** [Makefile:74: latexpdf] Error 2
  make: Leaving directory '/docs/documentation'

We require perl for the latexpdf target to complete successfully. Add it
to the tlmgr_docs_pdf.sh script.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Quentin, I understood why I didn't reproduce the error like you did: I
unknowingly included the essential packages to the container by mistake,
which included perl. Oops.
---
 documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
index b33ff6b25..ff4511e69 100644
--- a/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
+++ b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
@@ -1,4 +1,4 @@
-sudo dnf install -y wget
+sudo dnf install -y wget perl
 textooldir=${TEXTOOLDIR:-"./docs-build-tex-tools"}
 mkdir -p "$textooldir"/tl
 wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O "$textooldir"/install-tl-unx.tar.gz

---
base-commit: 98840d241c681c5bd4080db57b3bd9d9f0740b94
change-id: 20260217-fix-latexpdf-target-centos-7c045f7c248d



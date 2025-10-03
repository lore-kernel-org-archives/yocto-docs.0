Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B302ACCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 07:34:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.2410.1759476856177465266
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Oct 2025 00:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kO9qthqA;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5849EC00D9B
	for <docs@lists.yoctoproject.org>; Fri,  3 Oct 2025 07:33:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 580CB60683;
	Fri,  3 Oct 2025 07:34:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AB25102F1C34;
	Fri,  3 Oct 2025 09:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759476853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aFBqQYOH9XVQSOQqc9RkqAeIOwXEuVo6inNSai1wwhQ=;
	b=kO9qthqATTKiSgBwlb2BqYOQ1v4i/4AhDY5CXAfxmRVGco4McSxzGSk2wfJrtGfRKlENRI
	k0sIjU90l1z2xN/BO2U6mhrkmAO71Ah4DL0m+vX/y1RbLdS75k3J7CNt1P/m9fFzDJp9u8
	2ipZjOqzDs3eTwYlLTJFzvyxn4y3m8om95vrcx2OuJQn3FFmro9C878I12eEIgwk8HyrTC
	0cTyYfDBEBMicZoEI37ZRR2WrQwOgvNS2zGH7w5f69WND3OlIXt8F7y9ZDDDZPtrWo5sXg
	vvfg/xknR5sau9RuCz+njz2oKRhK0tSIk+jax9oGcmli5hLk7+GpFrGyulbUBw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 03 Oct 2025 09:33:25 +0200
Subject: [PATCH 2/4] docs: add util-linux-script package for Fedora 42+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-update-tested-distros-v1-2-240e2da1af5e@bootlin.com>
References: <20251003-update-tested-distros-v1-0-240e2da1af5e@bootlin.com>
In-Reply-To: <20251003-update-tested-distros-v1-0-240e2da1af5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Adrian Freihofer <adrian.freihofer@siemens.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2087;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=eWTKz12fP90TJ1kpsHuuW+JYT/J4XeO2cKzRhBfHKj4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo33xuLcM8Sd3LbjSBjjSG4pMar3SkInSLTClMh
 gLjDYxtKuCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaN98bgAKCRDRgEFAKaOo
 NgBvEAC2gt+lV38Eqd8ZYcBcR4vDmt/VXOLA8Xzw1Y1WRu2GGCt8ED2qFmEhp9D5QwmL+1z8+tn
 JcBde93y75qeTOzSBGda0GtFvJ3EiEQguexTi4B6yhYPZHBaPzGP/Xd+oXtmEshbqRXvKi8Fd5O
 HhliQ+35TPDYMAu9drNxZ+W1ZxJF2IcW7BeYqeHK31p/pGvRe6zTtRlHzK7kdTy/lSBzcJT0oh5
 p8qDQ94bbpRaF3f5rW+Nyvkc5AFhvhbObL7Il5yHJ9bIfwlkTosPUccSjvga8EmLISaewVgcSQ2
 H/MIe5A62S7D5uj1kCONDix/h5wO7BygmJi0Qn+nCJcDD4JMmL9VdFXfVn+gDpW9zIBoMkUosbd
 12TX3q4UqJP38hp2dfJjiq+t0V84tkSObfCbe1xJOq5md8kvcbYdJhXutu+GpPzIRlQd1lQfjBT
 EoRzMytPn4ks+tajzJD0dVNTvT65owmEFn+ywngo1fs8Z4a0lWOEKQBNHniV5dfm380enSHDvA6
 yOblwkxJWFW2XAMhKOOK7lGcA+Q69WP/jbVEjI4vctsAWcTzreMZE1hVe0J8AIGVQWmwWBM53+c
 By9jYAF/GGu5x52qAS5Uit/B5XKWLxM2bDKTzEYfMYziq1YRNgWgVN9so60lgDLqRuRQvI6jnQ3
 DxThmKoeIwh+0hA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Oct 2025 07:34:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7634

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Fedora 42 split the script utility from util-linux into a separate
util-linux-script package. This change adds conditional installation
of util-linux-script for Fedora 42 and later versions.
https://src.fedoraproject.org/rpms/util-linux/c/5a2471d6e5b0055cb607b30dc2e9613b312ffb74?branch=rawhide

The package is added conditionally using rpm macro evaluation to
maintain compatibility with older Fedora versions where script was
included in the base util-linux package.

Note that different distributions handle this differently - for example,
Debian provides the script utility in a separate bsdutils package
rather than in util-linux.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/tools/host_packages_scripts/fedora_essential.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/tools/host_packages_scripts/fedora_essential.sh b/documentation/tools/host_packages_scripts/fedora_essential.sh
index ea1413439..99e5d2c0b 100644
--- a/documentation/tools/host_packages_scripts/fedora_essential.sh
+++ b/documentation/tools/host_packages_scripts/fedora_essential.sh
@@ -1 +1 @@
-sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
+sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd $([ $(rpm -E %fedora) -ge 42 ] && echo "util-linux-script")

-- 
2.51.0



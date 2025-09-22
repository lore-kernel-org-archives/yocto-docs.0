Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC1CCAC5A7
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 06:59:17 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.45463.1758524350203483681
 for <docs@lists.yoctoproject.org>;
 Sun, 21 Sep 2025 23:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=hpM5Dtye;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20250922065906c71d9b171a00020725-yfivfw@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250922065906c71d9b171a00020725
        for <docs@lists.yoctoproject.org>;
        Mon, 22 Sep 2025 08:59:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ACHl2lCAAjeBxjw5yBjXVaF9vLdRwhkYnzcq4Qfrsqk=;
 b=hpM5DtyerXaZWz0osIUAttJYIhkLBH0jKLGwOp8LIaeS30gqpbKsnJJqPdRvPzsngHj4qz
 pkXoBXbl++fPgYzHjYKi0zuDmDY4Rc8t9VqdkPC7ELVpUOxBM1Rc9oAzpu5lR/8nxd40YIrj
 2ERJVbCLpxidvtnT5trmb18WjX7wLpqTOMhOvuMYUOBT44cjInHxJVAksr4FF0s/6n3sqB0Q
 M9zRq+WFeilaXw/VLD6RrYwVKdY/WuK5ym7XJIjb0PtypSsXWzqzj3qx3g4RVKmC0V3Q3AOA
 Sgbt/bluzMO71BaMyVnMu5RpvYc4hURedPyt37fVCHH956bM/viGghsw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] docs: add util-linux-script package for Fedora 42+
Date: Mon, 22 Sep 2025 08:58:59 +0200
Message-ID: <20250922065859.157251-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 06:59:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7571

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
index ea14134398b..99e5d2c0b0b 100644
--- a/documentation/tools/host_packages_scripts/fedora_essential.sh
+++ b/documentation/tools/host_packages_scripts/fedora_essential.sh
@@ -1 +1 @@
-sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
+sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd $([ $(rpm -E %fedora) -ge 42 ] && echo "util-linux-script")
-- 
2.51.0



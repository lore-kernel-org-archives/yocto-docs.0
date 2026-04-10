Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F234DE99064
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:39:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.152742.1775813963903116378
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 02:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=frI+61Lg;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso1789070f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 02:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775813962; x=1776418762; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xA573y3X/p6UR2tzjHZljXBdlMlodQxtWlDPiBFFvIo=;
        b=frI+61LgFNywS1hRsgqL3iClw9VK0UHYMcZuu6KutHFeZMqTLSqOC3BtsIAGd5p8cq
         5A0pTWcMD74aZTuMF1Ldfl9MdRIaxrXjpPhfOasCJ5bNBKDZUH66E58oeNMrwMjPejgY
         0/J9RcKMAcPmhfqsrlcJ8Z/ejg+kFHKF+EqBq40RFTpo+ZSusV43WeFdS2QyVuFblEYT
         zLmgwzfyn+V36dzD4xgy0DaONsujgHdQnp3WbYnJsXJRDnM8JMVeOR0GV8toouFahs6I
         VgJfCWW5VJ6FhNTIKt7Ds7S0QBCbg9U4YTR5xP+sw3pbXhQMnEsEj2AvZjqq0+W+3PNj
         VZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813962; x=1776418762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA573y3X/p6UR2tzjHZljXBdlMlodQxtWlDPiBFFvIo=;
        b=GuiTV2MDK8ssDRORrhcdy0gfEO3ygAX7ejOUpaBt4yqSWE9Y7iVD/Oo4VH9LxWZMF8
         MQHX4/Oz2HNhhX9Ta1Mq5pFEsISCYjrYhTIwsvgGmm8PvG3WbeZaayG5z7NwiRhk4FBk
         UXrUTg34Dun6tf5/ESxjkXwgUzlyJ99wKxEFuBol+t+oDqKjfPJEFbyr8S90PKY/hgXb
         S/zFnUzQhuZiZAsEmtMgM0NJqvZiazaQrL4v714UNEsdJGcSQ2T4tmGyuEm8hX1VFuEp
         wA85XAKy9yb/qpAqPPznDGr8WyX6YjqB+Xe06GoUfiJRF7MFcxazrKipyG+qIbbzq6H+
         rmRg==
X-Gm-Message-State: AOJu0YwmkBAwp6YBbb7Ublzn7QA12yebSfIsaj+KkZR7vGVw2dA4dF3M
	JambEc2+cAWUwCx3/HEP+GyQMbqzhdbQCWhcEV3n1g5J9WzfW+SE2oqdJlTlbw==
X-Gm-Gg: AeBDiesZtSXR712bAMfkjBYcekItCt+pgR3obtoyxYWkmwKgJr/AcrzLF1WZBjGuIpr
	RrWO8xWDNo55p43UTqlvOllJmqkO2GqYvY+H+TW1MA2wB727uGGS+9D/xV+ELM18CgOHZp0KeNg
	hc4VoBMrg5wH9ks5TTC6F9HkD72IFyahyvFW6d5FS4jHa3YCy5akuYfVZta3xr/YhoIU5N76iA/
	RCutpMWCmvP2dxvz7ABD7HvIbhIKRy3DbRmhU7VVqr0AaOctijaMRPB3RGqwVx/BZnZK4ARWkmC
	jR2M3ao4eeMnrlUe6WlNmxr64XYjRUm37QQx2j1malVoaUQPbm9qE4pxKTLH+VHBoMc0MjKkdCB
	T14D1W5sd9xpxDY7l9mY7DA5v++vMyaan4LqvCr81mw+oCIWtOKERtBOY3pNOiFG9atYFN6a+ki
	g6GzWIXFdG96AaPyAdS6aHt3+2CpoetfA9HsuKqiJxWdu6oFWmzpL55DpnUe6GksY+9RMdpZHhg
	5/9mka/cD844pVLqrk0
X-Received: by 2002:a05:6000:144b:b0:43d:1e2f:bdac with SMTP id ffacd0b85a97d-43d642dd680mr3785972f8f.49.1775813962055;
        Fri, 10 Apr 2026 02:39:22 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec28asm5993842f8f.15.2026.04.10.02.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:39:21 -0700 (PDT)
From: martin.jansa@gmail.com
To: docs@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] docs: ubuntu_essential.sh: explicitly add libcrypt-dev
Date: Fri, 10 Apr 2026 11:39:16 +0200
Message-ID: <20260410093916.3788848-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:39:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9213

From: Martin Jansa <martin.jansa@gmail.com>

In latest ubuntu-26.04 build-essential no longer installs libcrypt-dev
But virtual/crypt-native is in ASSUME_PROVIDED and is expected to be
usable for development.

It used to be installed as build-essential -> libc6-dev -> libcrypt-dev,b
ut not anymore since 2.42-7:

25.10 questing with 2.42-0ubuntu3.1:
https://packages.ubuntu.com/questing/libc6-dev
26.04 resolute with 2.43-2ubuntu1:
https://packages.ubuntu.com/resolute/libc6-dev

https://changelogs.ubuntu.com/changelogs/pool/main/g/glibc/glibc_2.43-2ubuntu1/changelog:
...
glibc (2.42-7) unstable; urgency=medium

  [ Aurelien Jarno ]
  * debian/control.in/libc, debian/rules.d/debhelper.mk: drop libcrypt-dev
    dependency from libc6-dev. Thanks to Helmut Grohne for proposing that,
    doing an archive rebuild and filling the bug reports.
  * debian/control.in/main, debian/sysdeps/linux.mk: enable SystemTap static
    probes.
  * debian/debhelper.in/libc-dev.NEWS: add a NEWS entry about the removal of
    the obsolete termio interface.  Closes: #1124068.
  * debian/rules.d/debhelper.mk: ensure that linker scripts work even when
    /usr is unmerged.  Closes: #1120508
  * debian/debhelper.in/libc-dev{,-alt}.lintian-overrides,
    source/lintian-overrides, rules.d/debhelper.mk, salsa-ci.yml: drop
    unpack-message-for-{orig,source} overrides, fixed in lintian 2.128.0.
  * debian/control.in/main: drop Rules-Requires-Root: no, this is now the
    default.
  * debian/libc6.symbols.i386, debian/libc6-i386.symbols.{amd64,x32}: remove
    the workaround for GLIBC_ABI_GNU_TLS.  Closes: #1122038.
  * debian/control.in/{libc,i386}: ensure that libdpkg-perl is fixed wrt
    GLIBC_ABI_GNU_TLS.

 -- Aurelien Jarno <aurel32@debian.org>  Sun, 04 Jan 2026 10:07:24 +0100
...

Without libcrypt-dev installed on host building shadow-native will
fail with:
  checking for crypt in -lcrypt... no
  configure: error: crypt() not found
and python3-native with:
  The necessary bits to build these optional modules were not found:
  _crypt
  To find the necessary bits, look in configure.ac and config.log.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 documentation/tools/host_packages_scripts/ubuntu_essential.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/tools/host_packages_scripts/ubuntu_essential.sh b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
index 6584a0403..6234f885e 100644
--- a/documentation/tools/host_packages_scripts/ubuntu_essential.sh
+++ b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
@@ -1 +1 @@
-sudo apt-get install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd
+sudo apt-get install build-essential libcrypt-dev chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd


Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.5494.1608599168465184035
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Dec 2020 17:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=XFEn0dtJ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id B396C20B83DE; Mon, 21 Dec 2020 17:06:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B396C20B83DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608599167;
	bh=emEDIB1yzshqseeyqU7QVfa0BpqhOu1UoE7hJaaDMmQ=;
	h=From:To:Subject:Date:From;
	b=XFEn0dtJhdNzFRcn0eS4zkgWhYMo5uSQeSNVnrus7XPYx/vhMr5YTjdW2u03wM4iS
	 ChNhmZ1Z3qcvxNm56r34RdMTMsyao3F+uF5xsP/5rItwlnvSwUCtIvXQyv9oEF0LRk
	 z9PbDRz5uhnLUWhVCvnMEj3SLQ42OrIZ6ipdngQc=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/5] fitimage-related changes
Date: Mon, 21 Dec 2020 17:05:59 -0800
Message-Id: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

Doc changes corresponding to patches for kernel-fitimage class that were
recently merged to master, as well as some related tweaks.


The following changes since commit b268b1b190861cb203fa642e57794acb402280a7:

  releases: conf: add link to 3.2.1, update to include 3.2.1 (2020-12-15 10:59:41 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib paule/fitimage-docs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/fitimage-docs

Paul Eggleton (5):
  classes: minor corrections to kernel-fitimage section
  variables: clarify KERNEL_ALT_IMAGETYPE reference
  variables: explicitly state that UBOOT_MKIMAGE_DTCOPTS is optional
  variables: Add documentation for new kernel-fitimage vars
  ref-manual: use consistent capitalisation of U-Boot

 documentation/ref-manual/classes.rst       | 16 +++++-----
 documentation/ref-manual/migration-1.7.rst |  2 +-
 documentation/ref-manual/variables.rst     | 48 ++++++++++++++++++++++++++----
 3 files changed, 51 insertions(+), 15 deletions(-)

-- 
1.8.3.1


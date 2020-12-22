Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.5407.1608599168463226444
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Dec 2020 17:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=AVtXbCHt;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id D553A20B83F6; Mon, 21 Dec 2020 17:06:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D553A20B83F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608599167;
	bh=nVEEMOPLKLHjpMTbqUDmH/UwpCb4HrnYEBryUMTqB/k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AVtXbCHtGCUUphZ3s58U4eheaoWM9z16zWsRNXifuAae6n3ZWkHWwB054KsG3C9un
	 mg3PsvUJLGxmuIVjQU3P3gi4Fb6A0nUlagx+pdYpG5d9lFwG1yXyO5aGB3MZ91Cxaq
	 Sn50lBiZtnQA44zk595LHwA9WFj4acEB3WI1HjJQ=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/5] variables: explicitly state that UBOOT_MKIMAGE_DTCOPTS is optional
Date: Mon, 21 Dec 2020 17:06:02 -0800
Message-Id: <385bf90896619401485e3ae624097a0dcec97d11.1608598606.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4508bb1..8f7f86e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8444,6 +8444,8 @@ system and gives an overview of their function and contents.
    :term:`UBOOT_MKIMAGE_DTCOPTS`
       Options for the device tree compiler passed to mkimage '-D'
       feature while creating FIT image in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class.
+      If ``UBOOT_MKIMAGE_DTCOPTS`` is not set then kernel-fitimage will not
+      pass the ``-D`` option to mkimage.
 
    :term:`UBOOT_RD_ENTRYPOINT`
       Specifies the entrypoint for the RAM disk image.
-- 
1.8.3.1


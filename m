Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.5408.1608599168464046434
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Dec 2020 17:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=rJifuC1g;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id BF05F20B83F2; Mon, 21 Dec 2020 17:06:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BF05F20B83F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608599167;
	bh=mIIn04/KE1nXURh5O/KkKLzdivWXKT1mgJBBqN7woBs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rJifuC1g3BAoJzMuSbdE7JhB5pqdzVZ7zDjSN1EGlINohCSIpOSQOAmxqZw5kvFlV
	 A3HutoGy8o1LUMdSTpMtNs6TVP6zrwIrzrwsH16gkC/mQenPN0INhUWKmWPl3Q3gs9
	 3uKZIX/se4Os7u3vrdb6iNoHkA+Sl5CktntsSUb4=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/5] classes: minor corrections to kernel-fitimage section
Date: Mon, 21 Dec 2020 17:06:00 -0800
Message-Id: <ce78e375d6479f98d8312a618f71fde07bc21a2c.1608598606.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Minor syntax and formatting corrections.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 5a30ce3..08ced7f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1374,18 +1374,18 @@ generation.
 ``kernel-fitimage.bbclass``
 ===========================
 
-The ``kernel-fitimage`` class provides support to pack a kernel Image,
+The ``kernel-fitimage`` class provides support to pack a kernel image,
 device trees and a RAM disk into a single FIT image. In theory, a FIT
-image can support any number of kernels, RAM disks and device-trees.
+image can support any number of kernels, RAM disks and device trees.
 However, ``kernel-fitimage`` currently only supports
 limited usescases: just one kernel image, an optional RAM disk, and
-any number of device tree.
+any number of device trees.
 
 To create a FIT image, it is required that :term:`KERNEL_CLASSES`
-is set to "kernel-fitimage" and :term:`KERNEL_IMAGETYPE`
+is set to include "kernel-fitimage" and :term:`KERNEL_IMAGETYPE`
 is set to "fitImage".
 
-The options for the device tree compiler passed to mkimage -D feature
+The options for the device tree compiler passed to ``mkimage -D``
 when creating the FIT image are specified using the
 :term:`UBOOT_MKIMAGE_DTCOPTS` variable.
 
-- 
1.8.3.1


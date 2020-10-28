Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.2117.1603847918387307584
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 18:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=d/pPAUNZ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 8EC98209E691; Tue, 27 Oct 2020 18:18:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8EC98209E691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603847917;
	bh=eaz42ci9Fsht/siRsdc7UBDepOLGOUGIJqAGZ4Pbelc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d/pPAUNZLRls6ROi2QgPWTDlq2554ZVIaWGcTx/hRaNnLTajpIN16gflohSGH3JOA
	 nJbjJpNumc6gTVfVUvXQPmFCMbU1UfNs8gBaiK3Vqs9Vjr7sk40YcQ/XYCcSw6VrYh
	 55FLmvG9YGwG0TEaVIbD49LlDkoXh3ep0vuYs5w8=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 6/7] ref-manual: add IMAGE_NAME_SUFFIX variable
Date: Tue, 27 Oct 2020 18:18:34 -0700
Message-Id: <6303f649868f179b5b07b9f38923488ecae6c5f5.1603839557.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a variable glossary entry for IMAGE_NAME_SUFFIX, which was added way
back in krogoth.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/ref-variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 319f376..a7fb777 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -3127,6 +3127,13 @@ system and gives an overview of their function and contents.
 
          IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
+   :term:`IMAGE_NAME_SUFFIX`
+      Suffix used for the image output file name - defaults to ``".rootfs"``
+      to distinguish the image file from other files created during image
+      building; however if this suffix is redundant or not desired you can
+      clear the value of this variable (set the value to ""). For example,
+      this is typically cleared in initramfs image recipes.
+
    :term:`IMAGE_OVERHEAD_FACTOR`
       Defines a multiplier that the build system applies to the initial
       image size for cases when the multiplier times the returned disk
-- 
1.8.3.1


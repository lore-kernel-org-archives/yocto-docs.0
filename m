Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.5406.1608599168461312459
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Dec 2020 17:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=n+CAJfcM;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id CA0E120B83F5; Mon, 21 Dec 2020 17:06:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CA0E120B83F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608599167;
	bh=gI4ErqU1JbzvMXVDd5+LaIoVtA1qsFF8bHxsRv0zADQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n+CAJfcMkEElnBLjCtaD2InxdbcNHlKqqjb3ozc0KDRYncHHHXi5/AWeI8Th7HBCB
	 wN64YifCS661HXdCKV8jTxMlPIjXl9sriKADOu7o9frGl/fKS0xjKIv9qQR1tZsB6q
	 5ASEW5sJEcvsn9NiR50t/Qz88XkOeWYIpRxfka3s=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/5] variables: clarify KERNEL_ALT_IMAGETYPE reference
Date: Mon, 21 Dec 2020 17:06:01 -0800
Message-Id: <65654d690594e26623daf3f2c38e5996b00ff72d.1608598606.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Make it clear that KERNEL_ALT_IMAGETYPE is intended to allow building an
additional image type.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8c6cc46..4508bb1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3983,8 +3983,9 @@ system and gives an overview of their function and contents.
       when building the kernel and is passed to ``make`` as the target to
       build.
 
-      If you want to build an alternate kernel image type, use the
-      :term:`KERNEL_ALT_IMAGETYPE` variable.
+      If you want to build an alternate kernel image type in addition to that
+      specified by ``KERNEL_IMAGETYPE``, use the :term:`KERNEL_ALT_IMAGETYPE`
+      variable.
 
    :term:`KERNEL_MODULE_AUTOLOAD`
       Lists kernel modules that need to be auto-loaded during boot.
-- 
1.8.3.1


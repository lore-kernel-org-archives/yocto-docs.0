Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.4723.1618480756141143391
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=h8Ad+kj2;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 8308920B8004; Thu, 15 Apr 2021 02:59:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8308920B8004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618480755;
	bh=TOVV0b7iVXVGVehDotWrM3xMK/s5wmcZ1meI4wn6XzQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h8Ad+kj28UcrsvqN9Px09wRZ7sR5uUgT8oTLfkUeALNL0DYmz86BCG+hUyR6zrfU4
	 kJUJz0n/zHS8wY0rQSJYaM6s8WG+JUlE/4IO6D2YGVDImjfX26c0eyQNSz3wg5s3gX
	 zQRroR1x2UI3SrKSa63ljQr8XfSAEzFK/b5iJPOo=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 03/14] ref-manual: update/fix text for SDK_VERSION
Date: Thu, 15 Apr 2021 02:59:01 -0700
Message-Id: <7b0c4229591d6325384800137e9242c2b030e118.1618480508.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

DISTRO_VERSION snapshot versions use METADATA_REVISION not DATE in
hardknott and thus the default for SDK_VERSION has been updated, so
update it here as well. Additionally, fix the text so it makes sense.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f906d4e..188a3eb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6764,16 +6764,16 @@ system and gives an overview of their function and contents.
       Specifies the name of the SDK vendor.
 
    :term:`SDK_VERSION`
-      Specifies the version of the SDK. The distribution configuration file
-      (e.g. ``/meta-poky/conf/distro/poky.conf``) defines the
+      Specifies the version of the SDK. The Poky distribution configuration file
+      (``/meta-poky/conf/distro/poky.conf``) sets the default
       ``SDK_VERSION`` as follows:
       ::
 
-         SDK_VERSION = "${@d.getVar('DISTRO_VERSION').replace('snapshot-${DATE}','snapshot')}"
+         SDK_VERSION = "${@d.getVar('DISTRO_VERSION').replace('snapshot-${METADATA_REVISION}', 'snapshot')}"
 
       For additional information, see the
       :term:`DISTRO_VERSION` and
-      :term:`DATE` variables.
+      :term:`METADATA_REVISION` variables.
 
    :term:`SDKEXTPATH`
       The default installation directory for the Extensible SDK. By
-- 
1.8.3.1


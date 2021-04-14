Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.6080.1618359597469861265
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=OCsFgXlO;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 02E5420B8004; Tue, 13 Apr 2021 17:19:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 02E5420B8004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618359597;
	bh=9zRhzlQoFkuTwcwvMSv3TrFPqZFVWaqyZsv3NSPTzXk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OCsFgXlOaxSKbr079UfTmW0efSxPJgaJl1CwobQfc17obcoXcqrMK4ouaTfb8wr2y
	 bLTP9gxTsFCvuiZadPolJBChm8LVRaJ+wgDzgtdd5dZ+LG16FFpkeSYyRJilAxvWAY
	 6M2wOnGIBR/q1Q3Mm5l/OqUMHsGdnY5D4wAQIohI=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 03/13] ref-manual: update/fix text for SDK_VERSION
Date: Tue, 13 Apr 2021 17:19:44 -0700
Message-Id: <931fbd6c1f0fb27025ce3505effada512d2db93a.1618358456.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

DISTRO_VERSION snapshot versions use METADATA_REVISION not DATE in
hardknott and thus the default for SDK_VERSION has been updated, so
update it here as well. Additionally, fix the text so it makes sense.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index de63046..b9478a3 100644
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


Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.7470.1603885001956065497
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 04:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=X6BoQBbq;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 45E3A20B9C34; Wed, 28 Oct 2020 04:36:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 45E3A20B9C34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603884997;
	bh=FUxLwijG8q22wFbag5hqL+hJHhfgAvYZ5TyMEKekqy4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X6BoQBbq+XDwcUj2uZGOhTrbsV6jYFlNgGwe3KtjjNiN5iHCWZRnVejzmTBVHhVRT
	 ZWQYbL7zR+qsAt1O4GWa1uaagHIUBiVK+VqX0dRGMwwAH6hsTAbC9s8dMmorAkaB/8
	 nbIPyJXSl+vn2ERUW4dtKq3KBnW6JqfqUx0Xfr+Q=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/3] ref-manual: add migration info for image-artifact-names
Date: Wed, 28 Oct 2020 04:36:24 -0700
Message-Id: <56868b37a748a7e391631b56cc655f15bc46a5d7.1603884913.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1603884913.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603884913.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add some info on the image-artifact-names class change in gatesgarth.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/migration-3.2.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/documentation/ref-manual/migration-3.2.rst b/documentation/ref-manual/migration-3.2.rst
index a56c5d4..3c0ea7b 100644
--- a/documentation/ref-manual/migration-3.2.rst
+++ b/documentation/ref-manual/migration-3.2.rst
@@ -246,6 +246,27 @@ by these image recipes directly then you will need to adapt to the new
 naming without the ``.rootfs`` part.
 
 
+.. _migration-3.2-image-artifact-names:
+
+Image artifact name variables now centralised in image-artifact-names class
+---------------------------------------------------------------------------
+
+The defaults for the following image artifact name variables have been moved
+from bitbake.conf to a new ``image-artifact-names`` class:
+
+- :term:`IMAGE_BASENAME`
+- :term:`IMAGE_LINK_NAME`
+- :term:`IMAGE_NAME`
+- :term:`IMAGE_NAME_SUFFIX`
+- :term:`IMAGE_VERSION_SUFFIX`
+
+Image-related classes now inherit this class, and typically these variables
+are only referenced within image recipes so those will be unaffected by this
+change. However if you have references to these variables in either a recipe
+that is not an image or a class that is enabled globally, then those will
+now need to be changed to ``inherit image-artifact-names``.
+
+
 .. _migration-3.2-misc:
 
 Miscellaneous changes
-- 
1.8.3.1


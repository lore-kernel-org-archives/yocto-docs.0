Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.4722.1618480756140644362
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=crdHN4EZ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 6D6E020B8002; Thu, 15 Apr 2021 02:59:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6D6E020B8002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618480755;
	bh=JOBL1LigZeSSxjise8B7t7v2svyq3cGWHE/repzUk9c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=crdHN4EZ9aIGTk/CbW3eP9QX1Ouw2tBbPYFEcJHuY5fNr7KHQG/ERd5bC6I04z16X
	 +aBDJbHRQR1rNUjkM3IbHs0zYrHJGG66jHPRl5simkib2Jh4BDg9neEpHOIIz20mW1
	 YsysfAdlEJcO+L/ZfHrZ8V2JOLKR8+sSaV/p5jTU=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 01/14] ref-manual: add METADATA_REVISION and METADATA_BRANCH
Date: Thu, 15 Apr 2021 02:58:59 -0700
Message-Id: <3b80ece864e8cc06f09d3d4ee645ddeef5d4eaf6.1618480508.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

These are not new variables, but we are using METADATA_REVISION in a new
place and thus need to refer to it.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 19f5e34..f906d4e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4659,6 +4659,14 @@ system and gives an overview of their function and contents.
    :term:`MAINTAINER`
       The email address of the distribution maintainer.
 
+   :term:`METADATA_BRANCH`
+      The branch currently checked out for the OpenEmbedded-Core layer (path
+      determined by :term:`COREBASE`).
+
+   :term:`METADATA_REVISION`
+      The revision currently checked out for the OpenEmbedded-Core layer (path
+      determined by :term:`COREBASE`).
+
    :term:`MIRRORS`
       Specifies additional paths from which the OpenEmbedded build system
       gets source code. When the build system searches for source code, it
-- 
1.8.3.1


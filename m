Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.6163.1618359597598028808
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=RnVGxc8v;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id E10ED20B8002; Tue, 13 Apr 2021 17:19:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E10ED20B8002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618359596;
	bh=qjYNsMXtKnsdq+alOOa4W1FpkS5uiGg3ck8TL1a6o8U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RnVGxc8vC8e4Skj1i1VC+ZwQhiay9riq3dCCOlXY38Xw9kWOqeo3dQalGVY9q1Nre
	 BQ9w/MIMYcYcbOQtPyY5m0V0Hq+vZTvLSMCMEmzZu1gOcSlG4BvLA1A3lBrJFs3sLy
	 0qLUUmsu5kUVSIkbCsIZl+Z4hVNcfqcTtte64A0o=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 01/13] ref-manual: add METADATA_REVISION and METADATA_BRANCH
Date: Tue, 13 Apr 2021 17:19:42 -0700
Message-Id: <f6857b2b650e83625318860576f489734d99d4c8.1618358456.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

These are not new variables, but we are using METADATA_REVISION in a new
place and thus need to refer to it.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 19f5e34..de63046 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4659,6 +4659,14 @@ system and gives an overview of their function and contents.
    :term:`MAINTAINER`
       The email address of the distribution maintainer.
 
+   :term:`METADATA_BRANCH`
+      The branch currently checked out for the core layer (path determined by
+      :term:`COREBASE`).
+
+   :term:`METADATA_REVISION`
+      The revision currently checked out for the core layer (path determined by
+      :term:`COREBASE`).
+
    :term:`MIRRORS`
       Specifies additional paths from which the OpenEmbedded build system
       gets source code. When the build system searches for source code, it
-- 
1.8.3.1


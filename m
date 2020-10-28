Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.7417.1603885001960843079
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 04:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ajoNSCxx;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 3B0F920B4907; Wed, 28 Oct 2020 04:36:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3B0F920B4907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603884997;
	bh=yN5kpfU8WMwtH0ARzbwLyGOyHxatjzkxnqilwzXMh/4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ajoNSCxxFCRAUPRi/CVqGBHqzuXZ7yEmJiakVhhRoY5AsYWtpLm2UdWwID9QPU4Bz
	 MVUyGKYvYuPPNQUDUrzgm4dgl+WTjefs8IhHLNJ19ghMowRR9JMgMrjQrCDMS4I+WA
	 Ehj/Rt93o4NnzvrTm2G9SXB4A3tD+CY4EJIQVUdc=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/3] ref-manual: add IMAGE_LINK_NAME
Date: Wed, 28 Oct 2020 04:36:23 -0700
Message-Id: <8c12e9f579cbc0b86ca2fdd09b6b8860b9259585.1603884913.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1603884913.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603884913.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add IMAGE_LINK_NAME to the variable glossary.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/ref-variables.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index a7fb777..a69cf6a 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -3098,6 +3098,17 @@ system and gives an overview of their function and contents.
       See the :term:`GLIBC_GENERATE_LOCALES`
       variable for information on generating GLIBC locales.
 
+
+   :term:`IMAGE_LINK_NAME`
+      The name of the output image symlink (which does not include
+      the version part as :term:`IMAGE_NAME` does). The default value
+      is derived using the :term:`IMAGE_BASENAME` and :term:`MACHINE`
+      variables:
+      ::
+
+         IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
+
+
    :term:`IMAGE_MANIFEST`
       The manifest file for the image. This file lists all the installed
       packages that make up the image. The file contains package
-- 
1.8.3.1


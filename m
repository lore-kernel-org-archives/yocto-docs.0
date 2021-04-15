Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.4775.1618480756621412061
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=E47k18U4;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 998F820B83DA; Thu, 15 Apr 2021 02:59:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 998F820B83DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618480755;
	bh=qJnEHi9q/LsIrwZ5CXkKxY2tjmuJJ6S5/V+ZLqzZqHI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=E47k18U4pgszuCrmE9F4/8exadAAV9uHmAoD7RtqSxhs1UWWw46HKqjB3u7DxSrvi
	 bal1S+bTg+dvz8R0bxf3VTs/ZRRvEpOgiLAKfsJAKdZuF2IKOXZczVCbMJG/13dNF8
	 Ioh3vH5QMB82asnWI8g+NNjzBTNsMAKn/LJ9rjs0=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 05/14] ref-manual: and SDK_CUSTOM_TEMPLATECONF to glossary
Date: Thu, 15 Apr 2021 02:59:03 -0700
Message-Id: <0345a664fdf1076edaaeeea0d5b682598534cc58.1618480508.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 188a3eb..4632754 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6489,6 +6489,11 @@ system and gives an overview of their function and contents.
       The target architecture for the SDK. Typically, you do not directly
       set this variable. Instead, use :term:`SDKMACHINE`.
 
+   :term:`SDK_CUSTOM_TEMPLATECONF`
+      When building the extensible SDK, if ``SDK_CUSTOM_TEMPLATECONF`` is set to
+      "1" and a ``conf/templateconf.conf`` file exists in the build directory
+      (``TOPDIR``) then this will be copied into the SDK.
+
    :term:`SDK_DEPLOY`
       The directory set up and used by the
       :ref:`populate_sdk_base <ref-classes-populate-sdk>` class to which
-- 
1.8.3.1


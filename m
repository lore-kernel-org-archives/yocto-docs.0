Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.6165.1618359599740850307
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=sbzz5CBt;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 189C520B83DA; Tue, 13 Apr 2021 17:19:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 189C520B83DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618359597;
	bh=WdZCNkKHj9lLl5rhXPrfqybGdSsyPyA+2Fgt68t0A40=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sbzz5CBtc81tW+IF1z/ELlCITcJvKzMRUlZEEM8cwPxBzD3XYUQT6tRuVP0hbEmbT
	 czKQ15tR8sTskb818WgZ9zgkLe8KY9ohkUCNG8LRBAjFECHgDuEbe+tkUt+HZiP08p
	 RZxEi4ihSsX0rlFhDFd8yVAiNHaQLF5HzcvLjH+o=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 05/13] ref-manual: and SDK_CUSTOM_TEMPLATECONF to glossary
Date: Tue, 13 Apr 2021 17:19:46 -0700
Message-Id: <9fb4cdc8a239461928146cfd94b4bc3f4236764a.1618358456.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b9478a3..ef61339 100644
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


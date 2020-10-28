Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.2171.1603847917890371645
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 18:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=qI5f7JhA;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 7948E20BE4A6; Tue, 27 Oct 2020 18:18:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7948E20BE4A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603847917;
	bh=dNz4I8jz/c3gNB0eJnEjcXQlUFuUt8f0PHEV522wHUk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qI5f7JhAfxVuzZDHeYn1gbJG+E3Mg20Cm0ifGIdXWniY61uTK7BBl5ItKUag9d5dU
	 LszG09NfO4j/jzwCFKpG23gTTJY4bA4NnkgMgKRBEMHWJnAlHvxpj8dlOnFqa/UnUq
	 H7eNY0FuHLFClQj7+qydnR2vBx8fIlb6hGSxjxhE=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 4/7] ref-manual: add PSEUDO_IGNORE_PATHS
Date: Tue, 27 Oct 2020 18:18:32 -0700
Message-Id: <c9245b18556164df9e94c07084918116182cbfb3.1603839557.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a brief variable glossary entry for the new PSEUDO_IGNORE_PATHS
variable.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/ref-variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index a7315cf..176c94a 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -5932,6 +5932,14 @@ system and gives an overview of their function and contents.
       service <dev-manual/dev-manual-common-tasks:working with a pr service>`. You can
       set ``PRSERV_HOST`` to other values to use a remote PR service.
 
+
+   :term:`PSEUDO_IGNORE_PATHS`
+      A comma-separated (without spaces) list of files that should be ignored
+      by pseudo when monitoring and recording file operations, in order to avoid
+      problems with files being written to outside of the pseudo context and
+      reduce pseudo's overhead.
+
+
    :term:`PTEST_ENABLED`
       Specifies whether or not :ref:`Package
       Test <dev-manual/dev-manual-common-tasks:testing packages with ptest>` (ptest)
-- 
1.8.3.1


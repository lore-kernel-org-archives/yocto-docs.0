Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.4810.1618480756820851391
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=TvAf6AoC;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id BA46E20B83ED; Thu, 15 Apr 2021 02:59:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BA46E20B83ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618480755;
	bh=4jlGisgHYv10mMFf711OmygvXYxJeRznTEHTqiz51L8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TvAf6AoCZv7/z+kEB6LQVnUOYlvke9UL+4gkh2Gpj3W+R5XE/SnpfxHZTYS77OStP
	 w/2vgYzqHhC7PuKtF2NmJvr4PIFHT41tb3nQX1iKzVJnOLU5Nq6FVos86SevqgNcfl
	 xvjzfbKaVeGl4RblBSvZpzdg1iDF/KtmS9nF8Oxk=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 08/14] ref-manual: add passwd-expire to EXTRA_USERS_PARAMS
Date: Thu, 15 Apr 2021 02:59:06 -0700
Message-Id: <c2c8d34149a1436403cb720e8b19301c8b5ec62a.1618480508.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a reference to the recently added passwd-expire command in
EXTRA_USERS_PARAMS.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 7ae33d5..ca24471 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2293,6 +2293,17 @@ system and gives an overview of their function and contents.
          # usermod -s /bin/sh tester; \
          # "
 
+      Additionally there is a special ``passwd-expire`` command that will
+      cause the password for a user to be expired and thus force changing it
+      on first login, for example::
+
+         EXTRA_USERS_PARAMS += " useradd myuser; passwd-expire myuser;"
+
+      .. note::
+
+         At present, ``passwd-expire`` may only work for remote logins when
+         using OpenSSH and not dropbear as an SSH server.
+
    :term:`FEATURE_PACKAGES`
       Defines one or more packages to include in an image when a specific
       item is included in :term:`IMAGE_FEATURES`.
-- 
1.8.3.1


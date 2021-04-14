Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.6083.1618359599671487873
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=eHxHJsf9;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 39A9E20B83ED; Tue, 13 Apr 2021 17:19:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 39A9E20B83ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618359597;
	bh=RLj8UpJI7joUG3Czod2VCQZ7+lgTdgekBodTz8Qltxo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eHxHJsf9Inz+YMSN+sioTe+VOVm4FQns4Wy6KGS6uPO5UdkGCl2xq8XVGhw3s3EJ5
	 uhqrpUeGArWci3zUpNNUtpU9JJnnf68HmFU8bolqQmFX1PaKcLyXlZGJoMdYPJ/BEV
	 yoloVhTQ9abPl95wW6yGKsGdy7Dred0nOyckjAi8=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 08/13] ref-manual: add passwd-expire to EXTRA_USERS_PARAMS
Date: Tue, 13 Apr 2021 17:19:49 -0700
Message-Id: <c973665acd8a5259b19ab512b2ae7f6d10848cb5.1618358456.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a reference to the recently added passwd-expire command in
EXTRA_USERS_PARAMS.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2e3cc22..3b76dbc 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2293,6 +2293,17 @@ system and gives an overview of their function and contents.
          # usermod -s /bin/sh tester; \
          # "
 
+      Additionally there is a special ``passwd-expire`` command that will
+      cause the password for a user to be expired and thus force changing it
+      on first login, for example: ::
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


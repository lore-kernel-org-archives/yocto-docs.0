Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.6096.1618359599767540029
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=p8TStbZ5;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 4FCC820B83F3; Tue, 13 Apr 2021 17:19:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4FCC820B83F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618359597;
	bh=MQArkNghTwOcS3YtXYmEhqVqTIP1L7SZErD/+uj/6uA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=p8TStbZ5oXeoYIN8E/qhI+aGv0KV9uJf0MZH0PiVszCkW2bLGL7G54GYOjIySxPV+
	 dEu2DY84o0VlrDyJLShwHPA1sydzwX7AfiO4r8j6KlshdUFbhONhjHO3bk2VMjZQQS
	 7ckRmGzfVHxJtqcs19VlxIk0I4Yc0mwkf6H4NvIA=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 10/13] ref-manual: fix reference to build-essential
Date: Tue, 13 Apr 2021 17:19:51 -0700
Message-Id: <be9ee46d744c7b2b559819c61cb68ae47898b7c0.1618358456.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

This has been here since the text was added to the DocBook version.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/system-requirements.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index dc619ce..2e2d0d3 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -274,7 +274,8 @@ version requirement for gcc:
 
 If your host development system does not meet this requirement, you can
 resolve this by installing a ``buildtools-extended`` tarball that
-contains additional tools, the equivalent of ``buildtools-essential``.
+contains additional tools, the equivalent of the Debian/Ubuntu ``build-essential``
+package.
 
 Installing a Pre-Built ``buildtools`` Tarball with ``install-buildtools`` script
 --------------------------------------------------------------------------------
-- 
1.8.3.1


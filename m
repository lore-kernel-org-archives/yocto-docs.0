Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.4808.1618480756698359267
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ikrf7LH/;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id CFC1720B83F3; Thu, 15 Apr 2021 02:59:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CFC1720B83F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618480755;
	bh=MQArkNghTwOcS3YtXYmEhqVqTIP1L7SZErD/+uj/6uA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ikrf7LH//RlmIO87rbpFEAMAQ9FsW5rK4auKMAO4xn97fnaAk7ualaLqXkNJjFqav
	 Swt+VT5uvuEUGE4LHGdaXp80dzeTv9kK0XLj3YlIIpq6tfLSLCT7HdPKsEYwXgVLXk
	 Al7hOhz/kAeCDQnTqyBfBGrKEeqHi25H9TEmOtRw=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 10/14] ref-manual: fix reference to build-essential
Date: Thu, 15 Apr 2021 02:59:08 -0700
Message-Id: <ae9542d35ad62ec5abbb8973b9ab7e681ff8891e.1618480508.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>

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


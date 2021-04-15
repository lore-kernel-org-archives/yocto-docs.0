Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.4777.1618480756780787469
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=AdaudSP7;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id DA7DE20B8772; Thu, 15 Apr 2021 02:59:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DA7DE20B8772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618480755;
	bh=Kl9vRwbw103dQXqwHpM60KJescYfr2+JUOhBC6LOStU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AdaudSP7iKrspC4VoeDn4eX3o9JZJsJTx9q9+af0+OGxY9yf64sSDpQsgVhuKEMU3
	 YbaTnnsriP0xGJ5PCO671qpGyQ7sAtCkeSqJUsuEg81N18AhKhvMqfWW6ZPkinaBVO
	 MyrrpLCkFtrYt5gbns7juaT3S5wdlIZBd/5XCnZo=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 11/14] ref-manual: tweak buildtools section
Date: Thu, 15 Apr 2021 02:59:09 -0700
Message-Id: <e2506aa00aae03acf266efcd0a7797f2306791e2.1618480508.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a joining paragraph and fix the second section so that it makes
sense with the addition of the first one.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/system-requirements.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 2e2d0d3..80378ce 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -277,6 +277,9 @@ resolve this by installing a ``buildtools-extended`` tarball that
 contains additional tools, the equivalent of the Debian/Ubuntu ``build-essential``
 package.
 
+In the sections that follow, three different methods will be described for
+installing the ``buildtools`` or ``buildtools-extended`` toolset.
+
 Installing a Pre-Built ``buildtools`` Tarball with ``install-buildtools`` script
 --------------------------------------------------------------------------------
 
@@ -332,8 +335,9 @@ installer and automatically installs the tools for you:
 Downloading a Pre-Built ``buildtools`` Tarball
 ----------------------------------------------
 
-Downloading and running a pre-built buildtools installer is the easiest
-of the two methods by which you can get these tools:
+If you would prefer not to use the ``install-buildtools`` script, you can instead
+download and run a pre-built buildtools installer yourself with the following
+steps:
 
 1. Locate and download the ``*.sh`` at &YOCTO_RELEASE_DL_URL;/buildtools/
 
-- 
1.8.3.1


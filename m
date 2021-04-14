Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.6085.1618359599803058382
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=CAwv2oGC;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 5A8AA20B8772; Tue, 13 Apr 2021 17:19:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5A8AA20B8772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618359597;
	bh=Kl9vRwbw103dQXqwHpM60KJescYfr2+JUOhBC6LOStU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CAwv2oGCCymyts+dcuIeguYiaj35B1PuD9pCnX4p+zaEDtttpm8P+sW3F+CWgPmoE
	 13fSQhyw6x7ZiWCL55Gh9bz93O/ChSpWiqyetFdvyGb2AKxezj0Uv6/7o9JAuDJe/9
	 u1hp0zwbSfPhlqtj/pdp3hVKgUiqOMktVTX8dmf8=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 11/13] ref-manual: tweak buildtools section
Date: Tue, 13 Apr 2021 17:19:52 -0700
Message-Id: <32424cab6f53c96607ea4aaaec31d77a08c08b5c.1618358456.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>

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


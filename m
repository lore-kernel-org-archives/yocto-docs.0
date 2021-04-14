Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.6098.1618359599774240651
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=peg6UzyE;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 450B820B83F1; Tue, 13 Apr 2021 17:19:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 450B820B83F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618359597;
	bh=JTcD8rg48GkWLfim3J7wMyM5/RAaJqaK7+s+LwoEyXk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=peg6UzyE3BZFyaU2Sw4CQUBNPBK3LrUJMd4OSnIV+NQK2iA7daAMIfKYKrABlTrbQ
	 MQrzp/bfq7eKw092MY95DkwReqXAZvzmXlXTDP1YgI3aqX12UH94b0R1vLJnKZkqDa
	 VRRzBKqEtbC0uAICUlaLObfb4R8RsDHn4iXc2ToE=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 09/13] ref-manual: add FIT_KERNEL_COMP_ALG*
Date: Tue, 13 Apr 2021 17:19:50 -0700
Message-Id: <fedb9252444ceaaaa6567d381318ca02c119a3da.1618358456.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add FIT_KERNEL_COMP_ALG and FIT_KERNEL_COMP_ALG_EXTENSION. Examining
OE-Core commit 5c72105e2973e613b5c0f0e6310ffdea6e56c6c7 and the
associated code, these do not enable arbitrary selection of compression
algorithm - only disabling compression - so document them accordingly.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3b76dbc..f010cd7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2580,6 +2580,17 @@ system and gives an overview of their function and contents.
    :term:`FIT_HASH_ALG`
       Specifies the hash algorithm used in creating the FIT Image. For e.g. sha256.
 
+   :term:`FIT_KERNEL_COMP_ALG`
+      Compression algorithm to use for the kernel image inside the fitImage.
+      At present, the only supported values are "gzip" (default) or "none",
+      which allows disabling of compression if it would otherwise be enabled.
+      If you set this you will also need to set :term:`FIT_KERNEL_COMP_ALG_EXTENSION`.
+
+   :term:`FIT_KERNEL_COMP_ALG_EXTENSION`
+      File extension corresponding to :term:`FIT_KERNEL_COMP_ALG`. The default
+      value is ".gz"; if you set ``FIT_KERNEL_COMP_ALG`` to "none" then
+      ``FIT_KERNEL_COMP_ALG_EXTENSION`` should be set to "".
+
    :term:`FIT_KEY_GENRSA_ARGS`
       Arguments to openssl genrsa for generating RSA private key for signing
       fitImage. The default value is "-F4". i.e. the public exponent 65537 to
-- 
1.8.3.1


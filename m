Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.4809.1618480756739111323
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=PsaUxHXb;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id C4FD120B83F1; Thu, 15 Apr 2021 02:59:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C4FD120B83F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618480755;
	bh=u3wMg77dzWEUhU16yNQXfGTEGi8Mf0xyM2Xf9yUUmvM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PsaUxHXbQCGB44+/vDdYVGVtRFpsFBVEbXsu09L5nqaA90bpAy8un4rWKAxOs/ttr
	 PXkty0fpTw54LDXC6hMmhvbRO/TTJpLgoPnIQFABH6K8p+Ae88ColkICzju7tSrVMq
	 yzxsgV+vej4o/KNguILp99x936Sns70wmWiSO+EI=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 09/14] ref-manual: add FIT_KERNEL_COMP_ALG*
Date: Thu, 15 Apr 2021 02:59:07 -0700
Message-Id: <cc8745d4de89b9f7a4fe24f49a677b93da3f9d07.1618480508.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add FIT_KERNEL_COMP_ALG and FIT_KERNEL_COMP_ALG_EXTENSION. Examining
OE-Core commit 5c72105e2973e613b5c0f0e6310ffdea6e56c6c7 and the
associated code, these do not enable arbitrary selection of compression
algorithm - only disabling compression - so document them accordingly.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ca24471..aab062b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2580,6 +2580,16 @@ system and gives an overview of their function and contents.
    :term:`FIT_HASH_ALG`
       Specifies the hash algorithm used in creating the FIT Image. For e.g. sha256.
 
+   :term:`FIT_KERNEL_COMP_ALG`
+      Compression algorithm to use for the kernel image inside the FIT Image.
+      At present, the only supported values are "gzip" (default) or "none"
+      If you set this variable to anything other than "none" you may also need
+      to set :term:`FIT_KERNEL_COMP_ALG_EXTENSION`.
+
+   :term:`FIT_KERNEL_COMP_ALG_EXTENSION`
+      File extension corresponding to :term:`FIT_KERNEL_COMP_ALG`. The default
+      value is ".gz".
+
    :term:`FIT_KEY_GENRSA_ARGS`
       Arguments to openssl genrsa for generating RSA private key for signing
       fitImage. The default value is "-F4". i.e. the public exponent 65537 to
-- 
1.8.3.1


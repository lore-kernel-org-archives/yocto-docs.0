Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.13371.1604677913642869025
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 07:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D+O7r/fU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id p1so1790858wrf.12
        for <docs@lists.yoctoproject.org>; Fri, 06 Nov 2020 07:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r87Z+DuYT3GlIJD4l0iEQdUreCDLe7ljE2Z9UUvMuFI=;
        b=D+O7r/fUn0FDGsWE4EU828zlHRjlkUBCFc54/0+rjwi8XdgKCYPbiI3V2feXaoHjbc
         0986pSNh2MeJ8Duq5UY3M0D2/0OUmmkNOnB3ofDFFAVsVk3HqRHLAL7EvYJ1vmgaj79U
         6hUSbkW8d8U+yxy2+AU7aKS0i7Pn07dMRZNHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r87Z+DuYT3GlIJD4l0iEQdUreCDLe7ljE2Z9UUvMuFI=;
        b=MvTeZXhn2AXDvZKNncSxW6rq7cotoyoBVQ+wdzQFQ8wApEghBtfetS/SSU1INgjf9P
         xTO5B1rgLnv3MN6XF9nzWGJUFER7Aq7GGkC5ryWqEU+pHCKj+FMyxizgbM1innTYs54N
         7nAIDGOzGjEXaA8+tNmEs7Icr20FKwsgf3/MVk6bHB4Ywno78nUqtXhWHlPYBFAt9oPM
         8C8c+UOrjWYgGTPtbfErxCqvTdsmplbjpbdFEGNXhZw0TkvLxwHt9/JecYRrxpI0nF4F
         cLtoc/HR+V3XHxVOMz7WZ4a37r4Wz5yqpYaNOoZmyBUJAT5vuRaiw48pvU2QzvqxZlaS
         92Xw==
X-Gm-Message-State: AOAM530gFtxmYpGry2llQhjvmrBayD2DYLjR6L8FkaH40I3wxOPIl3Ss
	v5qmLM9SIdD332dB6VU2rLl7Q8ZtBn71cQ==
X-Google-Smtp-Source: ABdhPJwYRZjYpKd0KbV011RU4ophSfDuoGOeI/qlnoxI2ve/2DlxyVCtNs9+5JlBxXOAbCKXkMw+ow==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr3232872wrv.286.1604677911855;
        Fri, 06 Nov 2020 07:51:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (8.b.5.4.f.1.8.b.1.d.2.1.c.c.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:90cc:12d1:b81f:45b8])
        by smtp.gmail.com with ESMTPSA id u5sm2808151wml.13.2020.11.06.07.51.51
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 07:51:51 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] overview-manual-concepts: Fix the compiler bootstrap process
Date: Fri,  6 Nov 2020 15:51:50 +0000
Message-Id: <20201106155150.533532-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc-cross-initial and glibc-inital were removed a while ago and this
flow is incorrect anyway. Fix it to match what happens (adding libgcc
and libgcc-initial which are now important in this context).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../overview-manual-concepts.rst              | 34 +++++++------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index d9f50e519..736fd9591 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -1515,27 +1515,24 @@ cross-compiler that is used internally within BitBake only.
    gcc-cross
    .
 
-The chain of events that occurs when ``gcc-cross`` is bootstrapped is as
-follows:
+The chain of events that occurs when the standard toolchain is bootstrapped:
 ::
 
-   gcc -> binutils-cross -> gcc-cross-initial -> linux-libc-headers -> glibc-initial -> glibc -> gcc-cross -> gcc-runtime
+   binutils-cross -> linux-libc-headers -> gcc-cross -> libgcc-initial -> glibc -> libgcc -> gcc-runtime
 
--  ``gcc``: The build host's GNU Compiler Collection (GCC).
+-  ``gcc``: The compiler, GNU Compiler Collection (GCC).
 
--  ``binutils-cross``: The bare minimum binary utilities needed in order
-   to run the ``gcc-cross-initial`` phase of the bootstrap operation.
+-  ``binutils-cross``: The binary utilities needed in order
+   to run the ``gcc-cross`` phase of the bootstrap operation and build the
+   headers for the C library.
 
--  ``gcc-cross-initial``: An early stage of the bootstrap process for
-   creating the cross-compiler. This stage builds enough of the
-   ``gcc-cross``, the C library, and other pieces needed to finish
-   building the final cross-compiler in later stages. This tool is a
-   "native" package (i.e. it is designed to run on the build host).
+-  ``linux-libc-headers``: Headers needed for the cross-compiler and C library build.
 
--  ``linux-libc-headers``: Headers needed for the cross-compiler.
+-  ``libgcc-initial``: An initial version of the gcc support library needed
+   to bootstrap ``glibc``.
 
--  ``glibc-initial``: An initial version of the Embedded GNU C Library
-   (GLIBC) needed to bootstrap ``glibc``.
+-  ``libgcc``: The final version of the gcc support library which
+   can only be built once there is a C library to link against.
 
 -  ``glibc``: The GNU C Library.
 
@@ -1543,14 +1540,7 @@ follows:
    cross-compiler. This stage results in the actual cross-compiler that
    BitBake uses when it builds an image for a targeted device.
 
-   .. note::
-
-      If you are replacing this cross compiler toolchain with a custom
-      version, you must replace
-      gcc-cross
-      .
-
-   This tool is also a "native" package (i.e. it is designed to run on
+   This tool is a "native" tool (i.e. it is designed to run on
    the build host).
 
 -  ``gcc-runtime``: Runtime libraries resulting from the toolchain
-- 
2.25.1


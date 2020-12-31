Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.19811.1609414044505488118
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Dec 2020 03:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cIXfe7oP;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: elvstone@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id a12so43515217lfl.6
        for <docs@lists.yoctoproject.org>; Thu, 31 Dec 2020 03:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gJm4oxwKYwwEmF8azNBjGkmP3e4KBTozLNASyesdyi8=;
        b=cIXfe7oP8HJfg0j2GuJFRlo71XOQsaxi5hf9FE8Jzz5JsRyWzTvTkKuOm+QkgKagf5
         f2fUF88Bb75njXbBJerwDkesLkq9Tj+/OHS73cDnQaNWegsavYzNcAre7Fo5NaTeCpVM
         gM5tK9fh0KQ+99QgROA2/923Cmw1n5rPZa4YurSvzFOa5XLzAJlTuWoojEg3PE4Qtykf
         jMkEpxDh3HOZZDTsfNuuK8fqCTPUMVIwaoXLtwL+9dcJhCeGWcuhVT7R+KmVKqH7oaCe
         b55DHXom94vFlW6VLO9ppyah1Pa+4YT9hBdq/k8eKcoVID/agvhkUSn0g6zXOs7oZNzT
         xfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gJm4oxwKYwwEmF8azNBjGkmP3e4KBTozLNASyesdyi8=;
        b=f4cgPVvD72NYQahdewPa0BlkJrFR0gq+O+nx3Q+iQUUC2U3edU2dtf8dYMHncaxZlO
         rRYgPQtoQIMwYVS7iu78N+Cy7WxcfxIT+ag1Pf5Ey6Swv0Eev2TXme9nqI+NQU3Bn6VC
         RybDqkUWQ6x14u2dfhkiEh/ds6C+rjJhhJ1z893P+/2hv6/kXJsHTzkSx2cfM+GlCe2V
         DFOQ5I4HDPRRHMvbzYsvXqzyW1gXfDMCTkSRZH403mn+qNoM+ONuGUrE4TRqIVT/3EEx
         GBLNrN/B89X31aMeuSlkQdposQzp8dvhmdVElvPCJMhfvPDKAyFDH/aCClbIdfUrqoD0
         tBiw==
X-Gm-Message-State: AOAM532LrEiBktva/BjZJKV61WM8RLk7PVL2xcXKWY/zEZ/E5BUARF+k
	1i/kUL3YMGS1aCxccw/+urx2Lp4qp67PEA==
X-Google-Smtp-Source: ABdhPJzeiXC+hVUFBd3YkSz4q5Am4wMO7u8Ri0mJUPfAdnY5c4f4DQiYGkWLfBO+Vvpf7I0qPshl0g==
X-Received: by 2002:ac2:4c2f:: with SMTP id u15mr16168989lfq.163.1609414042387;
        Thu, 31 Dec 2020 03:27:22 -0800 (PST)
Return-Path: <elvstone@gmail.com>
Received: from localhost.localdomain (h-158-174-187-112.NA.cust.bahnhof.se. [158.174.187.112])
        by smtp.gmail.com with ESMTPSA id k11sm7482988lji.95.2020.12.31.03.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 03:27:21 -0800 (PST)
From: "Elvis Stansvik" <elvstone@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Elvis Stansvik <elvstone@gmail.com>
Subject: [PATCH] ref-manual: terms: Fix poky tarball root folder
Date: Thu, 31 Dec 2020 12:27:03 +0100
Message-Id: <20201231112703.279217-1-elvstone@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When extracting the tarball the root folder is not named `poky`, but
e.g. `poky-gatesgarth-24.0.0`.
---
 documentation/ref-manual/terms.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index c07dd4b12..966962005 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -349,7 +349,8 @@ universal, the list includes them just in case:
      Source Directory is derived from the Yocto Project release tarball.
      For example, downloading and unpacking
      :yocto_dl:`/releases/yocto/&DISTRO_REL_TAG;/&YOCTO_POKY;.tar.bz2`
-     results in a Source Directory whose root folder is named ``poky``.
+     results in a Source Directory whose root folder is named
+     ``&YOCTO_POKY;``.
 
      It is important to understand the differences between the Source
      Directory created by unpacking a released tarball as compared to
-- 
2.25.1


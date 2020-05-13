Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.67.1589401273854717879
 for <docs@lists.yoctoproject.org>;
 Wed, 13 May 2020 13:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bA8nlskW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id r22so228660pga.12
        for <docs@lists.yoctoproject.org>; Wed, 13 May 2020 13:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ntXRdirFaZeZje8alExHr6AlDt6rQcsDvmOJV8mKrsI=;
        b=bA8nlskW9jMnKVo2O4nR6fGb0Wxu7h+Sa3hhZ8QLJER7AxsIBfpzXiR/z3LniKVA2O
         9wk/GNzI9ZjNfICtOSWgHbK5z683ydtAs3NbTHHYO6refXmm4JeJiLK6YdbBndQSJJrA
         pYFOEQTfS9EuFd7whOpy6T5tyx9lLQSXCPjsnrs4eszdK0Febvf3FBfeZf3zOlmxccxo
         GbV2DH+8GvgOjF2PeJYMAlHCETyrH3Q4BJPqLYwL5ozwurW9y0ez/G1bO4/AA+47rVca
         aUM7IamN30XaGc7nkfE7anB35OigB5WX1NN6CdxM+La/nyHAQ0LHzN+3rcOangKqdmN8
         lnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ntXRdirFaZeZje8alExHr6AlDt6rQcsDvmOJV8mKrsI=;
        b=K1AMsajrbLKJSwDpCpwQlNHasWMLMZzminVjCtgArCRY0fQjhnc4c/M4EhqTz1XinS
         UpTKFAjGXLqfBGGxLDSmVbFNLwoN04GZj3HMvEXak+Uefj3OjvJdCrnZlv6w6on7rEOa
         lw5bwlJh67N2ZUph12aH4wOUuqsL4uKh1JCzV9o/98AfGO0AK1pVCE2pz6eymkuzYYf4
         IimA+7KyQBgv1ypP1AV+jAdQb5gXyYmDy0mnTLZNj5otBrLtkapAN7So5uHJ56YZNu2g
         4UIrIg1eoeafDpyxDh2pyk01THDkZOlUu3j1uP7MNBRllwytVBkk5RvGVW7D/l8YSozs
         UsEw==
X-Gm-Message-State: AOAM530h6eHyrii37SerJnYpNyk38/ofMsFfROKXSRm1JIEBWfSiHnxa
	rwjbwFpEs+970PaTe1ogE17bYX/Q63/52Q==
X-Google-Smtp-Source: ABdhPJyI4iPPZwQR+tToGRwHgjYSWiZojgvzRaaLsgNvRqSqSTCTktlHGfQ9Vbub13thdpacGEuhog==
X-Received: by 2002:a63:111b:: with SMTP id g27mr966921pgl.214.1589401272837;
        Wed, 13 May 2020 13:21:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m12sm462440pgj.46.2020.05.13.13.21.11
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 13:21:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 2/4] ref-manual: IMAGE_TYPES, add tar.zst, delete elf
Date: Wed, 13 May 2020 10:20:54 -1000
Message-Id: <5edeb02f5154c17902b74739052e46d4223473b3.1589308928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589308928.git.steve@sakoman.com>
References: <cover.1589308928.git.steve@sakoman.com>

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Update list of legal IMAGE_TYPES to match what's in
image_types.bbclass.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/ref-variables.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index b44fdcb73..e18f41180 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -6638,7 +6638,6 @@
      cpio.lzma
      cpio.xz
      cramfs
-     elf
      ext2
      ext2.bz2
      ext2.gz
@@ -6662,6 +6661,7 @@
      tar.gz
      tar.lz4
      tar.xz
+     tar.zst
      ubi
      ubifs
      wic
-- 
2.17.1


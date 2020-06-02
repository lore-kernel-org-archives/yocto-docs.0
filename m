Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.201.1591057723508146631
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 17:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=j8l2nKoy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id n9so616846plk.1
        for <docs@lists.yoctoproject.org>; Mon, 01 Jun 2020 17:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ntXRdirFaZeZje8alExHr6AlDt6rQcsDvmOJV8mKrsI=;
        b=j8l2nKoy5eyYCNgKDIr5tUrp09eURTh3IzZ8V6Y4NcahGi06Ih40BqGs2NClYIirKE
         FbyWtz8MNurLIzy7g3oKvdEdp5qKV+jbz4Siv9TL68ZCJHjAAiZRuSJmOsAxmo8KCs3s
         POBoEqU2ufUtz4ewdby9SrEbIl4dJlaUW5HE0fyNz410Vb99IotILhAEj51aztWV7jit
         BJmvESB/p2gzRw0VSHsyt9AU3z/+eLgCdnakClqJ/eE9rtDZZ7JyEtiBD66RpmzvDuWT
         Y+xp0M62ofgIdGeegDQIXvZlcVP5hqHuksWUkNWilnUjoSJIU5LjottvA5yqWfGih7qu
         l8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ntXRdirFaZeZje8alExHr6AlDt6rQcsDvmOJV8mKrsI=;
        b=P9YVdk4iTuKApQzFXpx7ggoz8DGpu0iGO1qlS/w2e9P11bXyTQ9B9Z+/zHGR7XDe3e
         xnkZUqK5xFQj60bwCdjdh//1rEYw+KAgp5m0utsaHPY97jiqo5s1ZZ8nwK4SN24T9OgD
         B9IkX33cKVEc2KIoLWTs1AXp+gHts4Hn7q3Y1EL2EWv9dW1TWcFqGiA+PqRcJYp9uB5k
         08xVMDseBxp1k5ZNvM+QUQj7rvFNIzT5MEyYyrYGArWG6W1bN3CzZHJkz1t1VvPPCyx5
         HzIrP8C1WxjOMjVNXsW86esaveifbjsdbtpWNxeG5Q0B1srnoQ/3szxzpdqP1+SZIWm5
         fVXA==
X-Gm-Message-State: AOAM532gI3v9M2XcaER5K7AsrAMBDYBFZi45JReWGWYryLcHGGYwHn8P
	lZwpKELFgB331d9HBC66xNw33osjIE0=
X-Google-Smtp-Source: ABdhPJz5hYTDSGcjdT0TA02HN31/w8N7n1eI5wpA8jEBWfOQB5Y9Fdv1lPiy21CBIsGW4We1cqVVUg==
X-Received: by 2002:a17:902:9345:: with SMTP id g5mr16464516plp.202.1591057722470;
        Mon, 01 Jun 2020 17:28:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p190sm474461pfb.107.2020.06.01.17.28.41
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:28:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 2/6] ref-manual: IMAGE_TYPES, add tar.zst, delete elf
Date: Mon,  1 Jun 2020 14:28:20 -1000
Message-Id: <5edeb02f5154c17902b74739052e46d4223473b3.1591057623.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591057623.git.steve@sakoman.com>
References: <cover.1591057623.git.steve@sakoman.com>

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


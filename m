Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.193.1591057725745496494
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 17:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DMZsp5c2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id w68so3422491pfb.3
        for <docs@lists.yoctoproject.org>; Mon, 01 Jun 2020 17:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=IGnIeF+qx9o9Fxna4u0dZlOEn7CHhsF5DscllzNQhPs=;
        b=DMZsp5c2/cYWu3Mm8GB+pFUn8noZPSn006pGOfMYSv7n/NB6GDaMOLA2cRtiBJym5h
         XcXck2mHMMa5BhlvL7LlOi+S3dm785yirGb4jYXD3sudtJfr83bJYuGngZy3/4IsfPYX
         4mEznGUorDAyXi031DL2pA67HFl2DYXiwYp8aHhi+ExH6Fer92bBa1xT0evqIuYDXYa0
         fju+vqUJyy0TC+eZLw5GoPoORr8U0wBup6wNUWaOAo1Rl9JUcg8EiLZqEPpbsxqLUzaY
         llZJcvAa6IgRLglluHuq1oBk5QXREF1TdZS/KntKz3rejIUlUsSs7W8gOtg8GwAbwfjY
         x6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=IGnIeF+qx9o9Fxna4u0dZlOEn7CHhsF5DscllzNQhPs=;
        b=oM0lmK5wBuBLX0WxkcGUJFSckgEntVaIEUIvPercSR8ToH8PvqsneoRSij+kK3c5zc
         m2EpD+2fqEfoA89jFXJpfA5YWwKEngg8UiTFC8YN1u7S51in7VKm7x3rEC/t5ke3njow
         4zVQgp2xEKe5YiWjydomQ36ncVdwK5guem0LwyyCB2+5N2qb9qMeLCcY8u4jzi5IcJix
         HkxYRAl72pDZ1oJtmTKdpO17lKOhzvBKySArtbbYiY/9QEGVaUz2Xxd6zcKpDKbPE/v+
         FtLYdVQX/W3iPwwl6nbOhu4gBZQMUjFxVyiNeK+jMBqGVuQ6EleLvlQWmsIQ2+QBB/hf
         qb4g==
X-Gm-Message-State: AOAM530it9NcXJw3wNhKw5QSte+br/XYQ1XIQYzSEBJ3FIutqdQ8YTI1
	St4eThdeWp4d3PJ76+Br2x4TCpmsDHw=
X-Google-Smtp-Source: ABdhPJyH/O9aHpysv3k7sjUPD7viIa7WtksCwesDR+fHcmInmK32STdXfnRcvbbSDbwUx+BJzSAjrw==
X-Received: by 2002:a63:b513:: with SMTP id y19mr20045116pge.29.1591057724812;
        Mon, 01 Jun 2020 17:28:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p190sm474461pfb.107.2020.06.01.17.28.43
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:28:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 3/6] ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
Date: Mon,  1 Jun 2020 14:28:21 -1000
Message-Id: <7c4d45e50422fa6e6cb607b0df2abdbb41ffd6d1.1591057623.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591057623.git.steve@sakoman.com>
References: <cover.1591057623.git.steve@sakoman.com>

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/ref-variables.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index e18f41180..c3e3c5015 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -14033,7 +14033,7 @@
                 <para>
                     When pointing to sstate build artifacts on another machine
                     that uses a different GCC version for native builds,
-                    you must configure <filename>SSTATE_MIRROR</filename>
+                    you must configure <filename>SSTATE_MIRRORS</filename>
                     with a regular expression that maps local search paths
                     to server paths.
                     The paths need to take into account
-- 
2.17.1


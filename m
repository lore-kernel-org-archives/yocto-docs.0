Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.55.1589401280667215361
 for <docs@lists.yoctoproject.org>;
 Wed, 13 May 2020 13:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iYXTO0we;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 9so250210pgr.3
        for <docs@lists.yoctoproject.org>; Wed, 13 May 2020 13:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=IGnIeF+qx9o9Fxna4u0dZlOEn7CHhsF5DscllzNQhPs=;
        b=iYXTO0weFaUKerWxwt0PbHSa52vzC9fidZB8msWf67KxrZEz7SrLVcdCnEGi9WgenO
         fGcR0BxVdF9u4dBN5VCfp1YgL6FfjRn2GCcAMTYd1UW4cqJtuWSObMob71WYNNtWjNfP
         eBZyF9OAcKg3HA7p+I4Xg3Rps7luuMOc9LkA4jpq0LXKukLdwVmQQCplwb0UM7u5qE+h
         F7+H0oNbF2lo0QU4gdh6Mc6K4VWfrKK0o3ZHirIPrho3H3QJrgA+Z7spz1xCxAGkOY04
         o5Xz8YVLanqq/CqaZ81LIxbE/1jwF1s0enggSlUceYXPzH1bhsNTi0bxckkBitRKuwWx
         uOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=IGnIeF+qx9o9Fxna4u0dZlOEn7CHhsF5DscllzNQhPs=;
        b=Gm1gMwcxtNuVopHggXd9IbmdtB9IiK1YLfRrzv5wbSXob5f/u86uYe0+iFYuN/Lo8T
         j3VaixyOwHjvWKoLYlaGYnL3RL39UsEvIKfFId/X/fF+ASgIHHI/7rFdIcW6rMv8bv+0
         DLZG5b6uBsA32wPdIdOQxtMgKfRkNcg4TK5+haGbZgouMufocenVRO9XcQR4zjhI38bp
         Elh/5CaZ50Ry1MBuaLz8X3BXFU4h2qSbeQoAY38YdUwCKLbMnW4u46SUZqW+RqyAUDMq
         HkB60R27ZYCkMXctySEI1nr+K1wSiyO+XB0pX5dvst/0BQM8SKA79+SIl7zU2Hshwqzk
         Bb/Q==
X-Gm-Message-State: AOAM532sjghMR5iWM/dIDLzWvk/sTbsPwcF+BqlfR2i9c76p13dJQGYW
	PMwL11ANfqLWSPJs58VrdZEfnyH2v5a7aw==
X-Google-Smtp-Source: ABdhPJwdw12l9G1JE3w7JDGg/p0lVMi0/359mJIoioldRL9BDuMNgmy12IXyLA9sd95TDSK21XG2kw==
X-Received: by 2002:aa7:955a:: with SMTP id w26mr953174pfq.292.1589401279712;
        Wed, 13 May 2020 13:21:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m12sm462440pgj.46.2020.05.13.13.21.18
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 13:21:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 3/4] ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
Date: Wed, 13 May 2020 10:20:55 -1000
Message-Id: <7c4d45e50422fa6e6cb607b0df2abdbb41ffd6d1.1589308928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589308928.git.steve@sakoman.com>
References: <cover.1589308928.git.steve@sakoman.com>

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


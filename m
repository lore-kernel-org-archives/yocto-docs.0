Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.5803.1623841302161925232
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Jun 2021 04:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YDDpZ/Ib;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id y7so2163575wrh.7
        for <docs@lists.yoctoproject.org>; Wed, 16 Jun 2021 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADRIBkSNlYNM5YUbbroPLFBMk0ixbFqQowSfQgUUH50=;
        b=YDDpZ/IbWGEjIJbvuufZw3UpgcwEY2K8QGvwey4M9jFJ8SpOm7GJT256wNii9hreRc
         XD3AbRXNrO4WFMHN8w3/MyJrhY6vHS3dBIv2ZOMSaoFmcNNBTwnpkzanXV6B75PsDPpb
         cgGbeOcj1lGAeWi/peUNXXzrDSPTMVGZlY0FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADRIBkSNlYNM5YUbbroPLFBMk0ixbFqQowSfQgUUH50=;
        b=OsfA0FuA4hfznVsTD8CcszDK2dQQZM+t1g0a6K6oXHA/iSSBSlLZbkxclif7GZo7od
         Rgd7Em4aSs7AtNiiYp5JZipcxsWAcS/QWj+ious0BDn1FMm0oZz+670gdOFAaogHfmeG
         jZbilXITQYe/dzQJuE4/XMQiws0w/Or/cBQHbCqkMTgun9PKOLws8keSLa+01kM/tTzU
         hmlgxyxde2AuEggVHKZbaOL2gnej8sAW95tHB+0m0InCJ/dX2CUiuN+tw0mqeuWeZpr9
         tpcGkJrgqEFumE6rqWMTRnWM3edGYpDbHsql0LVvZDVKe71TUdeGF6Tq8nfA8Jwu74Ig
         szpQ==
X-Gm-Message-State: AOAM531EGemB1EL3A2R3KQ1FtjxVF0u9i+z6oYzwFD1bbKnCO5Bk1tKP
	4E+BWSGtufCaVs9hxPR2rcnwBgW1KMdiDw==
X-Google-Smtp-Source: ABdhPJwa1m/q0oomd+jZmzvmBnXEs8lG9ZE10mV5k7zMmumRWkGORGmy+BBr7t88JKUljoz6VLyADg==
X-Received: by 2002:a5d:4c8f:: with SMTP id z15mr4636505wrs.131.1623841300262;
        Wed, 16 Jun 2021 04:01:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1d6e:bde3:735d:6a7d])
        by smtp.gmail.com with ESMTPSA id g186sm1544654wme.6.2021.06.16.04.01.39
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 04:01:40 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] README: Tweak as the website isn't really new now
Date: Wed, 16 Jun 2021 12:01:39 +0100
Message-Id: <20210616110139.3337372-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/README b/documentation/README
index 3ad23a902..f9e803a28 100644
--- a/documentation/README
+++ b/documentation/README
@@ -88,8 +88,8 @@ documentation.
 Yocto Project documentation website
 ===================================
 
-A new website has been created to host the Yocto Project
-documentation, it can be found at: https://docs.yoctoproject.org/.
+The website hosting the Yocto Project documentation, can be found
+at: https://docs.yoctoproject.org/.
 
 The entire Yocto Project documentation, as well as the BitBake manual,
 is published on this website, including all previously released
-- 
2.30.2


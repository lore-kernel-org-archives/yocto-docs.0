Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.59.1589401271305021855
 for <docs@lists.yoctoproject.org>;
 Wed, 13 May 2020 13:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DuIHQ7+2;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id f23so247734pgj.4
        for <docs@lists.yoctoproject.org>; Wed, 13 May 2020 13:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ro80lt87UEX+GQO51uNDT3cnB7wkvoq3abzCmH24JDU=;
        b=DuIHQ7+2eMuIxT/Uwrxb9NPB8ef4x+X7alHpQVTB0jIMUCsKnk0GkK+k8X+3acevaF
         AjmAZV8IZhlfa0pzwtSuREKntLfvzdPrgbwc7UFl+isbqF41ihYqbq8yednPdwVi09J2
         M0k4bSrP6KzmrlUppO2HEXfc/qv9B67cOri3lbXoDq+yf4VQSn35XgkLB0brLXJR2x6W
         EszGp5imh0ZPONn9jBAFDCHCIqGSs6DttCtO6C2s72e/7n8b+oB71Gt5TISMDNWAvfQ9
         IzF6CUGXx7CU7EeNGMwCrIF4Vx2ZFhiwrYKIX/oajDHhHeIuaQ43cY5LrgBwd6QLMxTE
         BC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ro80lt87UEX+GQO51uNDT3cnB7wkvoq3abzCmH24JDU=;
        b=g1+nrPqjz5LLoGl34I4Xh+L01FkG576RaXFqrOCb4EOsQReDSTH2JIKcgpkIYFRh1j
         F7vFmANKMvFlh3NVu3lB14jylUVpCzeMknJgsP0ia4ftI59g/koQ/XfUPmkj7Lgcpf7C
         dRw5pqqa53dtGXNRHoqMDyA47cpKTsVSmHySOn+7wpfsig3Pt1t+w2DgJVePJbwxKA57
         Td7CsDSEP90ir34wpuE3fZu6a1Gk1AjWbYDlSjHw7iKFvAV0ru6ebMoZe8VbiaOoSvAG
         ZXhU5l4oXjSAy+ffziVPIvcd8UOpRvxfSUK+ln9MY75+63MvMyD0p80xXbM3J54EuDCt
         tKrQ==
X-Gm-Message-State: AOAM532TVWiN/vAx5SWT8vzwb5lrx9TwYH5eClsLH9PA7+rQrphCB+QN
	FFsZIC4HN86u1AUelMnY44v4OZRwydPBXA==
X-Google-Smtp-Source: ABdhPJxT40qgKAbo0udVEvxQWOAWx6mhx+v3gwyDV0ezy3w8cCN35sCO3029iW4eAr4okletwYldMA==
X-Received: by 2002:a63:1c55:: with SMTP id c21mr959181pgm.328.1589401270347;
        Wed, 13 May 2020 13:21:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m12sm462440pgj.46.2020.05.13.13.21.08
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 13:21:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 1/4] ref-manual: fix excessive command indentation
Date: Wed, 13 May 2020 10:20:53 -1000
Message-Id: <e3a74639609e99357b23a5702c38a7a943713cdc.1589308928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589308928.git.steve@sakoman.com>
References: <cover.1589308928.git.steve@sakoman.com>

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/ref-system-requirements.xml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 7d3c71998..7a11ec2cf 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -503,7 +503,7 @@
                         </literallayout>
                         or run the BitBake command to build the extended tarball:
                         <literallayout class='monospaced'>
-                            $ bitbake buildtools-extended-tarball
+     $ bitbake buildtools-extended-tarball
                         </literallayout>
                         <note>
                         The
@@ -535,7 +535,7 @@
                        </literallayout>
                        Here is an example for the extended installer:
                        <literallayout class='monospaced'>
-                           $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-&DISTRO;.sh
+     $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-&DISTRO;.sh
                        </literallayout>
                        During execution, a prompt appears that allows you to
                        choose the installation directory.
-- 
2.17.1


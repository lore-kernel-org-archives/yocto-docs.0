Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.200.1591057721346739099
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 17:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YWKGPAVx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id p21so4238198pgm.13
        for <docs@lists.yoctoproject.org>; Mon, 01 Jun 2020 17:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ro80lt87UEX+GQO51uNDT3cnB7wkvoq3abzCmH24JDU=;
        b=YWKGPAVxrO9PtfhDe/169tlmIdYguhLzyxJpL6eiUSHJLw/RzFFSTgmUI5hLeJfU9Y
         ra3IlaVZsdOGMzePCw8p881R3F20Df7tBH1bMJgqfBemaa6s6a0n+3dlGD9xEmBxxUD7
         7hPZ6OW12l1QJp4fVaADlPKbcgyYFlVxx+NOevSrt40ka5+ZQcP7DHDu833Iyf+o1+aW
         1D0ZUWhpPZA9Yo8DBfyW4daaWsn4zOeySjFxeAGEr44eBu4ydn7ZLVkfO1YElP3BYLXv
         6ZbWc9ybIHw2qXjQTe2khOZ1r3DEyIc9LfMjmnNwqkkR5IPaIlG4/4sih0McI5IFlCTL
         AQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ro80lt87UEX+GQO51uNDT3cnB7wkvoq3abzCmH24JDU=;
        b=CMFmxvi/E853rEjB961ZuSJztdaiXCpKqkn5eMe90JH9HJQJnrcsUK8ieV36IB+hlj
         uX9UvuQVO26khCsHDwP5iEqc6T7FCC54g2PAnNOCZLr5a7ZmbFKTTJlFYFbVlyi33oz1
         OWf19KuW857l0Z7xw4+XyDhahLD8e0sv+rzO5QnfO/HsUwl9fYtU/n7IxPEvoGhZdVBZ
         bZOzpLiaKi3R0xkzalnx5hNveUNLsRIEQ2CUirb64yLvxiTuhpiK0cR4UEOuvnX3z96A
         mydgnT//TPJiAF0rvoMsEaC4JTVsOOWwElKM9OZORN1EEaI2d6OIOkDIvZLk+r3yDJVr
         3ZDA==
X-Gm-Message-State: AOAM533pSa/HjBYOSfHYqqVKrFRt/t013vCGVZne1YW5ohiWX0J7y5i5
	eMzLhL4jtyyW9+omm4JBnGwKfOF5sg0=
X-Google-Smtp-Source: ABdhPJzga5KXELHiyePHgn+3kEG9e+12xk+C9M7AzrJfpsUd3yrHaWnVezVMqVCux/vtD/XPbHmxHw==
X-Received: by 2002:a63:33c6:: with SMTP id z189mr22205560pgz.426.1591057719975;
        Mon, 01 Jun 2020 17:28:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p190sm474461pfb.107.2020.06.01.17.28.38
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:28:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 1/6] ref-manual: fix excessive command indentation
Date: Mon,  1 Jun 2020 14:28:19 -1000
Message-Id: <e3a74639609e99357b23a5702c38a7a943713cdc.1591057623.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591057623.git.steve@sakoman.com>
References: <cover.1591057623.git.steve@sakoman.com>

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


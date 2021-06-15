Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.425.1623776330230886311
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 09:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qFoGRdvk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id k6so2441996pfk.12
        for <docs@lists.yoctoproject.org>; Tue, 15 Jun 2021 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Pqmt6i8awRF6J/DTADEYVWw5WYwetd9eLwaoG6vZOt4=;
        b=qFoGRdvkGKgSAoGKpRJZNQUCNQUj3FUVNPBnBqJbu93eIayHkw0G9pEDGOwJEvTlm/
         eVnsPVuz3AQevsjQbMdcFvYOBZoghLh/wKAaEB6vcgZolTwW/DHBE1ZIRwraMrUVc/3l
         YENWM/Gf83js1sAo2AEQZ/+eaHzKosOG2e/em6tlhWvmTBjTmb6fbWY/jCp9c2pkECLJ
         By/aVpM1IMadjtZ59Ndx6F1jbh7DFMJ5JneQ/jLPEeJwcQ/qlQWuLyctlEE9VBcnoC8Z
         lGoZyS7Ymo0DsL33UucmXYQQUNzEe8UyjzZqKhdzhBD92YFjkm+Dz8d2K2Whii8VUFrx
         I6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pqmt6i8awRF6J/DTADEYVWw5WYwetd9eLwaoG6vZOt4=;
        b=Ve4dS5IRGNr1pYyqe3uIuXcBNENNMWpqvhKVdeckXqgyPorc7K5ESWBI4tGl9Ie9Ly
         IBg7G4cSUe4afDSy+4kti+io+Tpx8AAij8FhLZyemj+2sWjyxBtqPqVuTS7BPjo7XCXk
         6NoHoikjFMjTNietSg5pr9YYUV7clSjwG5vhypHZEDQSSpYAHFFurNG+FZUaQg3KtjzT
         rv2jZC4Tv3LOoFvilyWeHbNna0juakgBwFjnydc7eTXxw3akV246LNLsCY3Od+wLICYU
         YsZ4tAOFUBQPHPh5mDbq2Z/Tm+BtpPsDVPcXzERTbYUy2FmlLGNyXaPtGXu3qLaBXYHu
         qaEg==
X-Gm-Message-State: AOAM532pAboi2WKrkJvSejYAUTdczaQBNxuVsKNznXmz36eCLf9aS9Mo
	ODaQeGqXERuN/MKxBAFG4qMVrNEc4rIeF7rg1V4=
X-Google-Smtp-Source: ABdhPJyAPsNRuW9JlliqIY0J/1MO83ysDIF+xgICnDJLrBk0bXGTlhxgYQmbHwCHH2kjEVF0fbW8wg==
X-Received: by 2002:a63:5446:: with SMTP id e6mr463396pgm.73.1623776329082;
        Tue, 15 Jun 2021 09:58:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id z3sm7862741pgl.77.2021.06.15.09.58.45
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 09:58:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 1/3] variables: Add documentation for KERNEL_DTC_FLAGS
Date: Tue, 15 Jun 2021 06:58:11 -1000
Message-Id: <b3d3149a6fd0704661f8c5d38c92e032567a81d4.1623775736.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623775736.git.steve@sakoman.com>
References: <cover.1623775736.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Add documentation for the newly introduced KERNEL_DTC_FLAGS variable.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b2d5bf48fe4e76446a38762839865176294a4a3c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/ref-variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index a8375cd37..db0cc2d66 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -3811,6 +3811,15 @@ system and gives an overview of their function and contents.
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
+   :term:`KERNEL_DTC_FLAGS`
+      Specifies the ``dtc`` flags that are passed to the Linux kernel build
+      system when generating the device trees (via ``DTC_FLAGS`` environment
+      variable).
+
+      In order to use this variable, the
+      :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class must
+      be inherited.
+
    :term:`KERNEL_EXTRA_ARGS`
       Specifies additional ``make`` command-line arguments the OpenEmbedded
       build system passes on when compiling the kernel.
-- 
2.25.1


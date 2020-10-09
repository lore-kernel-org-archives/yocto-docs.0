Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.1225.1602264213839300532
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Oct 2020 10:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=O9lW/Rv1;
 spf=pass (domain: linaro.org, ip: 209.85.221.67, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f67.google.com with SMTP id g12so11078095wrp.10
        for <docs@lists.yoctoproject.org>; Fri, 09 Oct 2020 10:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DaM7bS6+FckrvInkqTrdiDE7sXHllkrcqHzstSH0csE=;
        b=O9lW/Rv1Bypj9X2+SPVazHkXnQPlrlZES5QrUuerK5HQ2W+dDttJeRWFfQd/7mV3dP
         OCCW8v2cXy4Qn87mu4gbvnPChkCu0/4bb6lqp8DqJX2Dzp9MEGlSnqq0l9Euzs9uSoeu
         OXlq23II0Af/P3m78QbQv5z4BncO+SwqQBupm1e7EGwEoFJJwnAJEuBwTFeF/kkWKETY
         h65/k5IXCWdI1NlrcBciSNvobqPGeQkjN64D0Nm7p7eRyzQ0/IMveCHXXi0QrkC12Y8m
         nOOq8f+A1Hy9W4G2iVuYzSmYlomRYl8KmH2dqBKY6Dx+enTxQs/A8FahwzY4j+7qsW1N
         us2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DaM7bS6+FckrvInkqTrdiDE7sXHllkrcqHzstSH0csE=;
        b=d5/MbfvtU8p1Z3Za7tluxdnNSKdnZQWlJy/XsiBI4h7DOxCmOdO99TZSE2rKPr/7P7
         WSyO/Hq93Hm7RTYabSXP0TOZ3A3nQSO77us7aKDWUTPT4+dqALxAVFn/sA12xmzUvOLA
         9pBiiLknsGj46h4eeOQeqKP+gf7LwVRw4sKv8uEX8/ktFAE++fjWVVC3LxtNFz6J4PEl
         vfbrHGgEsPYxf7XlTvCTLZaVAGJUbn4rNpDQbOhsbhDqTlA0Fhcm+foRlhQdgO5b6a6f
         fpEzD6+Lz3hvxriOPj5TXar5vgt7N9s9fA/xcjcoyorFu8CsIwjYnkzwVWzcQ7HsJnmy
         SdyQ==
X-Gm-Message-State: AOAM533/WotfP7uedyawzQm0zmrQMVlIzl8kyapy9XF70nrzJBvfjGN5
	TOQ13SpP1VmKUgvPeDqPTXs3Z9h+PuUbWs5m
X-Google-Smtp-Source: ABdhPJyaEvfggeUMHzCmVypq6vRavLBo/sa2Tq76Rd+pCtP0qB8Xy1ENDFiXoKtfgMTtsGsm65DsKg==
X-Received: by 2002:adf:eed1:: with SMTP id a17mr15970311wrp.401.1602264211637;
        Fri, 09 Oct 2020 10:23:31 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from nikaia.localdomain ([2a01:e0a:1b9:3e10:d6af:c5d9:8b6e:b994])
        by smtp.gmail.com with ESMTPSA id e18sm12904982wrx.50.2020.10.09.10.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 10:23:31 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] sdk-manual: use built-in footnotes
Date: Fri,  9 Oct 2020 19:23:17 +0200
Message-Id: <20201009172317.216853-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current HTML output is bogus, because we have a fix of * and \.
Sphinx has built-in footnotes that can be used in this specific
example. let's use that instead.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/sdk-manual/sdk-intro.rst | 33 ++++++++++----------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/documentation/sdk-manual/sdk-intro.rst b/documentation/sdk-manual/sdk-intro.rst
index 5a346fa6e..acb3f455c 100644
--- a/documentation/sdk-manual/sdk-intro.rst
+++ b/documentation/sdk-manual/sdk-intro.rst
@@ -84,9 +84,9 @@ when considering which to build:
 +-----------------------+-----------------------+-----------------------+
 | *Feature*             | *Standard SDK*        | *Extensible SDK*      |
 +=======================+=======================+=======================+
-| Toolchain             | Yes                   | Yes\*                 |
+| Toolchain             | Yes                   | Yes [1]_              |
 +-----------------------+-----------------------+-----------------------+
-| Debugger              | Yes                   | Yes\*                 |
+| Debugger              | Yes                   | Yes [1]_              |
 +-----------------------+-----------------------+-----------------------+
 | Size                  | 100+ MBytes           | 1+ GBytes (or 300+    |
 |                       |                       | MBytes for minimal    |
@@ -98,29 +98,22 @@ when considering which to build:
 +-----------------------+-----------------------+-----------------------+
 | Updateable            | No                    | Yes                   |
 +-----------------------+-----------------------+-----------------------+
-| Managed Sysroot*\*    | No                    | Yes                   |
+| Managed Sysroot [2]_  | No                    | Yes                   |
 +-----------------------+-----------------------+-----------------------+
-| Installed Packages    | No**\*                | Yes***\*              |
+| Installed Packages    | No  [3]_              | Yes  [4]_             |
 +-----------------------+-----------------------+-----------------------+
 | Construction          | Packages              | Shared State          |
 +-----------------------+-----------------------+-----------------------+
 
-\* Extensible SDK contains the toolchain and debugger if
-:term:`SDK_EXT_TYPE` is "full"
-or
-:term:`SDK_INCLUDE_TOOLCHAIN`
-is "1", which is the default.
-
-\*\* Sysroot is managed through the use of
-``devtool``. Thus, it is less likely that you will corrupt your SDK
-sysroot when you try to add additional libraries.
-
-\*\*\* You can add
-runtime package management to the standard SDK but it is not supported
-by default.
-
-\*\*\*\* You must build and make the shared state available to
-extensible SDK users for "packages" you want to enable users to install.
+.. [1] Extensible SDK contains the toolchain and debugger if :term:`SDK_EXT_TYPE`
+       is "full" or :term:`SDK_INCLUDE_TOOLCHAIN` is "1", which is the default.
+.. [2] Sysroot is managed through the use of ``devtool``. Thus, it is less
+       likely that you will corrupt your SDK sysroot when you try to add
+       additional libraries.
+.. [3] You can add runtime package management to the standard SDK but it is not
+       supported by default.
+.. [4] You must build and make the shared state available to extensible SDK
+       users for "packages" you want to enable users to install.
 
 The Cross-Development Toolchain
 -------------------------------
-- 
2.28.0


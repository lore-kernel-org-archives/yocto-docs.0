Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.12165.1604932460582611859
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 06:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=X4LjovV7;
 spf=pass (domain: linaro.org, ip: 209.85.221.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f42.google.com with SMTP id p1so8894121wrf.12
        for <docs@lists.yoctoproject.org>; Mon, 09 Nov 2020 06:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nWwC2Cnmp7UqXsf17vzZa+L24CizREVZUzfxWcsRLsc=;
        b=X4LjovV7Mz7A3hHFsAsbugD6+SxLqimYeKpje6ScLizPGcp2qndUcmDk88s6Txy97S
         83ybnP/xJHUraQZ1AU9ZnB3Y8EuO8AYKhrP3lzfAPK75obc7b++kOhCeQJgFif5EoVws
         kpuJ3ehZBRxTJsJZ8+4v7c90H9BItN1IbhIlbayz7CWFsmeNjHzUrDMEJ0EX0LADDAuI
         ICrzEHrZlB6zzI1VRS1voZaT1Wb+IpS/VmxFvdtVLhWi9fxbVW+RBTvuMpBs8jm/PP/b
         Eq7n3/jMIzFr8DlQX6z/z9FTePe0X4lzy/OTWNcTg+AbSvMChafsdDIAWVqPa6UniPSI
         m7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nWwC2Cnmp7UqXsf17vzZa+L24CizREVZUzfxWcsRLsc=;
        b=h9hrCEF/FBIMi27Fx2JDNGXArSXklvGNqWrOX9Yd4S98gnIamRXXNi1XzMQ3TofUWE
         8Nc6tdHD+3wor1Ctq2inaRLfGtN6squD5By1hNFzbCsv3O1e+cK1JVo+DeRTSVZz629w
         PZRprSp547JJAPe8HAv9hVIcW1HodfVdldSLyhxZn332EFWVL1VAHMZVGqxuVO1gcjj+
         37LMmgToy2wbpffA7XDdCKtE9yxUbKwYO9wL6D2RWDKzgrCPsjSOnB34evCMM9BW+GJc
         uooaku/eLD+ADM8wcce0bAD/ucp+ntsTZBMpF0+wzvqZVBq6Eb2/8yY/qAAfBZfZnnKj
         ypNQ==
X-Gm-Message-State: AOAM533S8axO0WVMUQV3RWN4IMvqPsvXkNeRsrVEh+OQOzcMKO9OQGjT
	oXUR0MlL+Cg78Q/O06S43iJpLYpuZuO97E2z
X-Google-Smtp-Source: ABdhPJza6m86QuJaWy7p1qpC7UDJDkZbFIHZJ5CpPYWwCMdmQAMTwPaLlCyRDa0/4BlTe9mtWQcYIg==
X-Received: by 2002:a5d:6310:: with SMTP id i16mr18202621wru.284.1604932458696;
        Mon, 09 Nov 2020 06:34:18 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from nikaia.localdomain (91-166-228-248.subs.proxad.net. [91.166.228.248])
        by smtp.gmail.com with ESMTPSA id o7sm14219611wrp.23.2020.11.09.06.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 06:34:18 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [gatesgarth][PATCH] conf: use bitbake 1.48 branch for intersphinx
Date: Mon,  9 Nov 2020 15:32:15 +0100
Message-Id: <20201109143215.277618-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We now publish the branch 1.48 of bitbake docs to
https://docs.yoctoproject.org/bitbake/1.48/

yocto-docs can refer to bitbake documentation using the intersphinx
extension. The gatesgarth docs should refer to the 1.48 branch of
bitbake, not the development branch.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 5d8a7af30..ed8c5c033 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -82,7 +82,7 @@ extlinks = {
 
 # Intersphinx config to use cross reference with Bitbake user manual
 intersphinx_mapping = {
-    'bitbake': ('https://docs.yoctoproject.org/bitbake/', None)
+    'bitbake': ('https://docs.yoctoproject.org/bitbake/1.48', None)
 }
 
 # -- Options for HTML output -------------------------------------------------
-- 
2.29.2


Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.6979.1605779932775705038
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 01:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wbwCrTjA;
 spf=pass (domain: linaro.org, ip: 209.85.221.51, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f51.google.com with SMTP id o15so5770086wru.6
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2020 01:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1gjhmHeCqE7wLebrVHvZGI6TRy6mK6Z2JaXlYvM0p1g=;
        b=wbwCrTjAzjRRtQpzUsvc5TdiM1T9MyP2tiKZDmQsjhZpCNlKynJ8ZCosnVySqhTtos
         H8Nma7IrlSc/Y6mVbI++Z1JXXnepNpTtrqajEI36oFUFvdOUhDAvpef+dMZ+NYYqdy/A
         OHITd4FRJ5dQRm3oiDBdNZwAgqKkeHdhdgqwczNY8Ug+k+HPCzylBGS5pxqerZpAAa88
         cZfwyEa0TVh//bFxMekC4AHZ57A0LEY9cZLXuvBw+zr/ZYXEqecewrFrTsqQFEsqI5hS
         tAwoKgSNL+OvIQcc62P2m40JPY2Vr7sy17byz7wJkU5job7Lq12WASivCYPx+pRlMyZW
         QBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1gjhmHeCqE7wLebrVHvZGI6TRy6mK6Z2JaXlYvM0p1g=;
        b=gRpoG9mVgGhE+wA65vqkZ+OQoErDylbbnYeGqedJx075gthX9/w3A5Fp0rM+mPNerr
         lo885SBMs56HcUQ292YA74VeoTH8DS8bRHBrdBKTr/vCr7+2qbI2W8qsyuDUCL4a5e+8
         o62Q1/bkV0H/z9fa1nUlMCoVX1WqkWq0RpAb1vOoxumV/bTljZCk1T6PwGAgc9X1mBvG
         uQW37f5c6dI1lvX+yQcl0S4lOCu6bN77/4rZWQ6e+dOsIvtL6ul/AOti/gjzmVk0+5qJ
         IKyVMq17UYDE0CbqSoZSqKe974fRO7I6dBs0E9lH5tL6LjBDCzScng4/cknZ+oyDki9i
         wUKA==
X-Gm-Message-State: AOAM531mnAKrmqm6z6/PTF29ah0V+4NXiFPi+jBey88vIfYKoFvE25l1
	46mN1BEM6V6m1hzP+xB1HOqckT/OGkfFfpuQ
X-Google-Smtp-Source: ABdhPJxEwxm+LRgR9mHvX/wJFCGAyxm2ULxEzZctjDLsbxPrE/wwzJvEVmB/7ftnH8LbwEwp+Z4A+w==
X-Received: by 2002:adf:c388:: with SMTP id p8mr9292164wrf.307.1605779930944;
        Thu, 19 Nov 2020 01:58:50 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o14sm34725288wrw.4.2020.11.19.01.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:58:50 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 02/11] sdk-manual: replace labels with references to section title
Date: Thu, 19 Nov 2020 10:58:25 +0100
Message-Id: <20201119095834.284864-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
References: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/sdk-manual/sdk-appendix-obtain.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/sdk-appendix-obtain.rst b/documentation/sdk-manual/sdk-appendix-obtain.rst
index a51c22e39..8b0753969 100644
--- a/documentation/sdk-manual/sdk-appendix-obtain.rst
+++ b/documentation/sdk-manual/sdk-appendix-obtain.rst
@@ -248,7 +248,7 @@ Follow these steps to extract the root filesystem:
    installed the toolchain (e.g. ``poky_sdk``).
 
    Following is an example based on the toolchain installed in the
-   ":ref:`sdk-locating-pre-built-sdk-installers`" section:
+   ":ref:`sdk-manual/sdk-appendix-obtain:locating pre-built sdk installers`" section:
    ::
 
       $ source ~/poky_sdk/environment-setup-core2-64-poky-linux
-- 
2.29.2


Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.3013.1606384123732576666
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2020 01:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Z3+wIhny;
 spf=pass (domain: linaro.org, ip: 209.85.221.45, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f45.google.com with SMTP id 64so1405443wra.11
        for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2020 01:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0sfLXqXtP/RUgGf9x6s95Vbf3l0bYW19f2Phg15mdpc=;
        b=Z3+wIhnyNddQA1ftGqeJ41dV2mWRKVhtOq5+HWf0th9t+6ACXzGBxkAuIl3x4Xo8tw
         2vw8NquBdYgz3eMvv9Cwt418t2kl+4ARj+TcUi8k+7Qj0y1zXNhkaPF0Nl7MHFbd4/bd
         YNm49RH5VDiwahza706ah9ec7B3SAs7Z4v9JwidFqW/FEXQipTeE9ok1GJX/Z++Xhi2x
         GBKu3i0MIHJyIAOHSXpTQ+iu+ENP9jNRH3mlQ6vvVMeJcm2ibAfy51Lg7veSw6s6l4Mf
         zQbZ23JkGYToAHGKq8D2z4F06uxAtoMXDW+T6Ert+aLnSWMGJj/fCbkJj3hhtrc92oEW
         k/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0sfLXqXtP/RUgGf9x6s95Vbf3l0bYW19f2Phg15mdpc=;
        b=d/pvKxcLlrcBIkirionE/4AKf8i2RWNp56fkzjce6MYcun6DvxWJ5LI4Yfh1CmZ4Um
         0pcnKisfP8EMgmrpX3IuQ1k8qis8MfNfh5BiiGzynj3Bi3TQciRvLbmW0QPsXaFFA0YS
         ItxKB+NEVXOeQysM59MYAGA+3/GqZLwD32Fqu7u5NtCoF8rfyqZ526ng1cmwoq+rD7Qe
         +Uitj4vF2hkB+MJFeSTl5ZKrvGsIm+kv95k2EQKK/QLdL+oxm6L9vgafMxBxQXJVNWJy
         FODHMRlifAIthKEWVrIFzmCpcJGsOrZqqiOtmRkxAjHsOCwr0G5Vt3ki/+w0lnikSCgS
         uixw==
X-Gm-Message-State: AOAM530b46cfgfELGSBKH6LKBCvsrhPUx89xcRN0PHXvA5WPd1bDpBmy
	zC8DFG2gVEwIIZ17GvqK5yDgYN5hzAprzeid
X-Google-Smtp-Source: ABdhPJyei53GYXbEJc3aOeI1Cyhqe66aGBAfr6CgG3/EOvz25GZBm6S/GYZJ6O/g0B+9Iow+uKXH2Q==
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr2754422wrw.123.1606384121908;
        Thu, 26 Nov 2020 01:48:41 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id a12sm8759590wrq.58.2020.11.26.01.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 01:48:40 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 2/7] brief-yoctoprojectqs: replace labels with references to section title
Date: Thu, 26 Nov 2020 10:48:22 +0100
Message-Id: <20201126094827.95641-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
References: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index f8c3ad974..f6d863f5b 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -244,7 +244,7 @@ an entire Linux distribution, including the toolchain, from source.
       $ bitbake core-image-sato
 
    For information on using the ``bitbake`` command, see the
-   :ref:`usingpoky-components-bitbake` section in the Yocto Project Overview and
+   :ref:`overview-manual/overview-manual-concepts:bitbake` section in the Yocto Project Overview and
    Concepts Manual, or see the ":ref:`BitBake Command
    <bitbake:bitbake-user-manual/bitbake-user-manual-intro:the bitbake command>`" section in the BitBake User Manual.
 
-- 
2.29.2


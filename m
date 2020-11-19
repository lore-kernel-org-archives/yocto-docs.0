Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.6978.1605779931785998904
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 01:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=j2JdEQ47;
 spf=pass (domain: linaro.org, ip: 209.85.221.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f42.google.com with SMTP id p8so5773388wrx.5
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2020 01:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rx1RAvdbbit+m25bId9BINb/LZkTP9C2m73FEiO/B5Y=;
        b=j2JdEQ476+r0cuVs6K6uZXXZ7z4Pe5+NbS9rzeLnzc1VZq9mVNRRONdIboOPkKnLON
         GEs4I9TfqwPYQ8ApnxZjSlEXQNCBaasvxrtgIrG/ehyAFXm+i8RIKaQez4Z9wpjjWgOX
         88S23++LkZAfLAxUN0Jlyfd95eKhY5D4fUC0XeSxJb/lcHDaCkE+dc/5nlDypxlqsffo
         1YEX/8xiliKGP/XG6/Lj1fdVtL8dYxXFo1f+wGYz5vgcaludDZrSK6XvEYegHTj75mmv
         j1pcUYxyi/d2fCgmwanr5fEJFkQb8B94oT5C1zqr3w8Gpk1FG2ghiMND5xOOeFFAIMgF
         wg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rx1RAvdbbit+m25bId9BINb/LZkTP9C2m73FEiO/B5Y=;
        b=XTJQcTuZo+dqY8szzQKwpygGEBSP14ExD9e9779IAivZAtoSRTdgSfsrIcFAebagMc
         eu3C86DvxaJEW4Xjt3mPBySJg+yE/qSFzQQWRDi7khVmHkil7+PqJbBqKgJhH9TUJV8v
         GPYuQnq9Uz+HyFJJ8C+T24tAjTu9CiqdaWgEcKXIOr9RN/jaRh1Cf4VXDgbGwXBBFseh
         tJoscGWMEbRm2MNkWxSeol3IEPrW2aqkgnXy7dBEBs+hPyDRD0QHFJOZf+jSpcBfdQbX
         8FgUYEhqPXO1mQxca/KgmsfL4BlrWK4rkXPB+mJ2AksiL7W4NQmh/1Nylz6RH50YHS45
         ySuA==
X-Gm-Message-State: AOAM530uujYn7JAPZIFHOVkZjmevDVjDm07Ajs0DSxZ6WAN2XOPV9tKg
	vcU0cnKGpcanSPywLEwrufOVo5urkOHDBEZF
X-Google-Smtp-Source: ABdhPJw+wRIYqzdzeGMxYp/g+qEv7hT1sBKaC9jKbsUAwzkqEQdhua9qv3hV1F2irDRSKSKl47IDFQ==
X-Received: by 2002:a5d:444c:: with SMTP id x12mr9325388wrr.6.1605779929977;
        Thu, 19 Nov 2020 01:58:49 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o14sm34725288wrw.4.2020.11.19.01.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:58:49 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 01/11] what-i-wish-id-known: replace labels with references to section title
Date: Thu, 19 Nov 2020 10:58:24 +0100
Message-Id: <20201119095834.284864-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
References: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/what-i-wish-id-known.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index 593c6fe14..afc126382 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -135,7 +135,7 @@ contact us with other suggestions.
    valuable links: :ref:`dev-manual/dev-manual-common-tasks:Using a Development
    Shell` for information on how to build and run a specific task using
    devshell. Also, the :ref:`SDK manual shows how to build out a specific recipe
-   <sdk-devtool-use-devtool-modify-to-modify-the-source-of-an-existing-component>`.
+   <sdk-manual/sdk-extensible:use \`\`devtool modify\`\` to modify the source of an existing component>`.
 
 #. **An ambiguous definition: Package vs Recipe:**
    A recipe contains instructions the build system uses to create
-- 
2.29.2


Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.1243.1605167548047977320
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 23:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wYmG0Zqy;
 spf=pass (domain: linaro.org, ip: 209.85.210.178, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-pf1-f178.google.com with SMTP id c66so3763397pfa.4
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 23:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yFhb7Nl/ctvVkz+YNFGlSocyRz46jYo57RZ9l2MRMwE=;
        b=wYmG0ZqyNINn/Mjk4DzQE+zaUNz3VY6IkY6v+rgVABisdR4bA+1tPZnupHis/hSiKQ
         1Vc1KI3VyFJkkkQzEr6/dQ00prcf9Ez4f1vCUAoZTebliAHRnZBC87qOzm1ieXj2EN5X
         VppwtVnfuGC9IptJd9s/pdA2JQJleZLQVVfaHpJFZpblQ9gIGuv5sH1lTf2fJFH8KwQQ
         jDawB1zuTnCHl9K389Aqb8gpntfD7QoR3KqD45LTALo+Oqr0G2wT0mPa+2y0inG5sAih
         sGYq3wLQV1Bluw7p5j8gtSKzg2CUNzmQ572uLpjj6b7ypLZewIDx9lYopTeXTM61Ef0M
         3htQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yFhb7Nl/ctvVkz+YNFGlSocyRz46jYo57RZ9l2MRMwE=;
        b=KTpDvC0RgkVcFC/cQK19SqdUI22KntR2N6FzTlwkipm/pqQHnxZiPBfBRqQOHWs0r7
         +441bGC4DEK3tdrb7absmfj6hB79Bfn4oLpk8hR9e39z7snL65L6PdtxKvV03F3Nx7KH
         ZevjWlgziXEqrAYaI9rN/t7+HwzvQrU/yo1E2PWDm9mZhPZS/tSUMQJSIUcxkCMLeLKV
         /1d4gtbXiwej/MQIVgzbYo0lMyTCbq8QY6UEXJZMeE2sbJPVMuPVsRZdUA4fxvVsNoQF
         NHkYY+EiggA+DUD3yxUC7Ofk9THkZlKiu++JwtYvMLN5A5zlgo/GoKzmd1R1D/c7xbyL
         SVVA==
X-Gm-Message-State: AOAM531zBDbskVtQEkNrtGoiMskDuessT9WtLy2ctFWx73zW2zBkueD1
	ECitdkEzozhIaAWY6AaKnYYQZyPNXV0rUksc
X-Google-Smtp-Source: ABdhPJwDG2HTaosv+/JHg8ctBHqpqYfgqJF1pNA9asKCJ8Fq4yaVvqQ9t71934XIZ2UKsS24XW/cBw==
X-Received: by 2002:a62:32c5:0:b029:158:7361:58d3 with SMTP id y188-20020a6232c50000b0290158736158d3mr26981129pfy.75.1605167547304;
        Wed, 11 Nov 2020 23:52:27 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id c28sm5720323pfj.108.2020.11.11.23.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 23:52:26 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2 2/2] poky.yaml: updates for 3.2
Date: Thu, 12 Nov 2020 08:52:06 +0100
Message-Id: <20201112075206.113124-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112075206.113124-1-nicolas.dechesne@linaro.org>
References: <20201112075206.113124-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates global variables for 3.2 / Gategarth release.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
v2: fix DISTRO_NAME_NO_CAP_MINUS_ONE

 documentation/poky.yaml | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 85f42cf07..e184fa829 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.1"
-DISTRO_NAME_NO_CAP : "dunfell"
-DISTRO_NAME : "Dunfell"
-DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
-DISTRO_REL_TAG : "yocto-3.1"
-POKYVERSION : "23.0.0"
+DISTRO : "3.2"
+DISTRO_NAME_NO_CAP : "gatesgarth"
+DISTRO_NAME : "Gatesgarth"
+DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
+YOCTO_DOC_VERSION : "3.2"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
+DISTRO_REL_TAG : "yocto-3.2"
+POKYVERSION : "24.0.0"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.29.2


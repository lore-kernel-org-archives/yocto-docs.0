Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.11446.1605120135318618573
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 10:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PYvgknrZ;
 spf=pass (domain: linaro.org, ip: 209.85.221.54, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f54.google.com with SMTP id p8so3528531wrx.5
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 10:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GsJicZlc50zN07JBqpNA8cuVp7c+cj3f749CoP7nbsU=;
        b=PYvgknrZ5t5t+L9ykMp10eGggYT7l7KRPOJ7gwL7YigeiJHUAJI0AKsG3wj3FPnonx
         8KAabhpfDp3tITOCNjLa0k+UvccvpCsOfZdGkUCuVc4Td3CsjDlU8B+B7YcB6t9aXbyE
         DjM/69VP/ZPp2xioBiHoElpt/5YBy3g0tUCGMbhExeC8bIFwj0McYT+6rDCC8r7BLfvu
         acKBVY0rC1tLmQhztGFaKSN9O2TchtLo5AU8BdDt7NqAUpLaCWcFPiGIO///53CzYoLh
         0hPZ4/Yf2887+9I9BdZ7Dc0wr5Y8XLXREKvFWv+6ytTmcADOlujKQxB/3+qiVdKshiFo
         +Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GsJicZlc50zN07JBqpNA8cuVp7c+cj3f749CoP7nbsU=;
        b=I+egDqiCDLI87y/zJ/DKUVzaVbFNGfqUC/E4xVGzweazPLWIlDlS+KYxJ1aWH5N+Rv
         d99SLlq6Bm2qGthnlO0MCxa765XH9m4O0pHYgUCR4DeCF5Q+feZU9kcQq1z5KW5QetWn
         SRPI2siFxQHOCgoguKsxI/il5WHVlK4bYgxCAW2rYsjVxCtoicLtWIMYW1TRn/8qLzOW
         kg9/JEqs//iHCU95NBBtI25bbrDatWOJ07dcnYZS3yLA/gecQDBmEN/NDBioKNopr2dh
         98douzjdgO6M/C+/Cj/LiQLSOo06+HMgG9LiNTcNNSVsL7QXmOCCm+5O+aCHPKWIMdQZ
         f8cQ==
X-Gm-Message-State: AOAM531gt1gu0aT0QRc+024jvorkWyEHneJOkhVYXq8oAS8uDRMymRLu
	Ym7tpWJYYqa6cHoDo837Yk7g3G+L44Vz7xdh
X-Google-Smtp-Source: ABdhPJwoClxTNgiaalP0csv6cyxOnaWDZMJID6Kn7Jl0/ZEtYJuYtNPWQWT5P2EDCDIbWFbkfoju/g==
X-Received: by 2002:adf:fe0f:: with SMTP id n15mr32919655wrr.357.1605120133525;
        Wed, 11 Nov 2020 10:42:13 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id v67sm3673657wma.17.2020.11.11.10.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 10:42:13 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 2/2] poky.yaml: updates for 3.2
Date: Wed, 11 Nov 2020 19:42:01 +0100
Message-Id: <20201111184201.104015-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111184201.104015-1-nicolas.dechesne@linaro.org>
References: <20201111184201.104015-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates global variables for 3.2 / Gategarth release.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/poky.yaml | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 85f42cf07..41f244f1c 100644
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
+DISTRO_NAME_NO_CAP_MINUS_ONE : "Dunfell"
+YOCTO_DOC_VERSION : "3.2"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
+DISTRO_REL_TAG : "yocto-3.2"
+POKYVERSION : "24.0.0"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.29.2


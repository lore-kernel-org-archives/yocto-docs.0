Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.10233.1603465070881859423
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Oct 2020 07:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lB+pOJrk;
 spf=pass (domain: linaro.org, ip: 209.85.221.51, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f51.google.com with SMTP id h5so2218887wrv.7
        for <docs@lists.yoctoproject.org>; Fri, 23 Oct 2020 07:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q+DguBKZ9S7VAIR352F5PX0jDTaLexzwdsRDzV44Tng=;
        b=lB+pOJrkqDg26bK2+n1cDYD3Gfr06UyEM94gGH9z2CvOUCPfmD4xEnWPlBDwjOh+Mo
         zrbVCabWylFzKMJ9bOj/Az9l1g+lahvs6KPLUIwGbPmYtt1QCMDB/Lr8rcAwNfXzZvUj
         Pei9HEQH02mVH4pndYp28gZtiunf1L45vmQ8vbJ7ZdTkvGymyc6FOBhVSsXN3GQ24lek
         fNvQek8WQVuBiDloRQMyZ32hnR1QcTSfHI8tZLY+Sy5nb4N7Ut1OeedSDqfd/kZTbUs7
         lclpd58v18omifDmxSG0096ThkVMBRZ5y0ZPzkIVB/EZi3oZ1MbR2aoNaTH3z02oCEun
         F3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q+DguBKZ9S7VAIR352F5PX0jDTaLexzwdsRDzV44Tng=;
        b=sG+J8TyLePl33YaYYd21r11g3cnxT33FTU+myGJbJznfppAeDCaqpjLJBTrNeJ7+7p
         cI/H5tqO5W/aH+mZ7tn7laLIeMm3NQSxRp9sTjat7xHaC8B73Ykbqtzo4eKvjKBIha6o
         d2DLmK6rCkcZBwbU9AmvZ/D7UumS5rIGys0rVXcIgHi4Pc24xdaQfIwlOT2s2L6CK7uZ
         JW+ya332uW7CS+o9I+iHuEeo3I3tcpNnbVCrc3eqQYJJ7w8vIU77guGGktaw+8/hUe8Y
         oyv3uivCLDPRVlsVjeAW4NvBFwfqrccrpo22TA/kioQ+pc02mQyIC0Fwn945cYz6gVuA
         13lQ==
X-Gm-Message-State: AOAM531sOexJjb5ZqTi57485P6wnzQPBt8ShVNfqZqnoB24KKUvKDhrP
	TDm7i6D5CLJlh9SLWUMn8eeBhf+7mPIM4rm6
X-Google-Smtp-Source: ABdhPJy7ptIm563X2PGtgcbKBC1Y8ps+hDVdcFu/Hpur3HTKruhZxbkOLrvlsi75Ec74nN0JALlHHw==
X-Received: by 2002:adf:ed45:: with SMTP id u5mr2931250wro.48.1603465069197;
        Fri, 23 Oct 2020 07:57:49 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from nikaia.localdomain (lmontsouris-655-1-65-40.w80-11.abo.wanadoo.fr. [80.11.58.40])
        by smtp.gmail.com with ESMTPSA id p67sm3831202wmp.11.2020.10.23.07.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 07:57:48 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] sphinx: add 3.1.3 and 3.0.4 release in the switcher
Date: Fri, 23 Oct 2020 16:57:42 +0200
Message-Id: <20201023145742.354902-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/sphinx-static/switchers.js | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 32113cfa9..b28d91c08 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,8 +3,8 @@
 
   var all_versions = {
     'dev': 'dev (3.2)',
-    '3.1.2': '3.1.2',
-    '3.0.3': '3.0.3',
+    '3.1.3': '3.1.3',
+    '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
 
-- 
2.28.0


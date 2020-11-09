Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.11158.1604927420025267720
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 05:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QhN0IBY6;
 spf=pass (domain: linaro.org, ip: 209.85.128.49, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f49.google.com with SMTP id p19so5428265wmg.0
        for <docs@lists.yoctoproject.org>; Mon, 09 Nov 2020 05:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SxiZxeEu9vJFzqj+7U2Yw8T1Jf3Z/5mJ9ruYZjxvqfc=;
        b=QhN0IBY6Okb96i0KWyedvrIDCXTte5+hKeLquidbmgxDX+wDTjJ7DID40RqD71l1Ed
         LYnsxZMLlccqU1h/AwhaAywJQbf/v0qir1aUUEgOgsPpwwe1ODAbndwQotu5mcds2S0Q
         yIhDHtcSRQNYClDkVJaW9F73qOreAYzVUjgDzYaBvXJVLZI14VIqqP++rGM77cRyuAv4
         4jfj0LGFteUOTZpRxpsjGfZwhq1YfN4DKfnlvyCzCJULwbfzqTRFrezs1EOFZD4gtdhP
         rCzuK5Kko4FVcFZcC1kAVRpooa+vLFF1XrT1GCOJKNGokr9241JJiH8VmcpuOTX5UIMo
         S4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SxiZxeEu9vJFzqj+7U2Yw8T1Jf3Z/5mJ9ruYZjxvqfc=;
        b=esEcqxBT3TzRzvIPH09Ys463SuZ0K/nYr2xvQJWpXOTg9moVoxkiIlmWN28jtM+DPq
         FBzCxqrBLFf+svnOWnePeghagUsh8BQWBNhIC1ibWqCtXAvMHoLB+qo5nFrQx8dWIcxc
         z+BgF3lNUOA3ORKBmwqki8GoOfPWt/Ac91YqDWg2alSc6cRvXxT1oH2DYBW7sQ8VhDjx
         YmjqYv1KwKaV4jZ/mQs7S0XHRWViEfhLPq9ea57LpH/XtyCDNPh2acZDvjli+jFn9mNv
         oJ3MFyN8lSloX00a0yDstOxeyc5LPkJ+SY7kyiwE8fC8wzErND9J52RFJqdVFkTJKQRf
         uDbg==
X-Gm-Message-State: AOAM532qTmMLL3i2C6nvc08MEV4oBpjGBG448uFwUAd3lweS0AO5tU++
	0/eTX8grdbL8uDL/w36MjrxJ0Qg9WFcRhYSC
X-Google-Smtp-Source: ABdhPJyBvrje8VTfm7RENIX230QFeZG7guFucjgvT+zOiEr41kBrAsE4WROE7sEXbxmmu2HmjDP1jA==
X-Received: by 2002:a05:600c:d2:: with SMTP id u18mr14649580wmm.102.1604927417929;
        Mon, 09 Nov 2020 05:10:17 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from nikaia.localdomain (91-166-228-248.subs.proxad.net. [91.166.228.248])
        by smtp.gmail.com with ESMTPSA id f2sm14048455wre.63.2020.11.09.05.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 05:10:17 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [gatesgarth][PATCH] conf: update for release 3.2
Date: Mon,  9 Nov 2020 14:08:11 +0100
Message-Id: <20201109130811.272677-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

conf.py:
* set version to 3.2

switchers.js
* add 3.2 release
* update 'dev' to 3.3

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/conf.py                    | 2 +-
 documentation/sphinx-static/switchers.js | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 9a0186f35..5d8a7af30 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "dev"
+current_version = "3.2"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index b28d91c08..fe9841b10 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -2,7 +2,8 @@
   'use strict';
 
   var all_versions = {
-    'dev': 'dev (3.2)',
+    'dev': 'dev (3.3)',
+    '3.2': '3.2',
     '3.1.3': '3.1.3',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
-- 
2.29.2


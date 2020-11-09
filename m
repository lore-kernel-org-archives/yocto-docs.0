Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web09.11130.1604927262851683670
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 05:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SULrjQEv;
 spf=pass (domain: linaro.org, ip: 209.85.128.66, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f66.google.com with SMTP id 10so7145612wml.2
        for <docs@lists.yoctoproject.org>; Mon, 09 Nov 2020 05:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8OAkb8mDmIiT7/k/MgljKyWGEVSSeNL/NYQz7/+IrdI=;
        b=SULrjQEvC79LAtdo0cBNiynZE4WOnXLQRH89zFiL+YgdFjCRmM/WsOvnl29Hu6+CQo
         gwLdvhGJ+vOljgn6jabMIiB8k16P4Wmt1wzASaVOImkZTTJhDndOmHAyT70L/B8RiL5b
         UG0NP/Ced/N7a3lDjwuf5eZASb03TZUd+zUpkJySGWXrQj6jbS2NUaz0i31rF0mBZ4jO
         8UFz/hfY0IJUSjg9gGaRToy0/yzlNsVl/AHeZPfLjMS1/NL1VqDK1KQw23VmD0U5BdzK
         nZYOdmipKy9KUMmUVmluzsZuWdNtGhXb55hIKM7E0U2zVFvRBMr9lzW24fBc75ICB/7N
         mjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8OAkb8mDmIiT7/k/MgljKyWGEVSSeNL/NYQz7/+IrdI=;
        b=RKvdeQvWpBDf+vfX2nUs0FYspzl21AIB/pcY83m4ZJst+d0LzReJG6EQKDY3R+F2Or
         jtOhEGX/E2Z5b9J9OUdQhFnKwaw1/TS9HioEWkHBSe0vUt7IAtoUxqMmseJokIRBG39L
         68K3L2YdJ21B/EQ86ksc3RNjAkn/xehWekSkU01JqNCHu7tqFrmReIJEuXm/HfbsT57S
         zkfJIYbzoHuzG5L4Fa2qooyYkHSjTWUqQ2hCLuSS+15jsLZ4wWZJjr0ibIxvx19eiZqF
         M5XjCm/ckH9RJZehwXtQXX5fsAtZ3BJR1UPI8QdSkhtWSH4cQfp4zJpCxGgmFUHwXK4o
         qeMg==
X-Gm-Message-State: AOAM533zl/ZjXLM6dQ0LBzKWb5GMFZ3SQZBcnDxtYMFDrGkJho3MKjqk
	UEVXEpdEHBf63S1+TNbNGOv8PARCoKhrqidf
X-Google-Smtp-Source: ABdhPJwBEVnLb8RlFK6b1IHmK62WPt7wprLkIPq4fiXQqMgIq3cRHyENlDqLZ4SzhtYH4hLzYY5Zpg==
X-Received: by 2002:a1c:490b:: with SMTP id w11mr14384610wma.101.1604927260059;
        Mon, 09 Nov 2020 05:07:40 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from nikaia.localdomain (91-166-228-248.subs.proxad.net. [91.166.228.248])
        by smtp.gmail.com with ESMTPSA id k84sm13263266wmf.42.2020.11.09.05.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 05:07:39 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] conf: update for release 3.2
Date: Mon,  9 Nov 2020 14:05:27 +0100
Message-Id: <20201109130527.272381-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

switchers.js:
* add 3.2 release
* update 'dev' to 3.3

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/sphinx-static/switchers.js | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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


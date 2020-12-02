Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.1726.1606950954796053416
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Dec 2020 15:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QhAieKWh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.214.173, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pl1-f173.google.com with SMTP id x15so82592pll.2
        for <docs@lists.yoctoproject.org>; Wed, 02 Dec 2020 15:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wRlmd/5D6jEHvTMTBSGIB5z/dxcwXxI2hyIYJWDDMRs=;
        b=QhAieKWhgvenK2gL3UHoWNE0LyA7LgZ+FjqzH+LL2q9A81v8wkMn561mj5SLGedqOB
         z0rbWAa2ulUHXDDwwvomxtUmDEaftsFfF6UFdl6TZFlBzvgHYyyheJibdOyl8SlPSsKi
         U3Tg1ceohGguhrcNTx+PXlhEI6rSA/e29J4ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wRlmd/5D6jEHvTMTBSGIB5z/dxcwXxI2hyIYJWDDMRs=;
        b=M9TdaTlNdrGr/HfIiU5iP31NWfPTVNj9aImT+1P6wZcGpddN/E/NsQ8fMzMO34ss6g
         2fIRy8I58RY+C62c3VCP/y7t0P1tgj3mNWMeG830ApvgHNCMyuZ2qY1h5+3OEMCsS528
         +YSm1cjxh5GCQoPiKr8z1QkmjerbrnrSuupdhiFLWnL+noheDTkUVCfT0LOVnAY9+1j6
         nLORjMPHpoir0ui/3y0y84HuQz0opS2Ve8NIfBqFawa8MQJc/QqQM4e7BFP61aw5Q1Xd
         loLPWsFpc+X3q7rPVKuwdcFE1N3XdW6LS4hedMPK0vVRsWB6fzpAhh+fvgpBoZZdtiS2
         i82g==
X-Gm-Message-State: AOAM5320xwRgGdZ5QCi6d/cHrq1w5Oqx+RUEuzba/n2nQfTCmcT15kq1
	NeMetybh5VXwDvzY09Yx9VibU4qYPTIUjQ==
X-Google-Smtp-Source: ABdhPJyKBdWdXnuuue7p96Al/Q2oVQmzlcv+4pOhXBw58DxkMFM82LxnI/7MY3aSA67kLtrfyfmD9A==
X-Received: by 2002:a17:90a:cb13:: with SMTP id z19mr288060pjt.18.1606950953957;
        Wed, 02 Dec 2020 15:15:53 -0800 (PST)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.localdomain.org (c-24-21-216-192.hsd1.or.comcast.net. [24.21.216.192])
        by smtp.gmail.com with ESMTPSA id r15sm9685pjp.51.2020.12.02.15.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 15:15:53 -0800 (PST)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: rpurdie@linuxfoundation.org,
	nicolas.dechesne@linaro.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [transition][PATCH] docbook: add 3.1.4 release
Date: Wed,  2 Dec 2020 15:11:57 -0800
Message-Id: <20201202231156.37332-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/sphinx-static/switchers.js | 2 +-
 documentation/transition/3.1.4/index.rst | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 documentation/transition/3.1.4/index.rst

diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index b28d91c08..e52032ead 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,7 +3,7 @@
 
   var all_versions = {
     'dev': 'dev (3.2)',
-    '3.1.3': '3.1.3',
+    '3.1.4': '3.1.4',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
diff --git a/documentation/transition/3.1.4/index.rst b/documentation/transition/3.1.4/index.rst
new file mode 100644
index 000000000..91c9434b1
--- /dev/null
+++ b/documentation/transition/3.1.4/index.rst
@@ -0,0 +1,2 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+.. docbook-transition-include:: ../index-2.5.rst
-- 
2.28.0


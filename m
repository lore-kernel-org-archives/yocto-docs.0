Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.599.1608058972342055616
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 11:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RlLgk0Cw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.215.181, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pg1-f181.google.com with SMTP id f17so15870253pge.6
        for <docs@lists.yoctoproject.org>; Tue, 15 Dec 2020 11:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WgINkHXS+KXyOSkAg4gorx188397iiK0Tcfl6aLo6RA=;
        b=RlLgk0CwZ20wmLT9myTESnxp8KTzYsEYJMsMZoEcUWAhABpl7Vz8orv0kCDfOXKUFM
         cIA75mzf5kb+tQhwwUWurgv5HwmQIfcH8N9KifYfnvigPxnnSrT5azBwqCuEh4Mrk5T4
         tfluwMfiVI5PhAUZ/bb2gEjn6j7tiD1kKFUmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WgINkHXS+KXyOSkAg4gorx188397iiK0Tcfl6aLo6RA=;
        b=T01dayyFECs1zuMFIPf48MAB/f/0nHvJYGuuQiMj6QPgQIY5eQ8PfOO/4ZXEUJWwlk
         NqZp/xzce4Xe48ob3CN9OUCEvNkKTZ1+xLPH2x/4osqEdukW0hRg9djEO/KiyEynoEOw
         LKXShKRwpNvHGUIBExioQtFAELgR0fr5siqIueXbfQi8m6AKDVaa2gUncElXBYsm82Ib
         37NjWW7nBJalfurE/bppdFDYRXmZk5oMeDyd+275ak/cVNYU2E/cpDa0SwYwAfi1SNR5
         cnDbvSOXq53Hy40I1whiMMcB4Ou3MGYdFQeaodBUNhTTGu4LoFJ9pdPC3dYcH1yUksom
         Z8iA==
X-Gm-Message-State: AOAM532hbBG4I2W2NQ0Xg83YG7cZ/YplUrEs57rNghR2VZOq/ZrreVSG
	w2WBZe3yusMsKAkG1FHe45ieVO4XmjLHww==
X-Google-Smtp-Source: ABdhPJxMuhTKDq0/6o5dZ0T6ZOIJ0BHKv/8b3pgpKISPumRxKoMnZ1hpGpm23iqCJ7DRbLC0L03aTA==
X-Received: by 2002:a63:3714:: with SMTP id e20mr30480540pga.410.1608058971707;
        Tue, 15 Dec 2020 11:02:51 -0800 (PST)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.localdomain.org (c-24-21-216-192.hsd1.or.comcast.net. [24.21.216.192])
        by smtp.gmail.com with ESMTPSA id h8sm24605853pfk.71.2020.12.15.11.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 11:02:51 -0800 (PST)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: rpurdie@linuxfoundation.org,
	nicolas.dechesne@linaro.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] releases: conf: add link to 3.2.1, update to include 3.2.1
Date: Tue, 15 Dec 2020 11:00:39 -0800
Message-Id: <20201215190039.10145-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index 254630055..b40907202 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -9,6 +9,7 @@
 *******************************
 
 - :yocto_docs:`3.2 Documentation </3.2>`
+- :yocto_docs:`3.2.1 Documentation </3.2.1>`
 
 ****************************
 3.1 'dunfell' Release Series
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index fc901d329..754de2e6a 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,7 +3,7 @@
 
   var all_versions = {
     'dev': 'dev (3.3)',
-    '3.2': '3.2',
+    '3.2.1': '3.2.1',
     '3.1.4': '3.1.4',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
-- 
2.29.2


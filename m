Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.10418.1603465048562063108
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Oct 2020 07:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lUhUvy5g;
 spf=pass (domain: linaro.org, ip: 209.85.128.47, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f47.google.com with SMTP id e2so1960248wme.1
        for <docs@lists.yoctoproject.org>; Fri, 23 Oct 2020 07:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8K8hMyGFUWlUoXytJrpxAFkeQjCm0BMMc9zgyS9zel8=;
        b=lUhUvy5gfERIJIrQgcd6n5BT/ixDv1B8vuMjiGSTxoC5uO/XM2/tKvX/WbiXPPXOzI
         +xoUICcApQORuSQhXnCR7dWZUGnf36NZxV5pdv0CncH7J/u/a5i3YXSbBG5O4i/z6OKP
         49qtVOBT2mvg3sYu8oeEUxE2xsAsKV3Slqne4PVkwkGCSNyR+fi7SlDVnS4SkzsyvEFf
         ZaTkIkzSomD3RMNZjdRCQ3r4kt5CiOopsJFtjch3M5JHDChbpg0tlc7ZrYvd4vqXQRay
         /NFoRDNSilHlfksxUpyQq//8YpVBF1iNZv5GkxjL6PTbXnI6iUPj8lT6bxfsqujcOASS
         DIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8K8hMyGFUWlUoXytJrpxAFkeQjCm0BMMc9zgyS9zel8=;
        b=sEOSKGOR8E5h5KahxRWM0VKT85mMnn81rIBRiOt8y/11PTK8Kr348G0aoJdhqNHDab
         jJSaaY2srRbX1kkiKQA5jK5PJUN2WgixIzgg/5oZfQLO6o3sH4yFYtIcY9F+4lecxzU0
         z+84SS8cZiolOBdJq/X77AhxbWaOU1w16H8Hhb+u4irqJgsoTkkDgU6bP890CUWW5uU8
         NKjkULTVdxvOXRgM5bwyKJGn3FpjyOdrLFq0nuaSgX+Zr8T+X6naNfXtwBWQfgkOTOJq
         CgwJsz/inCWPH8ZR6JwnTXWd3vAjSGuyBnuOQ3ccubebsKx/9WQXKtVS78ZLgqNKlkz/
         8P9A==
X-Gm-Message-State: AOAM533YgH2CDqbUkI/Wvmj+F2MQ6XCuiWo6DsmG5QyIf4OPABE7XmLK
	uQU5SOCoMGh3UubupT5r0s1Ggj6EB5rPjsUj
X-Google-Smtp-Source: ABdhPJzfN+ioj7/JEkoUSg6c72YGk6UJ/9rIimy4Cs43x6JKlZaSaRbk0CpdNsKRbR/9w1KvDgfu9g==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr2410474wml.41.1603465046654;
        Fri, 23 Oct 2020 07:57:26 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from nikaia.localdomain (lmontsouris-655-1-65-40.w80-11.abo.wanadoo.fr. [80.11.58.40])
        by smtp.gmail.com with ESMTPSA id a15sm3891840wro.3.2020.10.23.07.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 07:57:26 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [transition][PATCH] docbook: add 3.0.4 and 3.1.3 releases
Date: Fri, 23 Oct 2020 16:57:17 +0200
Message-Id: <20201023145717.354764-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/sphinx-static/switchers.js | 4 ++--
 documentation/transition/3.0.4/index.rst | 2 ++
 documentation/transition/3.1.3/index.rst | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 documentation/transition/3.0.4/index.rst
 create mode 100644 documentation/transition/3.1.3/index.rst

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
 
diff --git a/documentation/transition/3.0.4/index.rst b/documentation/transition/3.0.4/index.rst
new file mode 100644
index 000000000..91c9434b1
--- /dev/null
+++ b/documentation/transition/3.0.4/index.rst
@@ -0,0 +1,2 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+.. docbook-transition-include:: ../index-2.5.rst
diff --git a/documentation/transition/3.1.3/index.rst b/documentation/transition/3.1.3/index.rst
new file mode 100644
index 000000000..91c9434b1
--- /dev/null
+++ b/documentation/transition/3.1.3/index.rst
@@ -0,0 +1,2 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+.. docbook-transition-include:: ../index-2.5.rst
-- 
2.28.0


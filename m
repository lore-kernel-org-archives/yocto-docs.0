Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.31359.1610963389796609368
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Jan 2021 01:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=Gbtj4X1M;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id a9so12331519wrt.5
        for <docs@lists.yoctoproject.org>; Mon, 18 Jan 2021 01:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IRqyv2hwLwlOTJSDGf/ILlMwpDeoeC42LKheQO8A4Tw=;
        b=Gbtj4X1MGjrE2qnrSTvV5TY8D/7eObtjWH3aWMD62ZvbyWmlUMi/+GVjCgtzuLaiQe
         N6QHTT/ZlF4lfwRH3wyTr0HRSYKuQ5OzY9CzXyy1jmOyMIJfP9gzKqUjqR6AiWJIeMKa
         Kmp0cC9q5WsvuxZ1J33I0u/8q3ZmX+/VjI9tjJiFpGOhJnbO21eM6+IyGNv8nRhh/jty
         zWRrub6glUvFo3CbpNx0UVq6KOsdIVckclN4guyo0xPD9LAZIxQFQ85a8z3tOGC5FbxJ
         x8W3NUJkTWxTwh455B3/srH6hL93mrJZkUKi7u16ALzwE35+nwFyNrMgY9SscrqGUKOF
         kVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IRqyv2hwLwlOTJSDGf/ILlMwpDeoeC42LKheQO8A4Tw=;
        b=KGMAkzA8yMlroP5YiD1sEdB4nG/TVI1jfrvs1y3g6EgbmW2uqdfgQFQCccrLFrlKp0
         BMYs+12kzgQKLGXtn5qUka6IadBelHhMnb5OrJgablTDdeZCJrrbCTyW5LfucDGH8Z8z
         3qdVTX5bBi2YbfI9Px+S0sbcKfkVar8HvzSaQ03pPwYazX8Cok+FvymKJVVsX87OH939
         iuTg6guHfeBTiaO6Mw0hDV6vHqyu8V0E9GHFgQFzX8l1TtTjMJ5YAFB/yiIsAS5dnLjK
         iyQtGfyK/3P26/lrdeMnLQCojMyeBqZP1KfHe6tj0uy+ws/qkaCb25+Jlyg6X/aRu2BU
         fgFA==
X-Gm-Message-State: AOAM533MCcbpfECjLJ4/I28/hUNYWDR14uDjFUUqWDcq8nZWk0SDSLzn
	/TLFl2qdzyUbLtNmKYfgunqt+dnj+uk2Uw==
X-Google-Smtp-Source: ABdhPJzWLoUwS5ueCwWEi1xCV8npMWtuGsUC6uOWQdbfoOhFRMDFru5L7cgRA4htxDhfmYpUzaloTw==
X-Received: by 2002:adf:b78d:: with SMTP id s13mr25152179wre.344.1610963388203;
        Mon, 18 Jan 2021 01:49:48 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from P-ASN-KEVALD.numericable.fr (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id g12sm676225wmh.14.2021.01.18.01.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 01:49:47 -0800 (PST)
From: "Yoann Congal" <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] documentation: Add a simple Sphinx extension to check its version
Date: Mon, 18 Jan 2021 10:49:25 +0100
Message-Id: <20210118094925.12654-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following this thread [1], point user to the README if they use an out-dated version of Sphinx.

[1]: [PATCH] toaster-manual: Fix a warning related to the code-block directive
     https://lists.yoctoproject.org/g/docs/topic/patch_toaster_manual_fix_a/79656195

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/conf.py                        |  3 ++-
 documentation/sphinx/sphinx-version-check.py | 25 ++++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/sphinx-version-check.py

diff --git a/documentation/conf.py b/documentation/conf.py
index 407ea3292f..4376e67ee3 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -43,7 +43,8 @@ extensions = [
     'sphinx.ext.autosectionlabel',
     'sphinx.ext.extlinks',
     'sphinx.ext.intersphinx',
-    'yocto-vars'
+    'yocto-vars',
+    'sphinx-version-check'
 ]
 autosectionlabel_prefix_document = True
 
diff --git a/documentation/sphinx/sphinx-version-check.py b/documentation/sphinx/sphinx-version-check.py
new file mode 100644
index 0000000000..174cdf0cb7
--- /dev/null
+++ b/documentation/sphinx/sphinx-version-check.py
@@ -0,0 +1,25 @@
+#!/usr/bin/env python
+
+"""
+Simple Sphinx extension checking if the current version will generate warnings
+"""
+
+import sphinx
+from sphinx.util import logging
+from sphinx.application import Sphinx
+
+__version__ = '1.0'
+
+def setup(app: Sphinx):
+    if sphinx.version_info < (3, 1, 0):
+        logger = logging.getLogger(__name__)
+        logger.warning(
+            "This version of sphinx is known to generate warnings not present "
+            "with an up-to-date version. See documentation/README for "
+            "installation instructions"
+        )
+
+    return dict(
+        version=__version__,
+        parallel_read_safe=True,
+    )
-- 
2.20.1


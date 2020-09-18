Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.8851.1600420215275014869
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=orpSsu2s;
 spf=pass (domain: linaro.org, ip: 209.85.221.50, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f50.google.com with SMTP id k15so4823218wrn.10
        for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2020 02:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=riX2Qw70y2i75v70kFPWuNFYDt3tsO1p/E1Wp27NT3s=;
        b=orpSsu2sP2tWTXU6DZRsWS+A+OaoMw0airpVsSgefhQddS6cP3TpJVTrNEK0QFdDW5
         ZfGdIUgjs7ItredagcPTlq9t1BFzhItODFxxqPIBGayFLDhKrM44c+992r9vxL68NWFk
         OVDynbmHHbX7MtvVYXo+jUnb0ruZhZLXePAggIbYWRPj+s0pVqmmNhUtYtXLY7oI13TX
         648o/EbPpHDDjyIR9kr1KLjaBs/hWHr8S7Q5hZLvfgxywJVpK3uXGRUAodhQLtos9Ms5
         7GKRYsvl8sUmQxHZOSyHUp0hVdK2DKM85bsbUaeVHSaeKdCFfAHXBLsihcYXnZ5QPFD0
         Lhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=riX2Qw70y2i75v70kFPWuNFYDt3tsO1p/E1Wp27NT3s=;
        b=cYO28m1jrImynAZ6O04nP+MvwRHVSfKzT+VabEqz6XOXC/+Wh8bUfQNFzfayzy+aky
         vb4FxVpu4hLIkZNi/fzCEPB8WBHIjIqPAbaH0odknGxkfRgH6xQ5YN3DDwOP6rMxkAHB
         KB+7x4BGXW1UxspHFrsodRKlF847wtpEEs2aGl87oH4Z7lPhDRMO3AUnkYB3pQ1xhWcA
         dZo+CraU2pgoTh+lHlzkNI4nVNiMXH004AnjsVPr+JwknR4vawWDLIEgojjAsbEMeNDj
         2Cln2mFbbx97XcUMykPpfhcjvZyygdtsOxVTj5qqHt+oj+uM4c6D9Y79VeJDo6EWGOts
         Jiug==
X-Gm-Message-State: AOAM530PxBZaFGKKz87esyVZ4104lhURHz+ZMkxSti1rA5HIxosn3MKx
	KfkptebI6PhgpkqGFx/zEw9F/ZWue6cBJIFI
X-Google-Smtp-Source: ABdhPJwBCRLOs8sH1791YzhKbXaAK6PcokKoNg7gT7AWRb4wnUrv6u2QCXXiaJJKpqyS/d8coeOIzA==
X-Received: by 2002:a5d:660f:: with SMTP id n15mr39501272wru.103.1600420213254;
        Fri, 18 Sep 2020 02:10:13 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from nikaia.localdomain ([2a01:e0a:1b9:3e10:d6af:c5d9:8b6e:b994])
        by smtp.gmail.com with ESMTPSA id q18sm4153928wre.78.2020.09.18.02.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 02:10:12 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] sphinx: report errors when dependencies are not met
Date: Fri, 18 Sep 2020 11:09:53 +0200
Message-Id: <20200918090953.555516-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To build the Sphinx documentation, we have the following dependencies:
* sphinx
* sphinx_rtd_theme
* pyyaml

If any of these dependencies are missing, we might end up with some
cryptic error messages. This patch adds better error reporting when
dependencies are not met.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/Makefile.sphinx      |  4 ++++
 documentation/conf.py              | 14 ++++++++++----
 documentation/sphinx/yocto-vars.py | 11 ++++++++++-
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/documentation/Makefile.sphinx b/documentation/Makefile.sphinx
index c663c2954..c9518558b 100644
--- a/documentation/Makefile.sphinx
+++ b/documentation/Makefile.sphinx
@@ -9,6 +9,10 @@ SOURCEDIR     = .
 BUILDDIR      = _build
 DESTDIR       = final
 
+ifeq ($(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi),0)
+$(error "The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed")
+endif
+
 # Put it first so that "make" without argument is like "make help".
 help:
 	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
diff --git a/documentation/conf.py b/documentation/conf.py
index 34d1bc97a..f2dd2556f 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -91,10 +91,16 @@ intersphinx_mapping = {
 # The theme to use for HTML and HTML Help pages.  See the documentation for
 # a list of builtin themes.
 #
-html_theme = 'sphinx_rtd_theme'
-html_theme_options = {
-    'sticky_navigation': False,
-}
+try:
+    import sphinx_rtd_theme
+    html_theme = 'sphinx_rtd_theme'
+    html_theme_options = {
+        'sticky_navigation': False,
+    }
+except ImportError:
+    sys.stderr.write("The Sphinx sphinx_rtd_theme HTML theme was not found.\
+    \nPlease make sure to install the sphinx_rtd_theme python package.\n")
+    sys.exit(1)
 
 html_logo = 'sphinx-static/YoctoProject_Logo_RGB.jpg'
 
diff --git a/documentation/sphinx/yocto-vars.py b/documentation/sphinx/yocto-vars.py
index 568947299..8083d7da1 100644
--- a/documentation/sphinx/yocto-vars.py
+++ b/documentation/sphinx/yocto-vars.py
@@ -1,10 +1,19 @@
 #!/usr/bin/env python
 import re
-import yaml
+import sys
 
 import sphinx
 from sphinx.application import Sphinx
 
+# This extension uses pyyaml, report an explicit
+# error message if it's not installed
+try:
+    import yaml
+except ImportError:
+    sys.stderr.write("The Yocto Project Sphinx documentation requires PyYAML.\
+    \nPlease make sure to install pyyaml python package.\n")
+    sys.exit(1)
+
 __version__  = '1.0'
 
 # Variables substitutions. Uses {VAR} subst using variables defined in poky.yaml
-- 
2.28.0


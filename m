Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.737.1606946858099634801
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Dec 2020 14:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=caQhF9Yu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.215.182, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pg1-f182.google.com with SMTP id m9so124010pgb.4
        for <docs@lists.yoctoproject.org>; Wed, 02 Dec 2020 14:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IasiFx5/azZErk3iBIcYjTAA35pVXfVq2145gh3vD/k=;
        b=caQhF9YuSCT+WDYuh/bTO/xAG6h8xwVwTRbhQj9Pay7vwenhOPwYZlgPfy0zU580ju
         enLZMKZLNfPH0wvZNf0dmA7rfGvt2kJXjgEsa7w8s0VleInndozCWeVYuhRQZElKzYWt
         9T7abLB6EK+NxdNuW5YX+AB/ejUQfRyyOs5r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IasiFx5/azZErk3iBIcYjTAA35pVXfVq2145gh3vD/k=;
        b=sdOzsbkocCuhl+Q2EDj9duILwE3RRCAZXam+cLFDanNfAUq6gV7yzlOMj3GL3sY5wk
         xgmayNG/ZPsLyRE3c818USc1Y2as/PL9CXKmGkwIxndhhFLsK+pxXlyBQHUsJ34glVPa
         zOBrTIuYBzsaIIs587eXoSZU64GCyAc5hwmVf3R9NzY5ihuaOl3ZeQcVM9JF3p6udVE8
         u8y8eA/H0SKaq216wx5LhZPvPtdGVQyImoXH8hmSXR7/A3HFxkEybyWG3AnteLDHYCtc
         96ShptwVlJVxU9mkT6pTpKCBNtem49HEYWszdynT2keau43l0EBiWl6bqbP+WtpUWIut
         U7pQ==
X-Gm-Message-State: AOAM531znniY0zTu3jN5gwk89HpTV1L5ACzJkSNv7Tk0lIKgqHT5PpLz
	JGVGkuLtYflgQV0qIIcQ/dGLoJvjgDhs6Q==
X-Google-Smtp-Source: ABdhPJzf9aY4wPKQ9LKe1q+Wg+UZDX7Lm0BsDXyvFtntKtWvKnT+1nnnWwKd0r9rYE4jK2E6IrEIyw==
X-Received: by 2002:a62:8cc6:0:b029:19a:87b1:99bb with SMTP id m189-20020a628cc60000b029019a87b199bbmr261023pfd.6.1606946857390;
        Wed, 02 Dec 2020 14:07:37 -0800 (PST)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.localdomain.org (c-24-21-216-192.hsd1.or.comcast.net. [24.21.216.192])
        by smtp.gmail.com with ESMTPSA id u205sm73406pfc.146.2020.12.02.14.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 14:07:36 -0800 (PST)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: rpurdie@linuxfoundation.org,
	nicolas.dechesne@linaro.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] releases: conf: add link to 3.1.4, update to include 3.1.4
Date: Wed,  2 Dec 2020 14:04:53 -0800
Message-Id: <20201202220453.33336-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/poky.yaml                  | 2 +-
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 57da0a7c2..c1340c25e 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -4,7 +4,7 @@ DISTRO_NAME : "Gatesgarth"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
 YOCTO_DOC_VERSION : "3.2"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.1.4"
 DISTRO_REL_TAG : "yocto-3.2"
 POKYVERSION : "24.0.0"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 9992f97d5..85b31b64d 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -12,6 +12,7 @@
 - :yocto_docs:`3.1.1 Documentation </3.1.1>`
 - :yocto_docs:`3.1.2 Documentation </3.1.2>`
 - :yocto_docs:`3.1.3 Documentation </3.1.3>`
+- :yocto_docs:`3.1.4 Documentation </3.1.4>`
 
 ==========================
  Previous Release Manuals
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index fe9841b10..fc901d329 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -4,7 +4,7 @@
   var all_versions = {
     'dev': 'dev (3.3)',
     '3.2': '3.2',
-    '3.1.3': '3.1.3',
+    '3.1.4': '3.1.4',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.28.0


Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.6761.1583886914762890910
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Mar 2020 17:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kbo6+XWs;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id gv19so73249pjb.5
        for <docs@lists.yoctoproject.org>; Tue, 10 Mar 2020 17:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q6hDvqgyk/N2A5rYAQZxtBf2J08yWKD7FebcNTPQ8y4=;
        b=kbo6+XWsGhnAKg824xYuAstf/6OpxfG8OMvj2hYTIBvlXQl73m6rYsKFIbkxQ5RkLa
         6m5ffmfziBoErgknmWmEcTkw5M1Zi6RDm5cYeIDqBgIS5hArDlIsBCwY+V4lLhzFjzuw
         jIBBtFucYcGGvmeF7w8Ugo68E63iu86jzlwFFwWa3xgaxjmKY4H7UTg8EskpLuiYIwjC
         uRT2Cfv+nyEZsWJMwsGDGPy48Z8cRfhYqO+fL3cajf+LAIkzUmoVzdVGRbKyp7eXRrGf
         lAY5980q4CgPnYhi+kkqHYFH5yBWY8w/Ueo8Pfx5bDnTiYEwuNrlDJ3iccusyyusLSi2
         jjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q6hDvqgyk/N2A5rYAQZxtBf2J08yWKD7FebcNTPQ8y4=;
        b=QW+OO+GsrJn9lftIutQ1OwxP+Z8HuM7Ej7PnU1HEqrzQlryApJgjej0v9145ef7r1j
         nClsKvoSGqljuQBU5cMuybd59GKfcQTHq64O1iWwfBoFhfR2ZsNlahQH+3DxUZ04AzC7
         p3ioKM8NzNb1ucgOhn5RbrQDAQvVarrTaFOQG6gYxpzbpqzeTKbE2dSwEsZTMUWU867L
         GVtJyxMbLYs23QnzTCGVW3uK0BCf4NY4h9/nyiBA2WkJ9QkcdSdWo3nNw2pqplXE0CYs
         +cbSOC3L8GWlGTAX+XXHYF+xgFe2FGKKAmLkA96HBohuWDINrJSvsicE/D9USz2/INtx
         hyGw==
X-Gm-Message-State: ANhLgQ33wtTbBDL8xAq5BjtRHoGOAJaduK7cMdmU09LqjP66kCz26Nfm
	j+APHdkfKYI2kQZ2GOkMRxtFjKoSAvs=
X-Google-Smtp-Source: ADFU+vuxn747xN/Q5/swCgA7uMi8NoH/lSzBKznJMYgG6sIZsOs96MODGDrcwCkaf+0t97hPkIMuKw==
X-Received: by 2002:a17:902:9a42:: with SMTP id x2mr601375plv.194.1583886913863;
        Tue, 10 Mar 2020 17:35:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from focal.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id q43sm2226064pjc.40.2020.03.10.17.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 17:35:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] documentation: Remove python from UBUNTU_HOST_PACKAGES_ESSENTIAL
Date: Tue, 10 Mar 2020 17:35:10 -0700
Message-Id: <20200311003510.476988-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ubuntu 20.04 doesn't have python package and therefore this list fails
to install, python3 is required anyway so removing python is perhaps ok

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 documentation/poky.ent | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index 59aad95bc..581c87679 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -58,7 +58,7 @@
 <!ENTITY OE_INIT_PATH "&YOCTO_POKY;/oe-init-build-env">
 <!ENTITY OE_INIT_FILE "oe-init-build-env">
 <!ENTITY UBUNTU_HOST_PACKAGES_ESSENTIAL "gawk wget git-core diffstat unzip texinfo gcc-multilib \
-     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
+     build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
      pylint3 xterm">
 <!ENTITY FEDORA_HOST_PACKAGES_ESSENTIAL "gawk make wget tar bzip2 gzip python3 unzip perl patch \
-- 
2.25.1


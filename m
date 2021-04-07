Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.10115.1617813312495971515
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Apr 2021 09:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=p3vCF3G0;
 spf=pass (domain: linaro.org, ip: 209.85.221.54, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f54.google.com with SMTP id 12so4155346wrz.7
        for <docs@lists.yoctoproject.org>; Wed, 07 Apr 2021 09:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ss1t6GxUSUc7iYTwf1nnbttaaU8G2W2cdQaFsEqiMt8=;
        b=p3vCF3G0H8uSYY6V3akVZJ33r/7Jq9X9smVA10QXdVZ06KrlvQ404I3bDm1gHjJvEr
         zWHLdEabseax2aGlOG9BKkCQ5yvWadcJ/U02vrc7QDAS0mGzBKMKAKZlx6OOkp2MCIHt
         sR2lnoElyO8xv+Mcb/2RQeUVPbaLHx56Mm8ttFVWEZ/onUqjuFpKIgs1J2auwz8ro0bZ
         Xvgk/e5gXPfySaE19kfcH3gK7RgIxqL5jmeyiejZPgpRuKiFjWBTFiJfDIHT3SDRDqH4
         2QyvJlMCVNO+1IxzAlZLP/IPTLgN1Xqx5jzjeWZizjHA//VBJx0xoFoKitLb+UnKjTlf
         iM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ss1t6GxUSUc7iYTwf1nnbttaaU8G2W2cdQaFsEqiMt8=;
        b=i6G8dNlFHip8cfxLULNPG5ml39BBzQjiCaE4DvWAPg3ZBqNwapnq5ypFZKmGMlH2/U
         6rK86mh//F/ukpmi2BLjspYf2Yn86zkjH8M2EwzQtpxQ81gHQN91Zep5L3Uxp+aQ+jx6
         tWjQ3pd3bP8SlAAgLLbW1BBdt3MUCd5E0VeSI0d2SQaCGH4cRODvZmM2emYoFWhuzcit
         MxiTAERrGGIgD41l8j1SCPd6GxLUoeRX0WetJCi3INooZgUmX8Xb0NaG984ncoFv4mCe
         Z9+49TK5kpriKfAgU8WNpF0gqD+n0sFis6c1AhGJxWiKIM+tgyh4Wt6Gh22oLXevsehs
         Hkog==
X-Gm-Message-State: AOAM530lPoAUR3XVhrOYbQa9QxinqYQ39bYNiPbc+Jg7XocHpw/WUu2G
	jEYQPfRBk4bf/FGQ0gk4zbXRPbQPkWOVLCwr
X-Google-Smtp-Source: ABdhPJwgCVdTDzC4cZL/zgS3B9wXj5sXgv0J0wr4a6VMVVYYFOXMogT/BZcDnDU8e3bynlUUeWReNQ==
X-Received: by 2002:a5d:4bcb:: with SMTP id l11mr5563240wrt.390.1617813310652;
        Wed, 07 Apr 2021 09:35:10 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:97e3:5361:aa3:23fb])
        by smtp.gmail.com with ESMTPSA id d2sm2664435wrq.26.2021.04.07.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 09:35:10 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] docs: add a top level page for bitbake documentation
Date: Wed,  7 Apr 2021 18:35:06 +0200
Message-Id: <20210407163506.148438-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The top level index file includes a link to the Bitbake
documentation. This link is static, however the location of the
Bitbake documentation depends on the intersphinx configuration. As
such, when looking at an old YP docs release, the link to the bitbake
documentation is always the same (and wrong).

Since we cannot use a cross reference in a toc index, this patch
creates an intermediate page for bitbake documentation, and in that
page we insert the right link to the bibtake documentation
(e.g. :doc:`bitbake:index`) which will be adjusted dynamically based
on intersphinx config.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/bitbake.rst | 19 +++++++++++++++++++
 documentation/index.rst   |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 documentation/bitbake.rst

diff --git a/documentation/bitbake.rst b/documentation/bitbake.rst
new file mode 100644
index 000000000..7702f9322
--- /dev/null
+++ b/documentation/bitbake.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+=====================
+BitBake Documentation
+=====================
+
+|
+
+BitBake was originally a part of the OpenEmbedded project. It was inspired by
+the Portage package management system used by the Gentoo Linux distribution. In
+2004, the OpenEmbedded project was split the project into two distinct pieces:
+
+-  BitBake, a generic task executor
+-  OpenEmbedded, a metadata set utilized by BitBake
+
+Today, BitBake is the primary build tool of OpenEmbedded based projects, such as
+the Yocto Project.
+
+The BitBake documentation can be found :doc:`here <bitbake:index>`.
diff --git a/documentation/index.rst b/documentation/index.rst
index 9f41daf4b..6aeeb2197 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -34,7 +34,7 @@ Welcome to the Yocto Project Documentation
    Application Development and the Extensible SDK (eSDK) <sdk-manual/index>
    Toaster Manual <toaster-manual/index>
    Test Environment Manual <test-manual/index>
-   Bitbake User Manual <https://docs.yoctoproject.org/bitbake>
+   bitbake
 
 .. toctree::
    :maxdepth: 1
-- 
2.31.1


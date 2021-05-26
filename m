Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.6632.1622031790650577844
 for <docs@lists.yoctoproject.org>;
 Wed, 26 May 2021 05:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=n3nmxmlZ;
 spf=pass (domain: linaro.org, ip: 209.85.221.50, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f50.google.com with SMTP id v12so925074wrq.6
        for <docs@lists.yoctoproject.org>; Wed, 26 May 2021 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zmEe5fo/aS8lxMiFvaKYkqXDS2u5i8wGy/L0hUNN97Y=;
        b=n3nmxmlZikoBx8Rr7UYKXkHCNyJIFZybY+m/6bqxqz3RJoCwY68dcDIk0OnkzUgxA6
         RpHZrQ0ZJvuIS4J86e1iX1zHQ//poulwMOQqgCP6KeyKqMm+DA4mtuaxhqRCTd7jjkf6
         OHSqfmr2hW3y6C4GszpcwCPWvymdCKOKKRqazFLGVWIzIuJjxHtmeD8keavNjH3hf9MU
         0W+cJKbzo+w3vu/7CWSQHTkqObcOkDwQZKb8puCT9JdXCsmIWXSeOT5IWr9ervGv8vny
         KgfE7BB0Eoz6TbagvZ6XtUlRlqOKIdQUZ3Yf0Rtx2zO9DopEVKothJTaj75FO2qIVXSn
         uE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zmEe5fo/aS8lxMiFvaKYkqXDS2u5i8wGy/L0hUNN97Y=;
        b=DK1knMa2LrWIcdiFVO+h/4Ur61p+4l+GZSapdsO5PCo5o+hOrE2A6dny+R/2AQ7udk
         SPRTxQuuDI2z3oNnDgSxpw/knajrLLrtpY9LWTtcxneyv0tynpwR7LCEeMmDATmj50I8
         r/lEHRlitOGF1HtzDkOs5UDGaLvxDTnnA6Yvu3JkPLsmqcv2qrz1sZr0H20CzSjG6ysH
         b7aeUC9+kTjS3OnL2w0T0fsFP6Rk0yvuiaNcBOTkAUe7mdb+rRI4T6i1oyssnGgJOM8I
         YU0BLea4fvnMgO6mcsjgh9wUB/ZVhyrYLXC2zovLhEYGeaK58lthVSWBhRVvcbO42tVm
         RUDA==
X-Gm-Message-State: AOAM530a4V0RJ6sATcoZQ7hDWApsma6OdDuZKC+6RMZlL1pgswoHwA8q
	OyWeo7F45dDoQjrTs5+Vrx1/gV+NJsvQY3fr
X-Google-Smtp-Source: ABdhPJxM66FE5i56ezGCL2g2gSEJ1gt4urIoiXoJt/xHZPlVSGmeMxBUhCP4a+8BFU0r4+8XReg76w==
X-Received: by 2002:adf:d0cd:: with SMTP id z13mr17888518wrh.124.1622031789019;
        Wed, 26 May 2021 05:23:09 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:97e3:5361:aa3:23fb])
        by smtp.gmail.com with ESMTPSA id m7sm20817639wrv.35.2021.05.26.05.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:23:08 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 3/3] index: split releases manuals and indexes into two section in the tree
Date: Wed, 26 May 2021 14:22:50 +0200
Message-Id: <20210526122250.2552376-4-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526122250.2552376-1-nicolas.dechesne@linaro.org>
References: <20210526122250.2552376-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/index.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/documentation/index.rst b/documentation/index.rst
index a0b652677..ee9fe055a 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -38,11 +38,14 @@ Welcome to the Yocto Project Documentation
 
 .. toctree::
    :maxdepth: 1
-   :caption: Manuals/Variable Index
+   :caption: Releases manual
    :hidden:
 
-   genindex
-   Current/Previous Version Specific Manuals <releases>
-
+   releases
 
+.. toctree::
+   :maxdepth: 1
+   :caption: Documentation Index
+   :hidden:
 
+   genindex
-- 
2.31.1


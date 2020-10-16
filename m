Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web12.26338.1602880316732535545
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Oct 2020 13:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SHiJTwwm;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id m128so3892085oig.7
        for <docs@lists.yoctoproject.org>; Fri, 16 Oct 2020 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1S5YYIrsrsHB7gtrcVwj8+31Npd0R7PrUcCG5JfpcNk=;
        b=SHiJTwwm8X+BsvIuTpuhlVHyjbHGoeUetmJ0pi9q6V3SZtsS+sX48tUDdIwDC8fsl+
         +GJNllLAuXiX6onklPysT5f+65ipOtOSxwOS1ARHZHRtM6O6lob7vuV0kgk+LZS1t5ns
         ycHPND+NGKbCgPfqYb4EXCOKZ/Geukmq1KprQPJvl6JJxII4LRmo8AOPKC7Ksji1yUm0
         9fSmIOl1t0dRBIquhbFb9FXAe6rXFG9E+lo4zdQ3uMy/Mv3GTbYQZelbxfJRA/GGoSV8
         21DY/WzHSxmf549Jiyx9f4VGtpa+WKkYHM95oSUB1njh04Vat4JrFNd3+vyR7U4NY4GP
         Kahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1S5YYIrsrsHB7gtrcVwj8+31Npd0R7PrUcCG5JfpcNk=;
        b=hb6d9Njf63614f7d8hisi7e/5KXR1mWp/5hpKCftGYcqaRz08QVRLd6j5HtMMb2CWB
         Vnvf9VfMt6oWEYJL/ND7SoeoQUVsnBcsKFgbWMs4SHfgOHrh+VTJsdJKppjwJb8plWkv
         Rq1d6BHvkelDHMdleqyjVNdi9hMz6WX3vkym87O/0SPer3yQAE1cGUnOG/ifBz6tGgKN
         Fb2MJZ0Ru5k1PI1tyrtPxRASegFh9SoMjnOZr6WmnfVgQik7mbXortco1tVe4zei1vtn
         zn2NmMIDwzHRP6+45gtap8/gVICwf5gkfGuIonEU2dEwl7Y8CreeCDmGJF9Eqpx2WBpT
         6qhQ==
X-Gm-Message-State: AOAM532TM3C91Mkp5cDPusR+Y/ZGMhge07RPANGShTtoOn3NABjxbLfD
	xA6/DzB7a2BCa4UpDrJ6g9U0on4edfQ=
X-Google-Smtp-Source: ABdhPJyU1Xg3drDgwgI3j/u253zH5iE8iW6RtUfwYAMau2goST29ukb0DnuLUwkTuUVpOuvjt50ZvQ==
X-Received: by 2002:a05:6808:5d7:: with SMTP id d23mr3829510oij.56.1602880315738;
        Fri, 16 Oct 2020 13:31:55 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id b6sm502097otl.37.2020.10.16.13.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 13:31:55 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH] ref-variables: Given example for naming sources
Date: Fri, 16 Oct 2020 15:31:50 -0500
Message-Id: <20201016203150.36679-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds an example to SRC_URI that explains how to name sources in SRC_URI
and how to associate SRCREVs and checksums with the names

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/ref-manual/ref-variables.rst | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 316e8aabf..d65d0a4a5 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -7236,8 +7236,18 @@ system and gives an overview of their function and contents.
          tree when using the Git fetcher is used.
 
       -  ``name`` - Specifies a name to be used for association with
-         ``SRC_URI`` checksums when you have more than one file specified
-         in ``SRC_URI``.
+         ``SRC_URI`` checksums or :term:`SRCREV` when you have more than one
+         file or git repository specified in ``SRC_URI``. For example:
+         ::
+
+            SRC_URI = "git://example.com/foo.git;name=first \
+                       git://example.com/bar.git;name=second \
+                       http://example.com/file.tar.gz;name=third"
+
+            SRCREV_first = "f1d2d2f924e986ac86fdf7b36c94bcdf32beec15"
+            SRCREV_second = "e242ed3bffccdf271b7fbaf34ed72d089537b42f"
+            SRC_URI[third.sha256sum] = "13550350a8681c84c861aac2e5b440161c2b33a3e4f302ac680ca5b686de48de"
+
 
       -  ``downloadfilename`` - Specifies the filename used when storing
          the downloaded file.
-- 
2.28.0


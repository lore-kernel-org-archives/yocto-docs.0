Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web08.13121.1611071883219919791
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jan 2021 07:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tt3cSlAV;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id d203so21644286oia.0
        for <docs@lists.yoctoproject.org>; Tue, 19 Jan 2021 07:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3/iSZ8PeRVqVfr0BK6o1s7kwN0DsRktRcM7ToJANdzU=;
        b=tt3cSlAVjFRfnP3fKKhRdQovqOrCCCmElMgWmX79xZAuKkEwI29Ib+10ViWgS3JNif
         m2dmcM+QWvrv1XGqSlYCHAuazOVaakPn/aPvw8bNfCxKWUiDBIrHFsXpwB22DGb57FSg
         hAfRxKu+3Ig3ejiaQHhi1kMIAVxrfBqQy/vMJXgJG/TWObQMBXMWMancmQhAV+8pYxys
         LngOunJtFjyPlUU4skG/8iEIj2MMdr/R6ZM+LszoDKJvf9tU04nu1oYlFfAJf7zf7Kwp
         MTtgLfqs14bnkm1Zm9ovUM1GxppZTXodBZrjCuBiSbO7EGlFucuxGgqBAH7g/BCTKT9s
         uFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3/iSZ8PeRVqVfr0BK6o1s7kwN0DsRktRcM7ToJANdzU=;
        b=NCKNX8uuyYMcgtNC8/K3IpZOQxafhMasLvPRYmB4NLAmDWjDUutmIrGsM9ZYeIcVqB
         obqr1gW3ov4RhA7XSQ/j0CgYdaOvHCk3EW6krTiuGvk9hPTQMSZSyMhd1yWJ5oWNvi8o
         Z4OkmLFjOwALZbfcAfUK/vAuc75jCrbx7yto83C8N4b8HCu9/natK/VTInCt3fRACz+P
         ua5YN7LTZLv+mwfJUK3EW8ixwNkewqFHwnhaaXTiaLhrLuL1xWHZm8FvvN1cYf0bRxsm
         Hnar4jM6us7X0l+Y3oup+MRHwsu2ouUAfRh+cQrxYqENWUWlRvfX5pasR5gFBFhnzoYW
         p8Uw==
X-Gm-Message-State: AOAM5323SGBVnVQE3ywy2iJBVN97SLwwQOUFbnuGcUrg9m4wCvUHRM2s
	gS9XCrvVbgqC4MDlGQeC5J7iwjgFbJY=
X-Google-Smtp-Source: ABdhPJxdyb/1SxjTTx8tQfC5jgnpPvITm1xepnyHG4pDdKFR8WAE4ZGPedutJ0CxmHFLhTh+loo2rA==
X-Received: by 2002:aca:7212:: with SMTP id p18mr200534oic.1.1611071882186;
        Tue, 19 Jan 2021 07:58:02 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id d206sm1626302oia.10.2021.01.19.07.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 07:58:01 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: quentin.schulz@streamunlimited.com,
	richard.purdie@linuxfoundation.org,
	rpjday@crashcourse.ca,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH] ref-manual: Clarify recommended operator for PROVIDES
Date: Tue, 19 Jan 2021 09:57:51 -0600
Message-Id: <20210119155751.11243-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates the documentation for PROVIDES so that it recommends "+="
instead of "=".

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/ref-manual/variables.rst | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4ce264813..2ea0cc36c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5915,23 +5915,17 @@ system and gives an overview of their function and contents.
       file ``eudev_3.2.9.bb``:
       ::
 
-         PROVIDES = "udev"
+         PROVIDES += "udev"
 
       The ``PROVIDES`` statement
       results in the "eudev" recipe also being available as simply "udev".
 
       .. note::
 
-         Given that a recipe's own recipe name is already implicitly in its
-         own PROVIDES list, it is unnecessary to add aliases with the "+=" operator;
-         using a simple assignment will be sufficient. In other words,
-         while you could write:
-         ::
-
-                 PROVIDES += "udev"
-
-
-         in the above, the "+=" is overkill and unnecessary.
+         A recipe's own recipe name (:term:`${PN}`) is always implicitly
+         included in the recipe aliases, so while using "+=" in the above
+         example may not be strictly necessary it is recommend to avoid
+         confusion.
 
       In addition to providing recipes under alternate names, the
       ``PROVIDES`` mechanism is also used to implement virtual targets. A
-- 
2.30.0


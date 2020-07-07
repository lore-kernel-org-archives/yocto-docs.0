Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.14029.1594120597293785135
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 04:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rE7LroCV;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id c11so24476752lfh.8
        for <docs@lists.yoctoproject.org>; Tue, 07 Jul 2020 04:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xsqq30ntrwJv4d5CPSDKEKjUvzbnUta1qPCih1+344g=;
        b=rE7LroCVpL90mPxyUcBFrPqjNqRka5PiXV5iRVdO6fK6GmsjomoDpqoVMGyn1sOqkz
         moCqgflSsqpRL3OmVNjyy6lapfSLVtWb27ON/oPTPRP3tk1cKtuP49zjybTTbgeSzhP0
         MWhiE3aIG8dDgo6fYEpFZfwAvorDDuSmwLBvaurDppgR1cMIlnw+8oRZwhBEnLK0USFb
         oGQ8YbWjq9MwX2jFFcUDBAewyEehgz/30Dqz5LmShRqwfNiRp+v17GpkeWnaVe/Hw4mi
         FBVl4q5StIhiUcxFe0CnCDJP0JJ5yMgW7HSu+8ScrMpMgIsEy2JuBKIkJhYqkFU2QDZx
         uvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xsqq30ntrwJv4d5CPSDKEKjUvzbnUta1qPCih1+344g=;
        b=fv3bitjxF54O0MJ9VDG+4QSbW4Z+L7LJOGSgrD9f2/Raqa8hgo1dbUJAUUtlHBG1lc
         GDtBpmCrj5/+BfuOFb7z6mFixxFGs/ZPWwFzlG9hyFplemKaqGwsZqaHUM5k5rYbUcZb
         ZsN/hhDyY/KIlRkFR0U4+zZovHFPl39uuCUGFT5aEIyRbMYLZq6UvoLRWxW/RBQUp9eF
         6SiBLEc6VtrI9DBIDKYN4lM2KjsrlkmD9LDPNxFoC6LyWi2J0I2pJqTADfXXzdLWjNJu
         AzMitaKd8NjvXa/QnIWPrpRQzQparWbRjLLVy9gwfg2IBrtpT2+UNqdUBLGmAX1Ufi7w
         yqfA==
X-Gm-Message-State: AOAM533ZeDXsAtTxyONEayJbXtiBhmfAhSMEIDT82QKaPIK53atjZqPP
	WkalO1J9xY6inBmCxGeDvZtGvOqx
X-Google-Smtp-Source: ABdhPJzgWcsy3+X64uPPdCX2qY7zCDio71Y3XkSXRquRRK0M3pEPGF1Fh3AxlOCNsW8Ft9kDjszYvw==
X-Received: by 2002:a19:3f42:: with SMTP id m63mr32792666lfa.104.1594120594795;
        Tue, 07 Jul 2020 04:16:34 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id y2sm9518570lfh.1.2020.07.07.04.16.33
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 04:16:34 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual: Rephrase SRC_URI description
Date: Tue,  7 Jul 2020 13:16:25 +0200
Message-Id: <20200707111625.161489-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specifying multiple sources is done by putting each entry in SRC_URI,
not by defining multiple instances of SRC_URI, each one containing a single entry.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 documentation/ref-manual/ref-variables.xml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 9fe744aff..5e576ca2c 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -13258,12 +13258,12 @@
                     to pull in for the build and how to pull them in.
                     For example, if the recipe or append file only needs to
                     fetch a tarball from the Internet, the recipe or
-                    append file uses a single <filename>SRC_URI</filename>
-                    entry.
+                    append file uses a <filename>SRC_URI</filename>
+                    with a single entry.
                     On the other hand, if the recipe or append file needs to
                     fetch a tarball, apply two patches, and include a custom
-                    file, the recipe or append file would include four
-                    instances of the variable.
+                    file, the <filename>SRC_URI</filename> would include four
+                    space-separated entries.
                 </para>
 
                 <para>

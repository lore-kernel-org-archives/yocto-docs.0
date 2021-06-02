Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.2430.1622660641503057337
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Jun 2021 12:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AiYw/HCg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.214.171, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pl1-f171.google.com with SMTP id u7so1595818plq.4
        for <docs@lists.yoctoproject.org>; Wed, 02 Jun 2021 12:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RPTLoPDf76Im4Y1eDHBKhi403yUdZ9uWFRjHGH6LxzA=;
        b=AiYw/HCg2zLT+ySUyCQg9bfchi427mxqAk9wh5hlBNBojr+7deCSgCv8dWrdUgW6eY
         8xlbDjd/EqxjoKKUCHeVXiDsZvXXjmln1ZrMu/iuxCdlNCg4zf5hIuspBaRFQy3rOzn5
         R0DP0vWU24NngiCxdptzGb5L4fHisEdXjWIts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RPTLoPDf76Im4Y1eDHBKhi403yUdZ9uWFRjHGH6LxzA=;
        b=Df6iYwtQST4wrQ88SqK9yDsN2aKMQ0NUmbmiyToY3+Ffdh6v4/R/+KLN4+XkcQZdIc
         cWzxVJZTEfQTfHEJu0f365LiWBDDejTU5KGsaCsIqgABlZdJQuIE41P8mdYdIX2QGZ9d
         FThhfmLi6k3YyEri2f7D5YchOEt72N2XVEiHW5efERlK3RRgbAHN1CUvkxyfnw7ezyZY
         GvEfYkPvg7TNxi35h+ByFb8gJbcKynucdquQtHz9D3KXoYFGS0DnjW8YCwAtM6cWnJsh
         0DuAjeQR3lJD49y/b7+B6kKC8ucFSr9Kdby99iuSDiVyBUlTPnTF0wtWHOscmksV+yYc
         MBOw==
X-Gm-Message-State: AOAM530JxyMAI+MI78kmsB5xexD5iy+bMHRSHwWeqlV4RDuvgO4DHEuq
	/Sjbqxyy0mgvhKFLFBXYUJbZ4cDQjYurvg==
X-Google-Smtp-Source: ABdhPJwd9GJud9hMgEkZdlM2hmtUAXvlQhpR6PSvzUpagvXhY0FhAnraoF8M7Yz2I3Sy6uzS9Gvpog==
X-Received: by 2002:a17:902:c951:b029:106:513f:58ff with SMTP id i17-20020a170902c951b0290106513f58ffmr13386471pla.37.1622660640394;
        Wed, 02 Jun 2021 12:04:00 -0700 (PDT)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.localdomain (c-24-21-216-192.hsd1.or.comcast.net. [24.21.216.192])
        by smtp.gmail.com with ESMTPSA id z19sm225544pjn.0.2021.06.02.12.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:03:59 -0700 (PDT)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] releases: update to include 3.1.8
Date: Wed,  2 Jun 2021 12:03:53 -0700
Message-Id: <20210602190353.84307-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding 3.1.8 to documentation switcher and release list.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index f278e2159..56f2def0c 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -33,6 +33,7 @@
 - :yocto_docs:`3.1.5 Documentation </3.1.5>`
 - :yocto_docs:`3.1.6 Documentation </3.1.6>`
 - :yocto_docs:`3.1.7 Documentation </3.1.7>`
+- :yocto_docs:`3.1.8 Documentation </3.1.8>`
 
 ==========================
  Previous Release Manuals
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index a32d87236..301c2315a 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -5,7 +5,7 @@
     'dev': 'dev (3.4)',
     '3.3.1': '3.3.1',
     '3.2.4': '3.2.4',
-    '3.1.7': '3.1.7',
+    '3.1.8': '3.1.8',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.31.1


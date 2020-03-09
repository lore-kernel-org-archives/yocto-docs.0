Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web10.753.1583771643483430502
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 09:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CVpVvska;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id m25so9727987ioo.8
        for <docs@lists.yoctoproject.org>; Mon, 09 Mar 2020 09:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zyRSHe4y/VopjXO1OfQSM/EnEPqPaxS9urKIOQA4i84=;
        b=CVpVvskafDBlytSi1Iq9m1TKh/VShl6gRCwtVtH0UrJ7YSULEINWrIcD3RgyqCSMLD
         1YPae/d3ie35feH3/Ufxf2o2AYQBJQObcB6C90L9RqGrFtTmKInQ/wVhSOJnkxFgpbIx
         bHoB+cXbvPaRBr/4DcTvs8qyHhH//X63/U5jrZ742EAISwaDR2SvG8FEwC7tzt1BO4ib
         XP650yG6NNN5PH+RLR1bj2O75DFCZIooWRi5cIlfHr+cE2Q2dcka85OOmVBDmkNZG7ZR
         23ViTk6RLqWBfdzg+wqmD6DCSSvuanUtQMkb3zRoi32NEoob1SY9qQXy8wgnCwxymu7q
         TYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zyRSHe4y/VopjXO1OfQSM/EnEPqPaxS9urKIOQA4i84=;
        b=M8NVmC5gO8P62G2Dct9GqQupxdJj497twYoG/1GeOhFZnly7dHm960OIML56ZUbZkV
         DIKPXlVX2vCakYgQ/VNS9nHtFTlFPq3r6Lk3ZQj2qGmX2BXB3oX18AQTT/EUQvnNE2OD
         JpllZjDMG0FFfE90QAMaPAAfF1ZfR7X9NIYlDrkWGr1qoOyONGSaOH4PdUFpGPMCNVZm
         pPLc400CKzSInFmd8Paoo7OXdNc7ljn/pAjcEocfXTPCkCvxOa9RmXUa2Z1xu2gimteF
         qsq/j7Nw0Rrt7YLCz4LmttjKr1P3Cz9GZdRxlzX8aKDseIPMMbwvcuN17kUjFtOVF44T
         B0MQ==
X-Gm-Message-State: ANhLgQ3ogOSNZqzwsL2oaC8DNX/EORUHCkkGgnNAhtZ1p0Cj8gwQoeqO
	whGCnlUzpyicnXNgxagRhgQ=
X-Google-Smtp-Source: ADFU+vvJYRp360LfZ0sGp6K914KIUrcdCjJYmuameXZEnDpZ784VYbDfKnhEB+WIZyUd/G/tvyFBDA==
X-Received: by 2002:a02:5ec2:: with SMTP id h185mr5806438jab.2.1583771642858;
        Mon, 09 Mar 2020 09:34:02 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id q1sm15049593ile.71.2020.03.09.09.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 09:34:02 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [bitbake-devel][PATCH 06/15] bitbake: lib/bb/msg.py: Add filter utilities
Date: Mon,  9 Mar 2020 11:33:44 -0500
Message-Id: <20200309163353.15362-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309163353.15362-1-JPEWhacker@gmail.com>
References: <20200309163353.15362-1-JPEWhacker@gmail.com>

Adds generic filter utilities that can be used to filter when the log
level is greater than or equal to a defined value, or below a defined
value, as well as a generic function to translate a string to a logging
level (or bitbake logging level)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/msg.py | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/bitbake/lib/bb/msg.py b/bitbake/lib/bb/msg.py
index c70fd80806..8561826a6e 100644
--- a/bitbake/lib/bb/msg.py
+++ b/bitbake/lib/bb/msg.py
@@ -135,6 +135,28 @@ class BBLogFilterStdOut(BBLogFilter):
             return True
         return False
 
+class LogFilterGEQLevel(logging.Filter):
+    def __init__(self, level):
+        self.strlevel = str(level)
+        self.level = stringToLevel(level)
+
+    def __repr__(self):
+        return "%s level >= %s (%d)" % (self.__class__.__name__, self.strlevel, self.level)
+
+    def filter(self, record):
+        return (record.levelno >= self.level)
+
+class LogFilterLTLevel(logging.Filter):
+    def __init__(self, level):
+        self.strlevel = str(level)
+        self.level = stringToLevel(level)
+
+    def __repr__(self):
+        return "%s level < %s (%d)" % (self.__class__.__name__, self.strlevel, self.level)
+
+    def filter(self, record):
+        return (record.levelno < self.level)
+
 # Message control functions
 #
 
@@ -175,6 +197,19 @@ def addDefaultlogFilter(handler, cls = BBLogFilter, forcelevel=None):
 
     cls(handler, level, debug_domains)
 
+def stringToLevel(level):
+    try:
+        return int(level)
+    except ValueError:
+        pass
+
+    try:
+        return getattr(logging, level)
+    except AttributeError:
+        pass
+
+    return getattr(BBLogFormatter, level)
+
 #
 # Message handling functions
 #
-- 
2.17.1


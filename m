Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web11.783.1583771640281490240
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 09:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QtZJnZ1r;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id b17so9265068iln.3
        for <docs@lists.yoctoproject.org>; Mon, 09 Mar 2020 09:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9GpDTZg2EdA6OGVyzVkduC6kdcOl8rdgH43I5i9TB5s=;
        b=QtZJnZ1r58kpG1spA7m+enHfa+dhK0za8OMSQHArxzto5LJzvP16bKoHdmzD+f0/If
         MpazwLhMWmvlaZrzAWWSxGK3FY0Jik0CadbWBNqUbVJcrrA8+uPxwBKP6lxg//8E1E+9
         NjxCywjnw8YarCrxQrw23EcE5/1kdNczEZBwer+U3/lM5LW1X56W9GaL/o1e0UozCYVd
         MIYb6op/tgvkk/EKyM3Suwzws5mRsMGfoC97BLRSN+Zd5zMQuMDOxU8KEocu9RNeqhEZ
         8pv/xfSaxJWyhqeYEyU18VmpW4OKLdoPvDQl/jqKVgIDRtGDvFJDXzGkXX8ei4MvNu+o
         MKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9GpDTZg2EdA6OGVyzVkduC6kdcOl8rdgH43I5i9TB5s=;
        b=MZbOk31lpBV+Z52iDHiX0DkCAmSKTSc82bwUgIWB2VLj5NC4aAHEFQYs6lhV3AOnIm
         NadsptP9hx844maNX6k0chVzzfr8NpnyxZlEBbtAyNrN9/kYb4fR+X91khjhLsGjfx7I
         vPbYPJ2SA0WR6YilMl1Hat9pOOwuekq+7s2cFnfPLm7H+hdGi2dHgz7QW0LYcNhY90uB
         pGPm6oWMHjcE1GaxvZ4KGi/0wbFxFacBrSYp8gVSA+EsD4vmC6XktaWjgpo/nCN2txlh
         ZK6A+SJn5RKC6WVvPgyIuqf7U+gBa+fWt6a6FB9Ky+h6mRn4e8I3oq9TXp9xmd0PP+gV
         sMrA==
X-Gm-Message-State: ANhLgQ2hONByqcFvGcIzx9Y3s0XBqnKfEas+f2FtUwcDajOkXGW9ImmZ
	weQZ1m0Ztf4A/5OdPkt8qns=
X-Google-Smtp-Source: ADFU+vstHnbPzbKdsf4/6cOT6WwPIhvwhaawk7AHZXh2aSDTLxIPsec2rmmg9NFphjybYlwO92VIpA==
X-Received: by 2002:a92:35db:: with SMTP id c88mr2416237ilf.187.1583771639745;
        Mon, 09 Mar 2020 09:33:59 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id q1sm15049593ile.71.2020.03.09.09.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 09:33:59 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [bitbake-devel][PATCH 03/15] bitbake: lib/bb/msg.py: Use log level instead of debug count
Date: Mon,  9 Mar 2020 11:33:41 -0500
Message-Id: <20200309163353.15362-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309163353.15362-1-JPEWhacker@gmail.com>
References: <20200309163353.15362-1-JPEWhacker@gmail.com>

Passes around the actual logging level as the default log level variable
instead of the debug count. This makes it easier to deal with logging
levels since the conversion from debug count and verbose flag only has
to occur once when logging is initialized and after that actual log
levels can be used

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/bin/bitbake-worker |  2 +-
 bitbake/lib/bb/__init__.py |  2 +-
 bitbake/lib/bb/msg.py      | 22 +++++++++-------------
 bitbake/lib/bb/runqueue.py |  2 +-
 4 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/bitbake/bin/bitbake-worker b/bitbake/bin/bitbake-worker
index 1e641e81c2..fc28a34d8a 100755
--- a/bitbake/bin/bitbake-worker
+++ b/bitbake/bin/bitbake-worker
@@ -414,7 +414,7 @@ class BitbakeWorker(object):
 
     def handle_workerdata(self, data):
         self.workerdata = pickle.loads(data)
-        bb.msg.loggerDefaultDebugLevel = self.workerdata["logdefaultdebug"]
+        bb.msg.loggerDefaultLogLevel = self.workerdata["logdefaultlevel"]
         bb.msg.loggerDefaultVerbose = self.workerdata["logdefaultverbose"]
         bb.msg.loggerVerboseLogs = self.workerdata["logdefaultverboselogs"]
         bb.msg.loggerDefaultDomains = self.workerdata["logdefaultdomain"]
diff --git a/bitbake/lib/bb/__init__.py b/bitbake/lib/bb/__init__.py
index acd4af13a8..dc5e91e29a 100644
--- a/bitbake/lib/bb/__init__.py
+++ b/bitbake/lib/bb/__init__.py
@@ -47,7 +47,7 @@ class BBLogger(Logger):
         if not bb.event.worker_pid:
             if self.name in bb.msg.loggerDefaultDomains and loglevel > (bb.msg.loggerDefaultDomains[self.name]):
                 return
-            if level > (bb.msg.loggerDefaultDebugLevel):
+            if loglevel > bb.msg.loggerDefaultLogLevel:
                 return
         return self.log(loglevel, msg, *args, **kwargs)
 
diff --git a/bitbake/lib/bb/msg.py b/bitbake/lib/bb/msg.py
index d1b0e929d4..ea6a9543f7 100644
--- a/bitbake/lib/bb/msg.py
+++ b/bitbake/lib/bb/msg.py
@@ -135,7 +135,7 @@ class BBLogFilterStdOut(BBLogFilter):
 # Message control functions
 #
 
-loggerDefaultDebugLevel = 0
+loggerDefaultLogLevel = BBLogFormatter.NOTE
 loggerDefaultVerbose = False
 loggerVerboseLogs = False
 loggerDefaultDomains = {}
@@ -144,11 +144,17 @@ def init_msgconfig(verbose, debug, debug_domains=None):
     """
     Set default verbosity and debug levels config the logger
     """
-    bb.msg.loggerDefaultDebugLevel = debug
     bb.msg.loggerDefaultVerbose = verbose
     if verbose:
         bb.msg.loggerVerboseLogs = True
 
+    if debug:
+        bb.msg.loggerDefaultLogLevel = BBLogFormatter.DEBUG - debug + 1
+    elif verbose:
+        bb.msg.loggerDefaultLogLevel = BBLogFormatter.VERBOSE
+    else:
+        bb.msg.loggerDefaultLogLevel = BBLogFormatter.NOTE
+
     bb.msg.loggerDefaultDomains = {}
     if debug_domains:
         for (domainarg, iterator) in groupby(debug_domains):
@@ -156,17 +162,7 @@ def init_msgconfig(verbose, debug, debug_domains=None):
             bb.msg.loggerDefaultDomains["BitBake.%s" % domainarg] = logging.DEBUG - dlevel + 1
 
 def constructLogOptions():
-    debug = loggerDefaultDebugLevel
-    verbose = loggerDefaultVerbose
-
-    if debug:
-        level = BBLogFormatter.DEBUG - debug + 1
-    elif verbose:
-        level = BBLogFormatter.VERBOSE
-    else:
-        level = BBLogFormatter.NOTE
-
-    return level, loggerDefaultDomains
+    return loggerDefaultLogLevel, loggerDefaultDomains
 
 def addDefaultlogFilter(handler, cls = BBLogFilter, forcelevel=None):
     level, debug_domains = constructLogOptions()
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 32966b4f7c..4106fa4bc4 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1254,7 +1254,7 @@ class RunQueue:
             "fakerootdirs" : self.rqdata.dataCaches[mc].fakerootdirs,
             "fakerootnoenv" : self.rqdata.dataCaches[mc].fakerootnoenv,
             "sigdata" : bb.parse.siggen.get_taskdata(),
-            "logdefaultdebug" : bb.msg.loggerDefaultDebugLevel,
+            "logdefaultlevel" : bb.msg.loggerDefaultLogLevel,
             "logdefaultverbose" : bb.msg.loggerDefaultVerbose,
             "logdefaultverboselogs" : bb.msg.loggerVerboseLogs,
             "logdefaultdomain" : bb.msg.loggerDefaultDomains,
-- 
2.17.1


Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web11.789.1583771648282985432
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 09:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z2rRW3v6;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id k29so4061895ilg.0
        for <docs@lists.yoctoproject.org>; Mon, 09 Mar 2020 09:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p/HNZ8KoGtsbr4jsLYmw4BiFQXXrR6HYEhqea9IBZQM=;
        b=Z2rRW3v6PPtk976/8pa7X4D2WxkGu2XWTDsfYbl6yHmPThDYWiCsVChReCA7/laW6U
         LXlpvgQF7bLX5qDS++eR8h1SYAG98bAi28yytqEZGAh9PgAvv59MVKu/veNm7vwRaCis
         BhUawDl2ZVsz8H16+oMIHiJi4fqPLeucZc5PMyYeDZf9QqnDBCPscEx6LWTGCenKTORS
         Azh2LVPbwGZbDMuxC9Une1Susd1QiND4k98nP9VI0mvStF+Su2cBVlYblPyqfUf/BtXj
         T0NPC+gRti0A5DOufZsseeP24yU48+mvGiPpytCGVYrcYb8KNgdS70dOitlnOAfMByM1
         hIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p/HNZ8KoGtsbr4jsLYmw4BiFQXXrR6HYEhqea9IBZQM=;
        b=HFlyj4tSSnlKF7hT0vnJXOWkxV7v+OxyXBRG7VdoZbyAeuHmUc1VUm3uHBB3ya3Q2y
         whYqGBoax3LubWwYu1gaNW8vNDItv6gtv1y7/Ka57/c9UFKp40UdltGK2nLeRujk2tTs
         uUpcl/LmUhZVMz2Szexj2GkeQVh2fa5JuAxpU1OYVH5aQjOYUUb1ziiBSlF5kURM8Haj
         BY7zbzG+wR1HAxrYVWnTUnk7cckLub4YSDymcilaiPpNsGqCQKewqFW0XCLzlD8twOi5
         JlV+bIt/KQRnKs/U5039715vTSSXQ3KlsF6vzA9DJrf+h+F0gGnoog/n9dW28SENwG1q
         BDKg==
X-Gm-Message-State: ANhLgQ3zfhQSy0DUoccCMxGTM/njeUohWvol4Jk+wK4KRvMPUwDRZVte
	aoTqQd2TaizPSvosfebGI+4=
X-Google-Smtp-Source: ADFU+vsXJrZSmgHJV902GBrEvhpaV7AfvMPClZKXw3zuUT0brq8wC2PD0fYmnQ5LMgrm7A/gquLhSw==
X-Received: by 2002:a92:cb09:: with SMTP id s9mr16446541ilo.299.1583771647690;
        Mon, 09 Mar 2020 09:34:07 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id q1sm15049593ile.71.2020.03.09.09.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 09:34:07 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [bitbake-devel][PATCH 09/15] bitbake: knotty: Remove dependency on format variable
Date: Mon,  9 Mar 2020 11:33:47 -0500
Message-Id: <20200309163353.15362-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309163353.15362-1-JPEWhacker@gmail.com>
References: <20200309163353.15362-1-JPEWhacker@gmail.com>

Passing around the log formatter variable was unnecessary since the log
levels of interest can be accesses as class members of
bb.msg.BBLogFormatter. Switching to do this will make using the
structured python logging much easier, since it can be difficult to
extract out the formatter for a specific handler.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/tinfoil.py   |  4 +---
 bitbake/lib/bb/ui/knotty.py | 32 ++++++++++++++++++++------------
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/bitbake/lib/bb/tinfoil.py b/bitbake/lib/bb/tinfoil.py
index 9560eb5b49..5c5be456e2 100644
--- a/bitbake/lib/bb/tinfoil.py
+++ b/bitbake/lib/bb/tinfoil.py
@@ -735,11 +735,9 @@ class Tinfoil:
                         console = handler
                     elif handler.stream == sys.stderr:
                         errconsole = handler
-            format_str = "%(levelname)s: %(message)s"
-            format = bb.msg.BBLogFormatter(format_str)
             helper.shutdown = 0
             parseprogress = None
-            termfilter = bb.ui.knotty.TerminalFilter(helper, helper, console, errconsole, format, quiet=self.quiet)
+            termfilter = bb.ui.knotty.TerminalFilter(helper, helper, console, errconsole, quiet=self.quiet)
             try:
                 while True:
                     try:
diff --git a/bitbake/lib/bb/ui/knotty.py b/bitbake/lib/bb/ui/knotty.py
index aac12cd479..d5dce7172a 100644
--- a/bitbake/lib/bb/ui/knotty.py
+++ b/bitbake/lib/bb/ui/knotty.py
@@ -109,12 +109,11 @@ def pluralise(singular, plural, qty):
 
 
 class InteractConsoleLogFilter(logging.Filter):
-    def __init__(self, tf, format):
+    def __init__(self, tf):
         self.tf = tf
-        self.format = format
 
     def filter(self, record):
-        if record.levelno == self.format.NOTE and (record.msg.startswith("Running") or record.msg.startswith("recipe ")):
+        if record.levelno == bb.msg.BBLogFormatter.NOTE and (record.msg.startswith("Running") or record.msg.startswith("recipe ")):
             return False
         self.tf.clearFooter()
         return True
@@ -150,7 +149,7 @@ class TerminalFilter(object):
                 cr = (25, 80)
         return cr
 
-    def __init__(self, main, helper, console, errconsole, format, quiet):
+    def __init__(self, main, helper, console, errconsole, quiet):
         self.main = main
         self.helper = helper
         self.cuu = None
@@ -180,7 +179,16 @@ class TerminalFilter(object):
             termios.tcsetattr(fd, termios.TCSADRAIN, new)
             curses.setupterm()
             if curses.tigetnum("colors") > 2:
-                format.enable_color()
+                if console:
+                    try:
+                        console.formatter.enable_color()
+                    except AttributeError:
+                        pass
+                if errconsole:
+                    try:
+                        errconsole.formatter.enable_color()
+                    except AttributeError:
+                        pass
             self.ed = curses.tigetstr("ed")
             if self.ed:
                 self.cuu = curses.tigetstr("cuu")
@@ -197,9 +205,9 @@ class TerminalFilter(object):
             bb.note("Unable to use interactive mode for this terminal, using fallback")
             return
         if console:
-            console.addFilter(InteractConsoleLogFilter(self, format))
+            console.addFilter(InteractConsoleLogFilter(self))
         if errconsole:
-            errconsole.addFilter(InteractConsoleLogFilter(self, format))
+            errconsole.addFilter(InteractConsoleLogFilter(self))
 
         self.main_progress = None
 
@@ -469,7 +477,7 @@ def main(server, eventHandler, params, tf = TerminalFilter):
     printinterval = 5000
     lastprint = time.time()
 
-    termfilter = tf(main, helper, console, errconsole, format, params.options.quiet)
+    termfilter = tf(main, helper, console, errconsole, params.options.quiet)
     atexit.register(termfilter.finish)
 
     while True:
@@ -508,21 +516,21 @@ def main(server, eventHandler, params, tf = TerminalFilter):
             if isinstance(event, logging.LogRecord):
                 lastprint = time.time()
                 printinterval = 5000
-                if event.levelno >= format.ERROR:
+                if event.levelno >= bb.msg.BBLogFormatter.ERROR:
                     errors = errors + 1
                     return_value = 1
-                elif event.levelno == format.WARNING:
+                elif event.levelno == bb.msg.BBLogFormatter.WARNING:
                     warnings = warnings + 1
 
                 if event.taskpid != 0:
                     # For "normal" logging conditions, don't show note logs from tasks
                     # but do show them if the user has changed the default log level to
                     # include verbose/debug messages
-                    if event.levelno <= format.NOTE and (event.levelno < llevel or (event.levelno == format.NOTE and llevel != format.VERBOSE)):
+                    if event.levelno <= bb.msg.BBLogFormatter.NOTE and (event.levelno < llevel or (event.levelno == bb.msg.BBLogFormatter.NOTE and llevel != bb.msg.BBLogFormatter.VERBOSE)):
                         continue
 
                     # Prefix task messages with recipe/task
-                    if event.taskpid in helper.pidmap and event.levelno != format.PLAIN:
+                    if event.taskpid in helper.pidmap and event.levelno != bb.msg.BBLogFormatter.PLAIN:
                         taskinfo = helper.running_tasks[helper.pidmap[event.taskpid]]
                         event.msg = taskinfo['title'] + ': ' + event.msg
                 if hasattr(event, 'fn'):
-- 
2.17.1


Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.792.1583771653780060374
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 09:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HaqPP/r8;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id j69so9235157ila.11
        for <docs@lists.yoctoproject.org>; Mon, 09 Mar 2020 09:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kdwJ7fnO/vVAzYnb8Zdz1Byf4E3I0KMSBqjEaVRl2cU=;
        b=HaqPP/r8W9cFEQjoFE8F2xj/iUC0I/Rxjs1jw8n4C2IsNqVa2HcLgOb+rF7DJKsqqf
         ShkqBlWkd5LHbTNKJcj35JZxAPulw7WrULi6oeosT2czKxDBm8g0+5Grq57wiXF5Okeb
         9dD3AydWzay5/+hJM6irg0ypzbMtpCXSWOLqEvJvU/fpGfCZZE624/ZLmY/aXJ+u1BQw
         T6BPHG5sLv9Yo9CEYULDG+bOZK0pIQG6oQl0xjF1z4xRWbFNRUV2EhlBjGiJiOiF+LJW
         SSmrcbec3ZuIQDhA83DdbX6adsUX8dE1O3d9SfrhGOPkx9rRK2MlIfsGvrk/Io8vSQS1
         52Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kdwJ7fnO/vVAzYnb8Zdz1Byf4E3I0KMSBqjEaVRl2cU=;
        b=ofATRdO5IbRKAI/5M4U2cdqUewvnDKYTYFL0kH7HReExQ12bjy3euU1/2ZCx4fmpi6
         N04IXrQqrNPBb6v1lGf8MHEiCJJbxnDVqLhsfjYlJAEBIQjJRkcA47W3r/GKUrYC2Zi8
         VbrypvN7bzKkYiHMZ5TA3oIoS5dqiHqfz4nQskHPN+lxp+G8iM3lW3gOiGlKIgg2TCB4
         zeCTilL32Te6MNiTPOfIuhxvOEPXAIIC43IkdLhdB0X/u5uvV7e6KzSpLUc8mJXKON3V
         47clKcWm+EZeW8Ss77P2XTED0BBhgH/jGMz0DUzEUGuio7Vu8Kdsvv/s1Vkop7CiyvpC
         /KPg==
X-Gm-Message-State: ANhLgQ17wuSqQ1wwbdlgMMyuzb4fJ7XPxgXZG71AVh/DLCcDCqKBTZPS
	/1fXW1QcZz3uUoNntVxktsk=
X-Google-Smtp-Source: ADFU+vuRpgtTYPM4mQg388JwDgv20RyWFPKSdIWVB0Yl4pOpHy9m5m0xUHgr24ZclYSFQdV102eZug==
X-Received: by 2002:a05:6e02:4cd:: with SMTP id f13mr16550829ils.237.1583771653235;
        Mon, 09 Mar 2020 09:34:13 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id q1sm15049593ile.71.2020.03.09.09.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 09:34:12 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [bitbake-devel][PATCH 14/15] bitbake: Lower hash equivalence logging
Date: Mon,  9 Mar 2020 11:33:52 -0500
Message-Id: <20200309163353.15362-15-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309163353.15362-1-JPEWhacker@gmail.com>
References: <20200309163353.15362-1-JPEWhacker@gmail.com>

Lowers the level at which hash equivalence messages are logged so as to
not annoy the majority of users. The autobuilder can use a custom
logging configuration to log these to a file for debugging (see
contrib/autobuilderlog.json)

[YOCTO #13813]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/runqueue.py | 6 +++---
 bitbake/lib/bb/siggen.py   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index e84890b8b7..cef9b0fbbf 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -2264,7 +2264,7 @@ class RunQueueExecute:
             self.updated_taskhash_queue.remove((tid, unihash))
 
             if unihash != self.rqdata.runtaskentries[tid].unihash:
-                hashequiv_logger.info("Task %s unihash changed to %s" % (tid, unihash))
+                hashequiv_logger.verbose("Task %s unihash changed to %s" % (tid, unihash))
                 self.rqdata.runtaskentries[tid].unihash = unihash
                 bb.parse.siggen.set_unihash(tid, unihash)
                 toprocess.add(tid)
@@ -2309,7 +2309,7 @@ class RunQueueExecute:
                 elif tid in self.scenequeue_covered or tid in self.sq_live:
                     # Already ran this setscene task or it running. Report the new taskhash
                     bb.parse.siggen.report_unihash_equiv(tid, newhash, origuni, newuni, self.rqdata.dataCaches)
-                    hashequiv_logger.info("Already covered setscene for %s so ignoring rehash (remap)" % (tid))
+                    hashequiv_logger.verbose("Already covered setscene for %s so ignoring rehash (remap)" % (tid))
                     remapped = True
 
                 if not remapped:
@@ -2410,7 +2410,7 @@ class RunQueueExecute:
 
         for (tid, harddepfail, origvalid) in update_tasks:
             if tid in self.sqdata.valid and not origvalid:
-                hashequiv_logger.info("Setscene task %s became valid" % tid)
+                hashequiv_logger.verbose("Setscene task %s became valid" % tid)
             if harddepfail:
                 self.sq_task_failoutright(tid)
 
diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
index 0357b544b5..8bfc45235d 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -607,7 +607,7 @@ class SignatureGeneratorUniHashMixIn(object):
                 method = method + self.extramethod[tid]
 
             data = self.client().report_unihash_equiv(taskhash, method, wanted_unihash, extra_data)
-            hashequiv_logger.info('Reported task %s as unihash %s to %s (%s)' % (tid, wanted_unihash, self.server, str(data)))
+            hashequiv_logger.verbose('Reported task %s as unihash %s to %s (%s)' % (tid, wanted_unihash, self.server, str(data)))
 
             if data is None:
                 bb.warn("Server unable to handle unihash report")
@@ -616,14 +616,14 @@ class SignatureGeneratorUniHashMixIn(object):
             finalunihash = data['unihash']
 
             if finalunihash == current_unihash:
-                hashequiv_logger.info('Task %s unihash %s unchanged by server' % (tid, finalunihash))
+                hashequiv_logger.verbose('Task %s unihash %s unchanged by server' % (tid, finalunihash))
             elif finalunihash == wanted_unihash:
-                hashequiv_logger.info('Task %s unihash changed %s -> %s as wanted' % (tid, current_unihash, finalunihash))
+                hashequiv_logger.verbose('Task %s unihash changed %s -> %s as wanted' % (tid, current_unihash, finalunihash))
                 self.set_unihash(tid, finalunihash)
                 return True
             else:
                 # TODO: What to do here?
-                hashequiv_logger.info('Task %s unihash reported as unwanted hash %s' % (tid, finalunihash))
+                hashequiv_logger.verbose('Task %s unihash reported as unwanted hash %s' % (tid, finalunihash))
 
         except hashserv.client.HashConnectionError as e:
             bb.warn('Error contacting Hash Equivalence Server %s: %s' % (self.server, str(e)))
-- 
2.17.1


Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.788.1583771647237595370
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 09:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z+8/MhnG;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id r15so9797341iog.0
        for <docs@lists.yoctoproject.org>; Mon, 09 Mar 2020 09:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UztnvAP5cwTiRhOiGKOmF9h7jxy4rznosiLxuuyOMT0=;
        b=Z+8/MhnGISKR7gRtAw5vJ7yuGU0CIiu4JVzKXZzSvRo5snVK0bOieJqFtRMLJc4qZI
         JP1pYupZ+cWU/fYbPNXKSItnVetribnxZmPWX1JUBU9h0IJK3Ktm28eKiCrteWGX8XGi
         ZCy26YwEdN2TD+68rz8cq9MLPM5vUbekUAiXBkTyr1T8ewB4+a+V9c0UXUP70af4sG4N
         U3CrQ57QxzkbsjLjCb/RtCxSZSIyXJNdvp5GB+TFRZl41D8aD1HYeuHJNANsM9oCp4d+
         PSLjFqQ60gGeXB+SocNfZ+QoW3CF2gZpEgDVCIeDAh4N8Ka+0RzUHkVZYzYhQpbdk5o9
         mGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UztnvAP5cwTiRhOiGKOmF9h7jxy4rznosiLxuuyOMT0=;
        b=APwlNiQx6ZMmTonQUhxWpOP10XHhowmyKWP79IePcSa+p4sxFuFBGBoGw4WhPiWu5a
         VRSa7D6ki6JXoGR1L0YmuaDOqxygmJxd4JtqXUlaVRRiQdEpocxk8ihzQVPRBj7M28lk
         q28pxZsp0hbHfP09vvdhFXR1548osW1zLjXmHsJO1WKaoY4qyYtSpATyxfiL+2XdH1TJ
         7EeHVHAjPeKjjtC3UZYd3bYHg4Sk/y9SdcepTCgMxirdn+3JROjPqCoQxHgx8q+h7wzT
         uhH/SfkakyJ5rE5zdI4ZSh5R9Grg+arkJ3PhELbDbzZfFoLzOKQpySjVzjv+4jxNLmHq
         4f8A==
X-Gm-Message-State: ANhLgQ0+TnMq/bZLD++7GWUKpk4F7wwOVioV73YPsuSNRO3S3zilgxdG
	8y14TCQZtBjtTdKJST4yDxTRI8OwpX0=
X-Google-Smtp-Source: ADFU+vtaUDoWSvMngKrAwS6nCiKq7yR8BsDmiE2ImOduAe1MjCqh7insKEBLio9LHiE98RDWEPIi1Q==
X-Received: by 2002:a02:cd17:: with SMTP id g23mr16240990jaq.116.1583771646617;
        Mon, 09 Mar 2020 09:34:06 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id q1sm15049593ile.71.2020.03.09.09.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 09:34:05 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [bitbake-devel][PATCH 08/15] bitbake: lib/bb/msg.py: Add helper to set logging config
Date: Mon,  9 Mar 2020 11:33:46 -0500
Message-Id: <20200309163353.15362-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309163353.15362-1-JPEWhacker@gmail.com>
References: <20200309163353.15362-1-JPEWhacker@gmail.com>

Adds a helper function to setup the structure logging information in
bitbake. The helper function takes a default configuration and an
optional path to a user config file that can be merged into the default.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/msg.py | 93 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/bitbake/lib/bb/msg.py b/bitbake/lib/bb/msg.py
index cab079e333..6259af037f 100644
--- a/bitbake/lib/bb/msg.py
+++ b/bitbake/lib/bb/msg.py
@@ -13,6 +13,7 @@ Message handling infrastructure for bitbake
 import sys
 import copy
 import logging
+import logging.config
 from itertools import groupby
 import bb
 import bb.event
@@ -227,3 +228,95 @@ def has_console_handler(logger):
             if handler.stream in [sys.stderr, sys.stdout]:
                 return True
     return False
+
+def setLoggingConfig(defaultconfig, userconfigfile=None):
+    logconfig = copy.deepcopy(defaultconfig)
+
+    if userconfigfile:
+        with open(userconfigfile, 'r') as f:
+            if userconfigfile.endswith('.yml') or userconfigfile.endswith('.yaml'):
+                import yaml
+                userconfig = yaml.load(f)
+            elif userconfigfile.endswith('.json') or userconfigfile.endswith('.cfg'):
+                import json
+                userconfig = json.load(f)
+            else:
+                raise BaseException("Unrecognized file format: %s" % userconfigfile)
+
+            if userconfig.get('bitbake_merge', True):
+                # Merge config with the default config
+                if userconfig.get('version') != logconfig['version']:
+                    raise BaseException("Bad user configuration version. Expected %r, got %r" % (logconfig['version'], userconfig.get('version')))
+
+                # Set some defaults to make merging easier
+                userconfig.setdefault("loggers", {})
+
+                # If a handler, formatter, or filter is defined in the user
+                # config, it will replace an existing one in the default config
+                for k in ("handlers", "formatters", "filters"):
+                    logconfig.setdefault(k, {}).update(userconfig.get(k, {}))
+
+                seen_loggers = set()
+                for name, l in logconfig["loggers"].items():
+                    # If the merge option is set, merge the handlers and
+                    # filters. Otherwise, if it is False, this logger won't get
+                    # add to the set of seen loggers and will replace the
+                    # existing one
+                    if l.get('bitbake_merge', True):
+                        ulogger = userconfig["loggers"].setdefault(name, {})
+                        ulogger.setdefault("handlers", [])
+                        ulogger.setdefault("filters", [])
+
+                        # Merge lists
+                        l.setdefault("handlers", []).extend(ulogger["handlers"])
+                        l.setdefault("filters", []).extend(ulogger["filters"])
+
+                        # Replace other properties if present
+                        if "level" in ulogger:
+                            l["level"] = ulogger["level"]
+
+                        if "propagate" in ulogger:
+                            l["propagate"] = ulogger["propagate"]
+
+                        seen_loggers.add(name)
+
+                # Add all loggers present in the user config, but not any that
+                # have already been processed
+                for name in set(userconfig["loggers"].keys()) - seen_loggers:
+                    logconfig["loggers"][name] = userconfig["loggers"][name]
+
+            else:
+                # Replace the entire default config
+                logconfig = userconfig
+
+    # Convert all level parameters to integers in case users want to use the
+    # bitbake defined level names
+    for h in logconfig["handlers"].values():
+        if "level" in h:
+            h["level"] = bb.msg.stringToLevel(h["level"])
+
+    for l in logconfig["loggers"].values():
+        if "level" in l:
+            l["level"] = bb.msg.stringToLevel(l["level"])
+
+    logging.config.dictConfig(logconfig)
+
+    # The user may have specified logging domains they want at a higher debug
+    # level than the standard.
+    for name, l in logconfig["loggers"].items():
+        if not name.startswith("BitBake."):
+            continue
+
+        if not "level" in l:
+            continue
+
+        curlevel = bb.msg.loggerDefaultDomains.get(name)
+        # Note: level parameter should already be a int because of conversion
+        # above
+        newlevel = int(l["level"])
+        if curlevel is None or newlevel < curlevel:
+            bb.msg.loggerDefaultDomains[name] = newlevel
+
+        # TODO: I don't think that setting the global log level should be necessary
+        #if newlevel < bb.msg.loggerDefaultLogLevel:
+        #    bb.msg.loggerDefaultLogLevel = newlevel
-- 
2.17.1


Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web11.784.1583771641389525614
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 09:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dTxAt8Fg;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id p1so5244050ils.12
        for <docs@lists.yoctoproject.org>; Mon, 09 Mar 2020 09:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8O7lGO0LmVTJ+Ts7W9DTNCOdKbql7m/OYMhfsPWF8ng=;
        b=dTxAt8FgBbkhPyaQ13rTUJpmlqf/roRuxDdk7lnyNHWzT7OlzhWSPimb8c1+eU8Ojt
         MQCgm5UB/ZMSUbsZn2WacWF7q1wlOpl9tlcKZL5DR/EfFW3QPZKmrm+shpo8qdWZQw5+
         jsFtFsCtblbcPpQwpqsCzG2sNeyVdUL+0yvllTDEIGiW7iQPBUSpZuIww3KQKyJTISB6
         L767mIBEPIdkmeO2zfxdkimbO2u7EhQKzEdyxPuMO8eSGOrqM9uVWi8Ru+ThvwVQyUe/
         K2/ePuh+DYR9jLDTUpXm+ZI9WvemxDhdRME5L5n/6336k2dy+R7XrrFyOU6RbNJ6mmfN
         +Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8O7lGO0LmVTJ+Ts7W9DTNCOdKbql7m/OYMhfsPWF8ng=;
        b=JvMIMW9Kuyd3ITqbdPvu2AWHjQrlWadHbz4faBfecFfWwyqT+IbemXHxqy2bmdzmDf
         7MlNzl/FqRK92Jw3KaRjmQ/ZKLTk5kg2tjLO+Za1nxxBUJLr0cOJYM/4LNghQTjYvXyK
         jmL0A/OkZTWpahV+2FcAUccv6U0D//u/h2IxtCwIFEuEYx2cx7Cx10evHX6m9hay8hIq
         Q7crS6o7YS/MFvu05xRCHZJ850irsDQK3BGcefI62QWDBc9mqXnG2BLjPypZCA9Pc4sG
         llp91/3SltBcn/Jt/3MAemwIdxYs3kxtkdmN9kSvYhoztLJJS9eaZA4n5z2xBaKn0C9s
         O+Dg==
X-Gm-Message-State: ANhLgQ0+EXVcYimZOExCb4618j4jWRebegU+jCjjIlzLN59YlBwAFRAA
	JBhRMK/qhALMcZCVA+KXSkQ=
X-Google-Smtp-Source: ADFU+vt7AXMZCExO6aPHpm+yVsQKvvHFk38JT7L2mQiPMtvG+Ed4UjD8xEZWQyNObrh9b9xrveR97g==
X-Received: by 2002:a92:9114:: with SMTP id t20mr16759978ild.258.1583771640832;
        Mon, 09 Mar 2020 09:34:00 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id q1sm15049593ile.71.2020.03.09.09.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 09:34:00 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [bitbake-devel][PATCH 04/15] bitbake: lib/bb/msg.py: Add repr for BBLogFormatter
Date: Mon,  9 Mar 2020 11:33:42 -0500
Message-Id: <20200309163353.15362-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309163353.15362-1-JPEWhacker@gmail.com>
References: <20200309163353.15362-1-JPEWhacker@gmail.com>

Adds a __repr__ function for BBLogFormatter. This allows it to get a
human readable string when printed using the logging_tree module

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/msg.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bitbake/lib/bb/msg.py b/bitbake/lib/bb/msg.py
index ea6a9543f7..c70fd80806 100644
--- a/bitbake/lib/bb/msg.py
+++ b/bitbake/lib/bb/msg.py
@@ -98,6 +98,9 @@ class BBLogFormatter(logging.Formatter):
     def enable_color(self):
         self.color_enabled = True
 
+    def __repr__(self):
+        return "%s fmt='%s' color=%s" % (self.__class__.__name__, self._fmt, "True" if self.color_enabled else "False")
+
 class BBLogFilter(object):
     def __init__(self, handler, level, debug_domains):
         self.stdlevel = level
-- 
2.17.1


Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web12.717.1583771650156350937
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 09:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JXFwS4h+;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id b17so9265582iln.3
        for <docs@lists.yoctoproject.org>; Mon, 09 Mar 2020 09:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y1dLSlyWy/MiZgoP6iiF/6QwWYrXPTD2jEbFS7UdqNI=;
        b=JXFwS4h+eGadAyWcvsKwBus+kITTz4bXLWkQvazsqByJIwlFKGt0D4Kk+xXHvqPGXX
         brLaRoPUNtr+psSH8vvRbCHv+Wn3c17IehOyCBKdk+Rj64JueBzja3rSQ+pCackH9rmv
         OmA2x8WnaNJRxk4WtcY9kdpqvj5sNm9tXJb2d//fIdOTy/fW+a1LavylcnT4QtiMGjw+
         92YBUdFNOddTndLrPc80yF5MizLXZWbEdQ1XY5StUbCRdqNgbN0YsSv3pRHtLcnklKbA
         qJ6EZs0yQhkaZtaj0KP5x/vy2zGHTCGFOvGDmWQEdgou1uolA+Ji9RmUCVruxsMUWxC/
         NisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y1dLSlyWy/MiZgoP6iiF/6QwWYrXPTD2jEbFS7UdqNI=;
        b=pN+/j9/Ztu4wm1AYw3mBqiolGM3kyQhg2nGBIijanLhWGW/k4/i+GpPaGucz1bv6Ks
         6yyJ7W8jvwM9+Jx/VENfX/E53Al5/mTjzMqGml0uj8/bwRKrH9B3fjbAj0f4tPrhJdqG
         xWiC08jW3GpRf7zJwiTcGxcpUg9wgkJS2zxyMmCRfbJRE26jqoep6lHgUGoSbVlvjToa
         Y4YVpv8Penv6TQD5/POY1XovSODTg7ODUTO4MBftkL3uUBxjBaXSnoPQp7sUq5WqgSM/
         NAXAYO5964PmhW+D2ncTCAsb97VEFN3u+nGNX8gBUe0un234o9vxI51XxLAw1a53R18T
         yuOw==
X-Gm-Message-State: ANhLgQ3UG0XXwUVSy6BvLw3wphConl8aKxM/uLz5CpglPItf0V41x5Zo
	VNwDjVuBAbuyh1mxpMe6373ndJALfdo=
X-Google-Smtp-Source: ADFU+vvmbgqZCQhouxgczl8/m7BeMRJZq0T4nRdXTHTLWBUn4yZOIt1EsZJQV0jOogtTwdX/0XBM9Q==
X-Received: by 2002:a92:ce05:: with SMTP id b5mr16143000ilo.303.1583771649588;
        Mon, 09 Mar 2020 09:34:09 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id q1sm15049593ile.71.2020.03.09.09.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 09:34:09 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [bitbake-devel][PATCH 11/15] bitbake: worker: Remove unnecessary addDefaultLogFilter
Date: Mon,  9 Mar 2020 11:33:49 -0500
Message-Id: <20200309163353.15362-12-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309163353.15362-1-JPEWhacker@gmail.com>
References: <20200309163353.15362-1-JPEWhacker@gmail.com>

Adding the default log filter here is unnecessary because there are no
defined logging domains when it is called, which means it does no actual
filtering.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/bin/bitbake-worker | 1 -
 1 file changed, 1 deletion(-)

diff --git a/bitbake/bin/bitbake-worker b/bitbake/bin/bitbake-worker
index fc28a34d8a..97cc0fd60f 100755
--- a/bitbake/bin/bitbake-worker
+++ b/bitbake/bin/bitbake-worker
@@ -65,7 +65,6 @@ if 0:
     format_str = "%(levelname)s: %(message)s"
     conlogformat = bb.msg.BBLogFormatter(format_str)
     consolelog = logging.FileHandler(logfilename)
-    bb.msg.addDefaultlogFilter(consolelog)
     consolelog.setFormatter(conlogformat)
     logger.addHandler(consolelog)
 
-- 
2.17.1


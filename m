Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.751.1583771639419161818
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 09:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xs0/61LI;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id f5so9248346ilq.5
        for <docs@lists.yoctoproject.org>; Mon, 09 Mar 2020 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qX0SoE7oLyxviYRLg/FYJszxmE4e5oEJF9Fyzs1pyoE=;
        b=Xs0/61LILJVZAzLDYTnbxbINyLtrrDxH2f9SqzptjTWNywfiB7Gqnu5ZJ7ipLwp+mD
         QyIVleEG4B2XZjQufurlJe/rsvSLQLg2EHA5PRkZc/ajxnfmEEIkG9+0dgdCyQ8IWIZn
         2v76zFdP8Ab3wUVGNvyKI4Li2UDnFOh5yBtv6fjnI8xLKml2cnatVraLU2Oc57x5GtYI
         9QM/56USeYgRMWfKsGLJ9KG0cHIPdog1Q2LskuikIkhvW2ou6Jw7kEPfCVVZ3a5mgMbW
         M1nCw+Mi1zePSZus633T9VXb1BEd6dI3bowUFNFnXW5gHY6VpGO0tenmvZqbjC7HciEs
         BDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qX0SoE7oLyxviYRLg/FYJszxmE4e5oEJF9Fyzs1pyoE=;
        b=aAdHaeyK2v1ykdCVb6mW/CiD/WK3UuRqJNtX12FCQU+c5eTIK5WXfWgkOX3cHoh3ED
         epKEpVj+WjHMKVNw/KdTC14M0e9mLaaFuUYDfMScQAfgHH5lsB/vwHu9urn1GY5cpo7h
         J174i3HSiBVveM35aVFWzl7eUXr7g8pPjC7YKYM0IQxAjQ9AQoZqnmmsxmpp7AWDbZCX
         ApOFOv0p1Ij8ByqjuGqk3B+YZFA666cRitY8Y/6SGa11biQMqNNgTraWRoLdmASNUBsF
         vD+ujeU+fQoXWjmeABcUQFIKk+pjsT5V9ZC+KrXPaLaajcflbjh2aL0t3Zf4VM8aURN4
         P3fw==
X-Gm-Message-State: ANhLgQ0Ojy4wdLVJ33gA9ERlyn+twTLzpAFxQXbNKZ9TF5QRvb5KqVDZ
	3r3wZhQcXFZ6mBQQgxeQ1zc=
X-Google-Smtp-Source: ADFU+vuv1Hw10fQRA8Li3lHsHc/q3ySxA6wQByobJhwq0NCAPXczpINrjygKzZIG+AAlewCe7pKXwA==
X-Received: by 2002:a92:7742:: with SMTP id s63mr15674002ilc.184.1583771638902;
        Mon, 09 Mar 2020 09:33:58 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id q1sm15049593ile.71.2020.03.09.09.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 09:33:58 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [bitbake-devel][PATCH 02/15] bitbake: knotty: Handle logging messages with specific logger
Date: Mon,  9 Mar 2020 11:33:40 -0500
Message-Id: <20200309163353.15362-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309163353.15362-1-JPEWhacker@gmail.com>
References: <20200309163353.15362-1-JPEWhacker@gmail.com>

Handles the log messages from the bitbake server with the specific
logger that the event originated from. This allows hierarchical logging
configurations to work as expected.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/ui/knotty.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/ui/knotty.py b/bitbake/lib/bb/ui/knotty.py
index cbb289b05f..a6a92b920f 100644
--- a/bitbake/lib/bb/ui/knotty.py
+++ b/bitbake/lib/bb/ui/knotty.py
@@ -522,7 +522,7 @@ def main(server, eventHandler, params, tf = TerminalFilter):
                         event.msg = taskinfo['title'] + ': ' + event.msg
                 if hasattr(event, 'fn'):
                     event.msg = event.fn + ': ' + event.msg
-                logger.handle(event)
+                logging.getLogger(event.name).handle(event)
                 continue
 
             if isinstance(event, bb.build.TaskFailedSilent):
-- 
2.17.1


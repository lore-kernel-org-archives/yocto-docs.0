Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web11.58257.1598894463459544459
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 10:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I4/W1O0F;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id j2so6819587ioj.7
        for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2020 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=isuE8sju8J1Y2wxRa3oYhc5kyKqnCljeTx6fVllmBEo=;
        b=I4/W1O0FG1uJG3Z0tBShNZU6+xWae/GP8djqYVU47jZAYzYULYLWyHZFDl7+ZhhG9X
         B+QpC+gIfNGbBPMzMvFH9wngVwMfm+gJKMh7rweQ149vv52/VokrEuG9I/l4eM5wwvn7
         EEzMWsOBJDnNmlZphf6dtOMJEeiqXvS/4BO73HX6FDSetCDKdscbMLfDePyxpMHFrUsR
         Q4Hn+hwwJMaN2Obg/67Xb+/QdOrZoFIypbn+VOYn8nKK/mJMzdMCC4bxFOypCvi4ZffL
         7k40qKBvRccGgTWMMzPXUjgM8MKMKLt0Xa6g1g5nXc12M2PowsxZoSn8pRlg5hGu54qR
         swqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=isuE8sju8J1Y2wxRa3oYhc5kyKqnCljeTx6fVllmBEo=;
        b=dVgXAYLytKQNiWdVdeyG9HztEX8unx4zbiHDMbSa3cpPaoj8fdD/oumL7RUTzRrx7W
         Zw9K15ksfjcR+fJcvfkZi3TJ3X1PUXN+G1QwE5GWAtMgv3J9YdGIG8hRX9FpdVFDuyMD
         IaD0tmp667OD9GRdvi90DPqbybLNXHYF8IKgXKN1BbpWDi3hMpfkRymqYPQmnZy3Jje+
         MlnT6mlziY/3yI0sjfIbXJDJfL/y0lQaB+9UASYMCmANjszXwMZ45YzR/7QB2LT0/Whk
         8kKF160VteR3/CW0xk4VIBcmkBZNMAQIvjiVSv4xqpCqwktdYrUAhkleqyp5Wi+ElJvb
         e8YA==
X-Gm-Message-State: AOAM530lFgFhWq7Syj7IZt9Ed0Cz6GC/EGjT4wsMGL/arVIGKTLpl7wm
	ESIM4G9FqQ9brOpg+kBK5Rlbg6wDffc=
X-Google-Smtp-Source: ABdhPJzFu7ISJGQxPZBXjZfI/3Ryl30hUK3m7AqaNWV7XVI59ep2cKYBDsg5wlv03V/Ze0i5E/+Wqg==
X-Received: by 2002:a6b:7c0d:: with SMTP id m13mr1565792iok.57.1598894462538;
        Mon, 31 Aug 2020 10:21:02 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:7282:816:6ef9:8e8c])
        by smtp.gmail.com with ESMTPSA id h18sm4103122iow.16.2020.08.31.10.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 10:21:01 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <Joshua.Watt@garmin.com>
Subject: [docs][PATCH] dev-manual: Clarify that virtual providers do not apply to runtime dependencies
Date: Mon, 31 Aug 2020 12:20:57 -0500
Message-Id: <20200831172057.34682-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <Joshua.Watt@garmin.com>

Clarifies that virtual providers are only used for build time
dependencies specified with PROVIDES and DEPENDS, and do not apply to
runtime dependencies specified with RPROVIDES and RDEPENDS.

Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
---
 documentation/dev-manual/dev-manual-common-tasks.xml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 1f24c7343..479ca4f20 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -3214,6 +3214,14 @@
                         </para></listitem>
                 </itemizedlist>
             </para>
+            <note>
+                Virtual providers only apply to build time dependencies with
+                <ulink url='&YOCTO_DOCS_REF_URL;#var-PROVIDES'><filename>PROVIDES</filename></ulink>
+                and <ulink url='&YOCTO_DOCS_REF_URL;#var-DEPENDS'><filename>DEPENDS</filename></ulink>.
+                They do not apply to runtime dependencies specified with
+                <ulink url='&YOCTO_DOCS_REF_URL;#var-RPROVIDES'><filename>RPROVIDES</filename></ulink> and
+                <ulink url='&YOCTO_DOCS_REF_URL;#var-RDEPENDS'><filename>RDEPENDS</filename></ulink>.
+            </note>
         </section>
 
         <section id='properly-versioning-pre-release-recipes'>
-- 
2.28.0


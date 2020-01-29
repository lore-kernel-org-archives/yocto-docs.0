Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.253.1580321744458744610
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 10:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X2szET1v;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id i6so71027pfc.1
        for <docs@lists.yoctoproject.org>; Wed, 29 Jan 2020 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=HNz5BCBqt5QZ4jH9bGIxoHyOAPExOjaRh0d4V6Vm9IU=;
        b=X2szET1vKddOfcZaP2PQllC/gW4O1A81QkLciLnAyTdtxzL51LauIEmJ4s/AOXPuLv
         zHivJKowp2bIObdc+Runk0q934RVmXBGkhPEnTnF+0jvl1AW0yXr0spcAfm43dHVsoET
         RgHYae43ooehccJdZmDhzvqu7X7gE0H3rYrWm7qiLufFPJuhWX0ZoV+31vEnhEAsbrF/
         uN5MtM87ZHUSHHbEFdHi6/fheLV+laxC1OC8nh+Il2r0XPs5I4xagI05LbTYL5lXAXJn
         eMtG89oL5yZRRf3NtMcN2rSbzXEQE4+EUdGBLJsJN+dEgOA0bSt9Xj+nb83euEqd2tw9
         ls9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=HNz5BCBqt5QZ4jH9bGIxoHyOAPExOjaRh0d4V6Vm9IU=;
        b=XCPkAsx+7blbHdor0qkhdDunNRf99Jo9J2a6jDWwTLZjrDY2pvHcd+8+0euMjRPFpE
         ZWnkL/TmG39DTEbbkZhYte8sea7nJTD2jQc5H5gd44PqQrdvPSDyo7ZnBB87fn1eTfmy
         GqPCRWkKZl9HejGNOn5E0Ue7ScAHefoIXPP98hdLL73iq1P7ceRT2CCR9dhjeyobpbxq
         RM71UPRtw9GZVAmWLRHMPrTMWAl+mrzRuUn4k0r3Rforb9YyYviior1aB/HlX2tQyTYy
         OgKg2qf2Pp16tNkSRPVzC0qiwhUtTW7bJRSOI3Pv4y4bPjn6fd12CuHicYz3r3eQxquU
         WXpA==
X-Gm-Message-State: APjAAAU1Oc/QdsJ4qj9o0AVE+rdKgcrbAWbCg8IhvPRjYtf3PH7LVFd9
	aSJ6z0xskWVWe7fosJXqbo8DH5PC
X-Google-Smtp-Source: APXvYqzuNM+pI+WJMrSn6rMkw1V5mBFnOJTPy2XjbVlJo8/i3pJod47QD2BY9z5Qkxy3Um5daYbGWQ==
X-Received: by 2002:a62:1b07:: with SMTP id b7mr867035pfb.186.1580321743734;
        Wed, 29 Jan 2020 10:15:43 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9c41:27a8:c371:1cdd])
        by smtp.gmail.com with ESMTPSA id d4sm3306013pjz.12.2020.01.29.10.15.42
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 10:15:43 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][PATCH] README: update to new mailing list
Date: Wed, 29 Jan 2020 10:15:41 -0800
Message-Id: <20200129181541.6446-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 README | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/README b/README
index d85781109..62c2a3ffb 100644
--- a/README
+++ b/README
@@ -10,6 +10,16 @@ An online version of the documentation can be found at:
 Where to Send Patches
 =====================
 
+When sending single patches, please using something like:
+'git send-email -1 --to docs@lists.yoctoproject.org --subject-prefix=yocto-docs][PATCH'
+
+These values can be set as defaults for this repository:
+
+$ git config sendemail.to docs@lists.yoctoproject.org
+$ git config format.subjectPrefix yocto-docs][PATCH
+
+Now you can just do 'git send-email origin/master' to send all local patches.
+
 Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
-Mailing list: yocto@yoctoproject.org
+Mailing list: docs@lists.yoctoproject.org
 Please cc: Scott Rifenbark <srifenbark@gmail.com> on changes.
-- 
2.17.1


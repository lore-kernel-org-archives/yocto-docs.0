Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.1645.1610392627880390268
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Jan 2021 11:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56276 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kz2ga-0005am-MK; Mon, 11 Jan 2021 21:17:06 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] common-tasks.rst: Fix GNU_HASH in hello.bb
Date: Mon, 11 Jan 2021 21:16:55 +0200
Message-Id: <20210111191655.23792-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add TARGET_CC_ARCH += "${LDFLAGS}" to the "Single .c File Package
(Hello World!)" example to fix the following GNU_HASH issue,
following the recommendations from section "Default Linker Hash
Style Changed":

ERROR: hello-1.0-r0 do_package_qa: QA Issue: File /usr/bin/helloworld in package hello doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]

Reported-by: Matthew Tsenkov <matthew.tsenkov@konsulko.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 documentation/dev-manual/common-tasks.rst               | 2 ++
 documentation/ref-manual/examples/hello-single/hello.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index e1dee8ecd..b816536d9 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2297,6 +2297,8 @@ directory BitBake uses for the build.
 
    S = "${WORKDIR}"
 
+   TARGET_CC_ARCH += "${LDFLAGS}"
+
    do_compile() {
        ${CC} helloworld.c -o helloworld
    }
diff --git a/documentation/ref-manual/examples/hello-single/hello.bb b/documentation/ref-manual/examples/hello-single/hello.bb
index 0812743e3..1a2896769 100644
--- a/documentation/ref-manual/examples/hello-single/hello.bb
+++ b/documentation/ref-manual/examples/hello-single/hello.bb
@@ -7,6 +7,8 @@ SRC_URI = "file://helloworld.c"
 
 S = "${WORKDIR}"
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_compile() {
 	${CC} helloworld.c -o helloworld
 }
-- 
2.17.1


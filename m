Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.12913.1610473575496370749
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 09:46:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45166 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzNkC-00066p-AU; Tue, 12 Jan 2021 19:46:13 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCHv2] common-tasks.rst: Fix GNU_HASH in hello.bb
Date: Tue, 12 Jan 2021 19:46:00 +0200
Message-Id: <20210112174600.4731-1-leon.anavi@konsulko.com>
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

Fix the following GNU_HASH issue in "Single .c File Package
(Hello World!)" example:

ERROR: hello-1.0-r0 do_package_qa: QA Issue: File /usr/bin/helloworld in package hello doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]

Reported-by: Matthew Tsenkov <matthew.tsenkov@konsulko.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 documentation/dev-manual/common-tasks.rst               | 2 +-
 documentation/ref-manual/examples/hello-single/hello.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index e1dee8ecd..6281e0e3b 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2298,7 +2298,7 @@ directory BitBake uses for the build.
    S = "${WORKDIR}"
 
    do_compile() {
-       ${CC} helloworld.c -o helloworld
+       ${CC} ${LDFLAGS} helloworld.c -o helloworld
    }
 
    do_install() {
diff --git a/documentation/ref-manual/examples/hello-single/hello.bb b/documentation/ref-manual/examples/hello-single/hello.bb
index 0812743e3..90d3aefd8 100644
--- a/documentation/ref-manual/examples/hello-single/hello.bb
+++ b/documentation/ref-manual/examples/hello-single/hello.bb
@@ -8,7 +8,7 @@ SRC_URI = "file://helloworld.c"
 S = "${WORKDIR}"
 
 do_compile() {
-	${CC} helloworld.c -o helloworld
+	${CC} ${LDFLAGS} helloworld.c -o helloworld
 }
 
 do_install() {
-- 
2.17.1


Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.26057.1603043881665193944
 for <docs@lists.yoctoproject.org>;
 Sun, 18 Oct 2020 10:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.8
Received: from localhost.localdomain (80-110-110-8.cgn.dynamic.surfer.at [80.110.110.8])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id E60936000C;
	Sun, 18 Oct 2020 17:57:59 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 3/3] docs: dev-manual-common-tasks: update python webserver example to python3
Date: Sun, 18 Oct 2020 19:57:12 +0200
Message-Id: <20201018175712.23800-3-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201018175712.23800-1-foss@0leil.net>
References: <20201018175712.23800-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SimpleHTTPServer is python2 only, the module in python3 is http.server.

Let's use this one since everything in Yocto Project is using python3
nowadays.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/dev-manual/dev-manual-common-tasks.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 75ef5c98c..79595d58a 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -7164,11 +7164,11 @@ Host or Server Machine Setup
 
 Although other protocols are possible, a server using HTTP typically
 serves packages. If you want to use HTTP, then set up and configure a
-web server such as Apache 2, lighttpd, or SimpleHTTPServer on the
+web server such as Apache 2, lighttpd, or Python web server on the
 machine serving the packages.
 
 To keep things simple, this section describes how to set up a
-SimpleHTTPServer web server to share package feeds from the developer's
+Python web server to share package feeds from the developer's
 machine. Although this server might not be the best for a production
 environment, the setup is simple and straight forward. Should you want
 to use a different server more suited for production (e.g. Apache 2,
@@ -7183,7 +7183,7 @@ setting of "package_rpm":
 ::
 
    $ cd ~/poky/build/tmp/deploy/rpm
-   $ python -m SimpleHTTPServer
+   $ python3 -m http.server
 
 .. _runtime-package-management-target:
 
-- 
2.26.2


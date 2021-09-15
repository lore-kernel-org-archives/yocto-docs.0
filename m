Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.6994.1631709950479644033
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 05:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0A910200005;
	Wed, 15 Sep 2021 12:45:48 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 4/4] ref-manual: update "devtool check-upgrade-status" output
Date: Wed, 15 Sep 2021 14:45:34 +0200
Message-Id: <20210915124534.2201062-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915124534.2201062-1-michael.opdenacker@bootlin.com>
References: <16A4FF61F6C3D5CE.26939@lists.yoctoproject.org>
 <20210915124534.2201062-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This command now uses "INFO" insted of "NOTES" and output
information in columns. Also good to show more recent
versions of recipes.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/devtool-reference.rst | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index da5ef5d376..03e3b79219 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -384,15 +384,12 @@ for an example.
 
    $ devtool check-upgrade-status
    ...
-   NOTE: acpid 2.0.30 2.0.31 Ross Burton <ross.burton@intel.com>
-   NOTE: u-boot-fw-utils 2018.11 2019.01 Marek Vasut <marek.vasut@gmail.com> d3689267f92c5956e09cc7d1baa4700141662bff
-   NOTE: u-boot-tools 2018.11 2019.01 Marek Vasut <marek.vasut@gmail.com> d3689267f92c5956e09cc7d1baa4700141662bff
-   .
-   .
-   .
-   NOTE: base-passwd 3.5.29 3.5.45 Anuj Mittal <anuj.mittal@intel.com> cannot be updated due to: Version 3.5.38 requires cdebconf for update-passwd utility
-   NOTE: busybox 1.29.2 1.30.0 Andrej Valek <andrej.valek@siemens.com>
-   NOTE: dbus-test 1.12.10 1.12.12 Chen Qi <Qi.Chen@windriver.com>
+   INFO: bind                      9.16.20         9.16.21         Armin Kuster <akuster808@gmail.com>
+   INFO: inetutils                 2.1             2.2             Tom Rini <trini@konsulko.com>
+   INFO: iproute2                  5.13.0          5.14.0          Changhyeok Bae <changhyeok.bae@gmail.com>
+   INFO: openssl                   1.1.1l          3.0.0           Alexander Kanavin <alex.kanavin@gmail.com>
+   INFO: base-passwd               3.5.29          3.5.51          Anuj Mittal <anuj.mittal@intel.com>  cannot be updated due to: Version 3.5.38 requires cdebconf for update-passwd utility
+   ...
 
 .. _devtool-upgrading-a-recipe:
 
-- 
2.25.1


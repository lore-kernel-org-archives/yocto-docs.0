Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.421.1631728741383317648
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 10:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A704720008;
	Wed, 15 Sep 2021 17:58:59 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v3 5/5] ref-manual: update "devtool check-upgrade-status" output
Date: Wed, 15 Sep 2021 19:58:42 +0200
Message-Id: <20210915175842.2998541-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org>
 <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
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
index 8819879d2f..1d2064f77f 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -386,15 +386,12 @@ for an example.
 
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
 
 Last but not least, you may set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1``
 in a recipe when no way is found to determine its latest upstream version.
-- 
2.25.1


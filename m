Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.11283.1631631591332057229
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Sep 2021 07:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8C07920000F;
	Tue, 14 Sep 2021 14:59:49 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: delete unmaintained history sections
Date: Tue, 14 Sep 2021 16:59:30 +0200
Message-Id: <20210914145930.371537-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This deletes the history sections in each sub-manual,
which didn't add any value, given that they didn't list
the changes from one Yocto Project version to the next.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/history.rst       | 73 ----------------------
 documentation/bsp-guide/index.rst         |  1 -
 documentation/dev-manual/history.rst      | 67 --------------------
 documentation/dev-manual/index.rst        |  1 -
 documentation/kernel-dev/history.rst      | 58 ------------------
 documentation/kernel-dev/index.rst        |  1 -
 documentation/overview-manual/history.rst | 28 ---------
 documentation/overview-manual/index.rst   |  1 -
 documentation/profile-manual/history.rst  | 58 ------------------
 documentation/profile-manual/index.rst    |  1 -
 documentation/ref-manual/history.rst      | 74 -----------------------
 documentation/ref-manual/index.rst        |  1 -
 documentation/sdk-manual/history.rst      | 40 ------------
 documentation/sdk-manual/index.rst        |  1 -
 documentation/test-manual/history.rst     | 16 -----
 documentation/test-manual/index.rst       |  1 -
 documentation/toaster-manual/history.rst  | 46 --------------
 documentation/toaster-manual/index.rst    |  1 -
 18 files changed, 469 deletions(-)
 delete mode 100644 documentation/bsp-guide/history.rst
 delete mode 100644 documentation/dev-manual/history.rst
 delete mode 100644 documentation/kernel-dev/history.rst
 delete mode 100644 documentation/overview-manual/history.rst
 delete mode 100644 documentation/profile-manual/history.rst
 delete mode 100644 documentation/ref-manual/history.rst
 delete mode 100644 documentation/sdk-manual/history.rst
 delete mode 100644 documentation/test-manual/history.rst
 delete mode 100644 documentation/toaster-manual/history.rst

diff --git a/documentation/bsp-guide/history.rst b/documentation/bsp-guide/history.rst
deleted file mode 100644
index d7cd8ef7f0..0000000000
--- a/documentation/bsp-guide/history.rst
+++ /dev/null
@@ -1,73 +0,0 @@
-.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
-
-***********************
-Manual Revision History
-***********************
-
-.. list-table::
-   :widths: 10 15 40
-   :header-rows: 1
-
-   * - Revision
-     - Date
-     - Note
-   * - 0.9
-     - November 2010
-     - The initial document released with the Yocto Project 0.9 Release
-   * - 1.0
-     - April 2011
-     - Released with the Yocto Project 1.0 Release.
-   * - 1.1
-     - October 2011
-     - Released with the Yocto Project 1.1 Release.
-   * - 1.2
-     - April 2012
-     - Released with the Yocto Project 1.2 Release.
-   * - 1.3
-     - October 2012
-     - Released with the Yocto Project 1.3 Release.
-   * - 1.4
-     - April 2013
-     - Released with the Yocto Project 1.4 Release.
-   * - 1.5
-     - October 2013
-     - Released with the Yocto Project 1.5 Release.
-   * - 1.6
-     - April 2014
-     - Released with the Yocto Project 1.6 Release.
-   * - 1.7
-     - October 2014
-     - Released with the Yocto Project 1.7 Release.
-   * - 1.8
-     - April 2015
-     - Released with the Yocto Project 1.8 Release.
-   * - 2.0
-     - October 2015
-     - Released with the Yocto Project 2.0 Release.
-   * - 2.1
-     - April 2016
-     - Released with the Yocto Project 2.1 Release.
-   * - 2.2
-     - October 2016
-     - Released with the Yocto Project 2.2 Release.
-   * - 2.3
-     - May 2017
-     - Released with the Yocto Project 2.3 Release.
-   * - 2.4
-     - October 2017
-     - Released with the Yocto Project 2.4 Release.
-   * - 2.5
-     - May 2018
-     - Released with the Yocto Project 2.5 Release.
-   * - 2.6
-     - November 2018
-     - Released with the Yocto Project 2.6 Release.
-   * - 2.7
-     - May 2019
-     - Released with the Yocto Project 2.7 Release.
-   * - 3.0
-     - October 2019
-     - Released with the Yocto Project 3.0 Release.
-   * - 3.1
-     - April 2020
-     - Released with the Yocto Project 3.1 Release.
diff --git a/documentation/bsp-guide/index.rst b/documentation/bsp-guide/index.rst
index a4394a85ed..9a8e034ae6 100644
--- a/documentation/bsp-guide/index.rst
+++ b/documentation/bsp-guide/index.rst
@@ -11,6 +11,5 @@ Yocto Project Board Support Package Developer's Guide
    :numbered:
 
    bsp
-   history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/dev-manual/history.rst b/documentation/dev-manual/history.rst
deleted file mode 100644
index 1ba312422c..0000000000
--- a/documentation/dev-manual/history.rst
+++ /dev/null
@@ -1,67 +0,0 @@
-.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
-
-***********************
-Manual Revision History
-***********************
-
-.. list-table::
-   :widths: 10 15 40
-   :header-rows: 1
-
-   * - Revision
-     - Date
-     - Note
-   * - 1.1
-     - October 2011
-     - The initial document released with the Yocto Project 1.1 Release
-   * - 1.2
-     - April 2012
-     - Released with the Yocto Project 1.2 Release.
-   * - 1.3
-     - October 2012
-     - Released with the Yocto Project 1.3 Release.
-   * - 1.4
-     - April 2013
-     - Released with the Yocto Project 1.4 Release.
-   * - 1.5
-     - October 2013
-     - Released with the Yocto Project 1.5 Release.
-   * - 1.6
-     - April 2014
-     - Released with the Yocto Project 1.6 Release.
-   * - 1.7
-     - October 2014
-     - Released with the Yocto Project 1.7 Release.
-   * - 1.8
-     - April 2015
-     - Released with the Yocto Project 1.8 Release.
-   * - 2.0
-     - October 2015
-     - Released with the Yocto Project 2.0 Release.
-   * - 2.1
-     - April 2016
-     - Released with the Yocto Project 2.1 Release.
-   * - 2.2
-     - October 2016
-     - Released with the Yocto Project 2.2 Release.
-   * - 2.3
-     - May 2017
-     - Released with the Yocto Project 2.3 Release.
-   * - 2.4
-     - October 2017
-     - Released with the Yocto Project 2.4 Release.
-   * - 2.5
-     - May 2018
-     - Released with the Yocto Project 2.5 Release.
-   * - 2.6
-     - November 2018
-     - Released with the Yocto Project 2.6 Release.
-   * - 2.7
-     - May 2019
-     - Released with the Yocto Project 2.7 Release.
-   * - 3.0
-     - October 2019
-     - Released with the Yocto Project 3.0 Release.
-   * - 3.1
-     - April 2020
-     - Released with the Yocto Project 3.1 Release.
diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index 941db2df8c..f16b135c4d 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -14,6 +14,5 @@ Yocto Project Development Tasks Manual
    start
    common-tasks
    qemu
-   history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/kernel-dev/history.rst b/documentation/kernel-dev/history.rst
deleted file mode 100644
index 761b506aca..0000000000
--- a/documentation/kernel-dev/history.rst
+++ /dev/null
@@ -1,58 +0,0 @@
-.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
-
-***********************
-Manual Revision History
-***********************
-
-.. list-table::
-   :widths: 10 15 40
-   :header-rows: 1
-
-   * - Revision
-     - Date
-     - Note
-   * - 1.4
-     - April 2013
-     - The initial document released with the Yocto Project 1.4 Release
-   * - 1.5
-     - October 2013
-     - Released with the Yocto Project 1.5 Release.
-   * - 1.6
-     - April 2014
-     - Released with the Yocto Project 1.6 Release.
-   * - 1.7
-     - October 2014
-     - Released with the Yocto Project 1.7 Release.
-   * - 1.8
-     - April 2015
-     - Released with the Yocto Project 1.8 Release.
-   * - 2.0
-     - October 2015
-     - Released with the Yocto Project 2.0 Release.
-   * - 2.1
-     - April 2016
-     - Released with the Yocto Project 2.1 Release.
-   * - 2.2
-     - October 2016
-     - Released with the Yocto Project 2.2 Release.
-   * - 2.3
-     - May 2017
-     - Released with the Yocto Project 2.3 Release.
-   * - 2.4
-     - October 2017
-     - Released with the Yocto Project 2.4 Release.
-   * - 2.5
-     - May 2018
-     - Released with the Yocto Project 2.5 Release.
-   * - 2.6
-     - November 2018
-     - Released with the Yocto Project 2.6 Release.
-   * - 2.7
-     - May 2019
-     - Released with the Yocto Project 2.7 Release.
-   * - 3.0
-     - October 2019
-     - Released with the Yocto Project 3.0 Release.
-   * - 3.1
-     - April 2020
-     - Released with the Yocto Project 3.1 Release.
diff --git a/documentation/kernel-dev/index.rst b/documentation/kernel-dev/index.rst
index a8848ec8cc..bd20e371e0 100644
--- a/documentation/kernel-dev/index.rst
+++ b/documentation/kernel-dev/index.rst
@@ -16,6 +16,5 @@ Yocto Project Linux Kernel Development Manual
    concepts-appx
    maint-appx
    faq
-   history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/overview-manual/history.rst b/documentation/overview-manual/history.rst
deleted file mode 100644
index 6fc700a013..0000000000
--- a/documentation/overview-manual/history.rst
+++ /dev/null
@@ -1,28 +0,0 @@
-.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
-
-***********************
-Manual Revision History
-***********************
-
-.. list-table::
-   :widths: 10 15 40
-   :header-rows: 1
-
-   * - Revision
-     - Date
-     - Note
-   * - 2.5
-     - May 2018
-     - The initial document released with the Yocto Project 2.5 Release
-   * - 2.6
-     - November 2018
-     - Released with the Yocto Project 2.6 Release.
-   * - 2.7
-     - May 2019
-     - Released with the Yocto Project 2.7 Release.
-   * - 3.0
-     - October 2019
-     - Released with the Yocto Project 3.0 Release.
-   * - 3.1
-     - April 2020
-     - Released with the Yocto Project 3.1 Release.
diff --git a/documentation/overview-manual/index.rst b/documentation/overview-manual/index.rst
index 123aed9b8b..04061f8f4e 100644
--- a/documentation/overview-manual/index.rst
+++ b/documentation/overview-manual/index.rst
@@ -14,6 +14,5 @@ Yocto Project Overview and Concepts Manual
    yp-intro
    development-environment
    concepts
-   history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/profile-manual/history.rst b/documentation/profile-manual/history.rst
deleted file mode 100644
index 761b506aca..0000000000
--- a/documentation/profile-manual/history.rst
+++ /dev/null
@@ -1,58 +0,0 @@
-.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
-
-***********************
-Manual Revision History
-***********************
-
-.. list-table::
-   :widths: 10 15 40
-   :header-rows: 1
-
-   * - Revision
-     - Date
-     - Note
-   * - 1.4
-     - April 2013
-     - The initial document released with the Yocto Project 1.4 Release
-   * - 1.5
-     - October 2013
-     - Released with the Yocto Project 1.5 Release.
-   * - 1.6
-     - April 2014
-     - Released with the Yocto Project 1.6 Release.
-   * - 1.7
-     - October 2014
-     - Released with the Yocto Project 1.7 Release.
-   * - 1.8
-     - April 2015
-     - Released with the Yocto Project 1.8 Release.
-   * - 2.0
-     - October 2015
-     - Released with the Yocto Project 2.0 Release.
-   * - 2.1
-     - April 2016
-     - Released with the Yocto Project 2.1 Release.
-   * - 2.2
-     - October 2016
-     - Released with the Yocto Project 2.2 Release.
-   * - 2.3
-     - May 2017
-     - Released with the Yocto Project 2.3 Release.
-   * - 2.4
-     - October 2017
-     - Released with the Yocto Project 2.4 Release.
-   * - 2.5
-     - May 2018
-     - Released with the Yocto Project 2.5 Release.
-   * - 2.6
-     - November 2018
-     - Released with the Yocto Project 2.6 Release.
-   * - 2.7
-     - May 2019
-     - Released with the Yocto Project 2.7 Release.
-   * - 3.0
-     - October 2019
-     - Released with the Yocto Project 3.0 Release.
-   * - 3.1
-     - April 2020
-     - Released with the Yocto Project 3.1 Release.
diff --git a/documentation/profile-manual/index.rst b/documentation/profile-manual/index.rst
index 6e54133e0a..0270932ca0 100644
--- a/documentation/profile-manual/index.rst
+++ b/documentation/profile-manual/index.rst
@@ -14,6 +14,5 @@ Yocto Project Profiling and Tracing Manual
    arch
    usage
    examples
-   history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/ref-manual/history.rst b/documentation/ref-manual/history.rst
deleted file mode 100644
index dc0a2ae797..0000000000
--- a/documentation/ref-manual/history.rst
+++ /dev/null
@@ -1,74 +0,0 @@
-.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
-
-***********************
-Manual Revision History
-***********************
-
-.. list-table::
-   :widths: 10 15 40
-   :header-rows: 1
-
-   * - Revision
-     - Date
-     - Note
-   * - 0.9
-     - November 2010
-     - The initial document released with the Yocto Project 0.9 Release
-   * - 1.0
-     - April 2011
-     - Released with the Yocto Project 1.0 Release.
-   * - 1.1
-     - October 2011
-     - Released with the Yocto Project 1.1 Release.
-   * - 1.2
-     - April 2012
-     - Released with the Yocto Project 1.2 Release.
-   * - 1.3
-     - October 2012
-     - Released with the Yocto Project 1.3 Release.
-   * - 1.4
-     - April 2013
-     - Released with the Yocto Project 1.4 Release.
-   * - 1.5
-     - October 2013
-     - Released with the Yocto Project 1.5 Release.
-   * - 1.6
-     - April 2014
-     - Released with the Yocto Project 1.6 Release.
-   * - 1.7
-     - October 2014
-     - Released with the Yocto Project 1.7 Release.
-   * - 1.8
-     - April 2015
-     - Released with the Yocto Project 1.8 Release.
-   * - 2.0
-     - October 2015
-     - Released with the Yocto Project 2.0 Release.
-   * - 2.1
-     - April 2016
-     - Released with the Yocto Project 2.1 Release.
-   * - 2.2
-     - October 2016
-     - Released with the Yocto Project 2.2 Release.
-   * - 2.3
-     - May 2017
-     - Released with the Yocto Project 2.3 Release.
-   * - 2.4
-     - October 2017
-     - Released with the Yocto Project 2.4 Release.
-   * - 2.5
-     - May 2018
-     - Released with the Yocto Project 2.5 Release.
-   * - 2.6
-     - November 2018
-     - Released with the Yocto Project 2.6 Release.
-   * - 2.7
-     - May 2019
-     - Released with the Yocto Project 2.7 Release.
-   * - 3.0
-     - October 2019
-     - Released with the Yocto Project 3.0 Release.
-   * - 3.1
-     - April 2020
-     - Released with the Yocto Project 3.1 Release.
-
diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manual/index.rst
index 5cf10c5c2f..a746dde492 100644
--- a/documentation/ref-manual/index.rst
+++ b/documentation/ref-manual/index.rst
@@ -25,6 +25,5 @@ Yocto Project Reference Manual
    varlocality
    faq
    resources
-   history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/sdk-manual/history.rst b/documentation/sdk-manual/history.rst
deleted file mode 100644
index 8c10f6d2ee..0000000000
--- a/documentation/sdk-manual/history.rst
+++ /dev/null
@@ -1,40 +0,0 @@
-.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
-
-***********************
-Manual Revision History
-***********************
-
-.. list-table::
-   :widths: 10 15 40
-   :header-rows: 1
-
-   * - Revision
-     - Date
-     - Note
-   * - 2.1
-     - April 2016
-     - The initial document released with the Yocto Project 2.1 Release
-   * - 2.2
-     - October 2016
-     - Released with the Yocto Project 2.2 Release.
-   * - 2.3
-     - May 2017
-     - Released with the Yocto Project 2.3 Release.
-   * - 2.4
-     - October 2017
-     - Released with the Yocto Project 2.4 Release.
-   * - 2.5
-     - May 2018
-     - Released with the Yocto Project 2.5 Release.
-   * - 2.6
-     - November 2018
-     - Released with the Yocto Project 2.6 Release.
-   * - 2.7
-     - May 2019
-     - Released with the Yocto Project 2.7 Release.
-   * - 3.0
-     - October 2019
-     - Released with the Yocto Project 3.0 Release.
-   * - 3.1
-     - April 2020
-     - Released with the Yocto Project 3.1 Release.
diff --git a/documentation/sdk-manual/index.rst b/documentation/sdk-manual/index.rst
index fce2b199c7..dc7186b911 100644
--- a/documentation/sdk-manual/index.rst
+++ b/documentation/sdk-manual/index.rst
@@ -17,6 +17,5 @@ Yocto Project Application Development and the Extensible Software Development Ki
    appendix-obtain
    appendix-customizing
    appendix-customizing-standard
-   history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/test-manual/history.rst b/documentation/test-manual/history.rst
deleted file mode 100644
index 89d4aad21c..0000000000
--- a/documentation/test-manual/history.rst
+++ /dev/null
@@ -1,16 +0,0 @@
-.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
-
-***********************
-Manual Revision History
-***********************
-
-.. list-table::
-   :widths: 10 15 40
-   :header-rows: 1
-
-   * - Revision
-     - Date
-     - Note
-   * - 3.2
-     - October 2020
-     - The initial document released with the Yocto Project 3.2 Release
diff --git a/documentation/test-manual/index.rst b/documentation/test-manual/index.rst
index 4c590a6aa9..86a2f436ea 100644
--- a/documentation/test-manual/index.rst
+++ b/documentation/test-manual/index.rst
@@ -15,6 +15,5 @@ Yocto Project Test Environment Manual
    understand-autobuilder
    reproducible-builds
    yocto-project-compatible
-   history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/toaster-manual/history.rst b/documentation/toaster-manual/history.rst
deleted file mode 100644
index 05b63e5b9a..0000000000
--- a/documentation/toaster-manual/history.rst
+++ /dev/null
@@ -1,46 +0,0 @@
-.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
-
-***********************
-Manual Revision History
-***********************
-
-.. list-table::
-   :widths: 10 15 40
-   :header-rows: 1
-
-   * - Revision
-     - Date
-     - Note
-   * - 1.8
-     - April 2015
-     - The initial document released with the Yocto Project 1.8 Release
-   * - 2.0
-     - October 2015
-     - Released with the Yocto Project 2.0 Release.
-   * - 2.1
-     - April 2016
-     - Released with the Yocto Project 2.1 Release.
-   * - 2.2
-     - October 2016
-     - Released with the Yocto Project 2.2 Release.
-   * - 2.3
-     - May 2017
-     - Released with the Yocto Project 2.3 Release.
-   * - 2.4
-     - October 2017
-     - Released with the Yocto Project 2.4 Release.
-   * - 2.5
-     - May 2018
-     - Released with the Yocto Project 2.5 Release.
-   * - 2.6
-     - November 2018
-     - Released with the Yocto Project 2.6 Release.
-   * - 2.7
-     - May 2019
-     - Released with the Yocto Project 2.7 Release.
-   * - 3.0
-     - October 2019
-     - Released with the Yocto Project 3.0 Release.
-   * - 3.1
-     - April 2020
-     - Released with the Yocto Project 3.1 Release.
diff --git a/documentation/toaster-manual/index.rst b/documentation/toaster-manual/index.rst
index f13ba7b8a1..3ff4c6913a 100644
--- a/documentation/toaster-manual/index.rst
+++ b/documentation/toaster-manual/index.rst
@@ -14,6 +14,5 @@ Toaster User Manual
    start
    setup-and-use
    reference
-   history
 
 .. include:: /boilerplate.rst
-- 
2.25.1


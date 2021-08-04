Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.13259.1628102079822121986
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 11:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 71778200003;
	Wed,  4 Aug 2021 18:34:38 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 5/6] sdk-manual: overrides syntax updates
Date: Wed,  4 Aug 2021 20:34:25 +0200
Message-Id: <20210804183426.22333-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
References: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated with openembedded-core/scripts/contrib/convert-overrides.py

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/sdk-manual/appendix-customizing-standard.rst | 2 +-
 documentation/sdk-manual/appendix-obtain.rst               | 2 +-
 documentation/sdk-manual/extensible.rst                    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/sdk-manual/appendix-customizing-standard.rst b/documentation/sdk-manual/appendix-customizing-standard.rst
index 9bc70cf55c..c619c15e46 100644
--- a/documentation/sdk-manual/appendix-customizing-standard.rst
+++ b/documentation/sdk-manual/appendix-customizing-standard.rst
@@ -29,6 +29,6 @@ You can include API documentation as well as any other documentation
 provided by recipes with the standard SDK by adding "api-documentation"
 to the
 :term:`DISTRO_FEATURES`
-variable: DISTRO_FEATURES_append = " api-documentation" Setting this
+variable: DISTRO_FEATURES:append = " api-documentation" Setting this
 variable as shown here causes the OpenEmbedded build system to build the
 documentation and then include it in the standard SDK.
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index fc6b8b9d5c..841abac5aa 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -163,7 +163,7 @@ build the SDK installer. Follow these steps:
          SDK installer. Doing so ensures that the eventual SDK
          installation process installs the appropriate library packages
          as part of the SDK. Following is an example using ``libc``
-         static development libraries: TOOLCHAIN_TARGET_TASK_append = "
+         static development libraries: TOOLCHAIN_TARGET_TASK:append = "
          libc-staticdev"
 
 7. *Run the Installer:* You can now run the SDK installer from
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 2cdb06d65c..bdce0414e4 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -838,7 +838,7 @@ recipe.
 If you need to add runtime dependencies, you can do so by adding the
 following to your recipe::
 
-   RDEPENDS_${PN} += "dependency1 dependency2 ..."
+   RDEPENDS:${PN} += "dependency1 dependency2 ..."
 
 .. note::
 
-- 
2.25.1


Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.10464.1601817170431411287
 for <docs@lists.yoctoproject.org>;
 Sun, 04 Oct 2020 06:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232, mailfrom: foss@0leil.net)
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay12.mail.gandi.net (Postfix) with ESMTPA id A247B200006;
	Sun,  4 Oct 2020 13:12:47 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 1/3] docs: ref-manual: ref-system-requirements: update requirements to build Sphinx docs
Date: Sun,  4 Oct 2020 15:12:40 +0200
Message-Id: <20201004131242.61278-1-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested with containers on all supported distributions.

Debian 8 (Jessie) still has Python3.4 and an old pip3, which makes it
impossible to build typing module which is a requirement of "new" Sphinx
python module.

One cannot update to latest pip3 from within pip in Jessie's version.
One cannot get a newer pip from upstream because newer pip don't support
Python3.4 anymore.
One cannot build with python3-sphinx package from Jessie because the
package is too old (1.2.3) and does not have sphinx.ext.autosectionlabel
module which appeared in 1.4 version.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/poky.yaml                       |  1 +
 .../ref-manual/ref-system-requirements.rst    | 24 ++++++++++++-------
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index ec21271a3..946387795 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -87,3 +87,4 @@ CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel xterm \
      rpcgen mesa-libGL-devel"
+PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index b03a266ef..e0584fa05 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -141,7 +141,14 @@ supported Ubuntu or Debian Linux distribution:
    Yocto Project documentation manuals:
    ::
 
-      $ sudo apt-get install make xsltproc docbook-utils fop dblatex xmlto
+      $ sudo apt-get install make python3-pip
+      &PIP3_HOST_PACKAGES_DOC;
+
+   .. note::
+
+      It is currently not possible to build out documentation from Debian 8
+      (Jessie) because of outdated ``pip3`` and ``python3``. ``python3-sphinx``
+      is too outdated.
 
 Fedora Packages
 ---------------
@@ -159,8 +166,8 @@ supported Fedora Linux distribution:
    Yocto Project documentation manuals:
    ::
 
-      $ sudo dnf install  docbook-style-dsssl docbook-style-xsl \
-      docbook-dtds docbook-utils fop libxslt dblatex xmlto
+      $ sudo dnf install make python3-pip which
+      &PIP3_HOST_PACKAGES_DOC;
 
 openSUSE Packages
 -----------------
@@ -178,7 +185,8 @@ supported openSUSE Linux distribution:
    Yocto Project documentation manuals:
    ::
 
-      $ sudo zypper install dblatex xmlto
+      $ sudo zypper install make python3-pip which
+      &PIP3_HOST_PACKAGES_DOC;
 
 
 CentOS-7 Packages
@@ -207,8 +215,8 @@ supported CentOS-7 Linux distribution:
    Yocto Project documentation manuals:
    ::
 
-      $ sudo yum install docbook-style-dsssl docbook-style-xsl \
-      docbook-dtds docbook-utils fop libxslt dblatex xmlto
+      $ sudo yum install make python3-pip which
+      &PIP3_HOST_PACKAGES_DOC;
 
 CentOS-8 Packages
 -----------------
@@ -239,8 +247,8 @@ supported CentOS-8 Linux distribution:
    Yocto Project documentation manuals:
    ::
 
-      $ sudo dnf install docbook-style-dsssl docbook-style-xsl \
-      docbook-dtds docbook-utils fop libxslt dblatex xmlto
+      $ sudo dnf install make python3-pip which
+      &PIP3_HOST_PACKAGES_DOC;
 
 Required Git, tar, Python and gcc Versions
 ==========================================
-- 
2.26.2


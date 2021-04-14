Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.6095.1618359597468488457
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ZIYEkuVd;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id EBC5320B8003; Tue, 13 Apr 2021 17:19:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EBC5320B8003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618359596;
	bh=FteBJq6vnQRPSiGN+XC7l/jsSM0XSc0rDdOh3ZWMgDQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZIYEkuVdxn5WE/nOg1KA/ZiHCXGlHfk6VFlp+wgeEboXZSgGSt0hsJaNtsU5rDP97
	 9/x6i+XrNvS4mf2dmv0ProlYsDFmBpIR5+HschqYWu3DqkTXA6wcwhOWryURTVcNJF
	 Unt+Y83wnIQKXkj3UdaPpNdJpCNPkRZIyqcAVyDA=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 02/13] Use variables for minimum host versions and bump Python to 3.6
Date: Tue, 13 Apr 2021 17:19:43 -0700
Message-Id: <3f22dfaa1b2a535f1cb153e1f465bd69cfe3cfbb.1618358456.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Minimum Git, tar, Python and gcc versions are specified in quite a few
different places. Let's add some variables for these so there's no
chance of missing one if they're updated in future. Additionally, for
hardknott the minimum Python version is 3.6 so set that as the value for
Python.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/brief-yoctoprojectqs/index.rst     | 8 ++++----
 documentation/dev-manual/start.rst               | 8 ++++----
 documentation/poky.yaml                          | 4 ++++
 documentation/ref-manual/faq.rst                 | 2 +-
 documentation/ref-manual/system-requirements.rst | 8 ++++----
 5 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 7bba47e..974ae5e 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -60,10 +60,10 @@ following requirements:
 
 -
 
-   -  Git 1.8.3.1 or greater
-   -  tar 1.28 or greater
-   -  Python 3.5.0 or greater.
-   -  gcc 5.0 or greater.
+   -  Git &MIN_GIT_VERSION; or greater
+   -  tar &MIN_TAR_VERSION; or greater
+   -  Python &MIN_PYTHON_VERSION; or greater.
+   -  gcc &MIN_GCC_VERSION; or greater.
 
 If your build host does not meet any of these three listed version
 requirements, you can take steps to prepare the system so that you
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 3903618..84abf4c 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -314,13 +314,13 @@ Project Build Host:
    should be able to run on any modern distribution that has the
    following versions for Git, tar, Python and gcc.
 
-   -  Git 1.8.3.1 or greater
+   -  Git &MIN_GIT_VERSION; or greater
 
-   -  tar 1.28 or greater
+   -  tar &MIN_TAR_VERSION; or greater
 
-   -  Python 3.5.0 or greater.
+   -  Python &MIN_PYTHON_VERSION; or greater.
 
-   -  gcc 5.0 or greater.
+   -  gcc &MIN_GCC_VERSION; or greater.
 
    If your build host does not meet any of these three listed version
    requirements, you can take steps to prepare the system so that you
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index e0cf0b3..8ccb359 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -40,3 +40,7 @@ CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel xterm \
      rpcgen mesa-libGL-devel"
 PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
+MIN_PYTHON_VERSION : "3.6.0"
+MIN_TAR_VERSION : "1.28"
+MIN_GIT_VERSION : "1.8.3.1"
+MIN_GCC_VERSION : "5.0"
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 3b65588..64fdfdf 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -16,7 +16,7 @@ first before being pulled back into Poky. This practice benefits both
 projects immediately.
 
 **Q:** My development system does not meet the required Git, tar, and
-Python versions. In particular, I do not have Python 3.5.0 or greater.
+Python versions. In particular, I do not have Python &MIN_PYTHON_VERSION; or greater.
 Can I still use the Yocto Project?
 
 **A:** You can get the required tools on your host development system a
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 6edfa1a..dc619ce 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -256,11 +256,11 @@ Required Git, tar, Python and gcc Versions
 In order to use the build system, your host development system must meet
 the following version requirements for Git, tar, and Python:
 
--  Git 1.8.3.1 or greater
+-  Git &MIN_GIT_VERSION; or greater
 
--  tar 1.28 or greater
+-  tar &MIN_TAR_VERSION; or greater
 
--  Python 3.5.0 or greater
+-  Python &MIN_PYTHON_VERSION; or greater
 
 If your host development system does not meet all these requirements,
 you can resolve this by installing a ``buildtools`` tarball that
@@ -270,7 +270,7 @@ a pre-built tarball or use BitBake to build the tarball.
 In addition, your host development system must meet the following
 version requirement for gcc:
 
--  gcc 5.0 or greater
+-  gcc &MIN_GCC_VERSION; or greater
 
 If your host development system does not meet this requirement, you can
 resolve this by installing a ``buildtools-extended`` tarball that
-- 
1.8.3.1


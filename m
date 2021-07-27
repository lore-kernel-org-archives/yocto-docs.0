Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.4360.1627405929327837666
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 10:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9365FE0004;
	Tue, 27 Jul 2021 17:12:07 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 3/3] manuals: remove explicit BitBake variable references
Date: Tue, 27 Jul 2021 19:11:47 +0200
Message-Id: <20210727171147.132288-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727171147.132288-1-michael.opdenacker@bootlin.com>
References: <1695B21F5A0B37B5.3345@lists.yoctoproject.org>
 <20210727171147.132288-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The standard :term:`VARIABLE` will refer to the
description of the variable in the YP variable index. If it
doesn't exist, it will refer to the description of the variable
in the BitBake manual.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst        | 6 +++---
 documentation/migration-guides/migration-3.0.rst | 2 +-
 documentation/overview-manual/concepts.rst       | 6 ++----
 documentation/ref-manual/variables.rst           | 5 ++---
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index e46f6a84a7..d0099507a3 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -4384,7 +4384,7 @@ directory:
    variable, inherit the
    :ref:`own-mirrors <ref-classes-own-mirrors>`
    class, and use the
-   :term:`bitbake:BB_NO_NETWORK`
+   :term:`BB_NO_NETWORK`
    variable to your ``local.conf``.
    ::
 
@@ -4457,7 +4457,7 @@ variable for more information:
 -  :term:`BB_NUMBER_THREADS`:
    The maximum number of threads BitBake simultaneously executes.
 
--  :term:`bitbake:BB_NUMBER_PARSE_THREADS`:
+-  :term:`BB_NUMBER_PARSE_THREADS`:
    The number of threads BitBake uses during parsing.
 
 -  :term:`PARALLEL_MAKE`: Extra
@@ -9121,7 +9121,7 @@ BitBake has determined by doing the following:
 
    The output of ``bitbake-dumpsig`` also includes the value each
    variable had, a list of dependencies for each variable, and
-   :term:`bitbake:BB_HASHBASE_WHITELIST`
+   :term:`BB_HASHBASE_WHITELIST`
    information.
 
 There is also a ``bitbake-diffsigs`` command for comparing two
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 20c7026e8d..9a5f5714bd 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -194,7 +194,7 @@ The following BitBake changes have occurred.
    scripts that handles these two events need to be updated.
 
 -  The arguments passed to functions used with
-   :term:`bitbake:BB_HASHCHECK_FUNCTION`
+   :term:`BB_HASHCHECK_FUNCTION`
    have changed. If you are using your own custom hash check function,
    see :yocto_git:`/poky/commit/?id=40a5e193c4ba45c928fccd899415ea56b5417725`
    for details.
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 6377ebc000..4f8e6cb041 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1250,11 +1250,9 @@ download or setscene task fails, the build system then tries to install
 dependencies, such as the compiler, from the cache.
 
 The availability of objects in the sstate cache is handled by the
-function specified by the
-:term:`bitbake:BB_HASHCHECK_FUNCTION`
+function specified by the :term:`BB_HASHCHECK_FUNCTION`
 variable and returns a list of available objects. The function specified
-by the
-:term:`bitbake:BB_SETSCENE_DEPVALID`
+by the :term:`BB_SETSCENE_DEPVALID`
 variable is the function that determines whether a given dependency
 needs to be followed, and whether for any given relationship the
 function needs to be passed. The function returns a True or False value.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 55121f2c5a..b61de1993d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -762,8 +762,7 @@ system and gives an overview of their function and contents.
 
          export BBSERVER=localhost:$port
 
-      By default, :term:`BBSERVER` also appears in
-      :term:`bitbake:BB_HASHBASE_WHITELIST`.
+      By default, :term:`BBSERVER` also appears in :term:`BB_HASHBASE_WHITELIST`.
       Consequently, :term:`BBSERVER` is excluded from checksum and dependency
       data.
 
@@ -6500,7 +6499,7 @@ system and gives an overview of their function and contents.
 
       - :term:`CONF_VERSION`
       - :term:`BB_NUMBER_THREADS`
-      - :term:`bitbake:BB_NUMBER_PARSE_THREADS`
+      - :term:`BB_NUMBER_PARSE_THREADS`
       - :term:`PARALLEL_MAKE`
       - :term:`PRSERV_HOST`
       - :term:`SSTATE_MIRRORS` :term:`DL_DIR`
-- 
2.25.1


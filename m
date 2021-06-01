Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.2741.1622575872420802262
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jun 2021 12:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.193, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 36C96240003;
	Tue,  1 Jun 2021 19:31:09 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH] docs: ref-manual: variables: add missing links to terms glossary
Date: Tue,  1 Jun 2021 21:30:48 +0200
Message-Id: <20210601193048.9970-1-foss@0leil.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The automated script used back then didn't take into account that
terms could be lowercase which is the case for module_autoload and
module_conf, so let's add a link to those too.

Fixes: 9e468274eaad "docs: ref-manual: ref-variables: add links to terms in glossary"

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/variables.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index df6413b68..0f8a255cf 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4629,7 +4629,7 @@ system and gives an overview of their function and contents.
 
          do_foo[depends] += "${MLPREFIX}recipe:do_foo"
 
-   module_autoload
+   :term:`module_autoload`
       This variable has been replaced by the ``KERNEL_MODULE_AUTOLOAD``
       variable. You should replace all occurrences of ``module_autoload``
       with additions to ``KERNEL_MODULE_AUTOLOAD``, for example::
@@ -4642,7 +4642,7 @@ system and gives an overview of their function and contents.
 
       See the :term:`KERNEL_MODULE_AUTOLOAD` variable for more information.
 
-   module_conf
+   :term:`module_conf`
       Specifies `modprobe.d <https://linux.die.net/man/5/modprobe.d>`_
       syntax lines for inclusion in the ``/etc/modprobe.d/modname.conf``
       file.
-- 
2.20.1


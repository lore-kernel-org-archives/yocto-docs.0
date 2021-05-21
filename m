Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.6889.1621591065094994928
 for <docs@lists.yoctoproject.org>;
 Fri, 21 May 2021 02:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:56122 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lk1ub-000210-Sg
	for docs@lists.yoctoproject.org; Fri, 21 May 2021 05:57:44 -0400
Date: Fri, 21 May 2021 05:57:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add links to some variables in glossary
Message-ID: <1bccf6a-c79-cb46-a04-2fb4a2ed8c6b@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


Add some links to a small set of glossary variables that I happened
to be perusing at the time.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

commit ab92c97908bf80b1148f67121c692183b3c47ffc
Author: Robert P. J. Day <rpjday@crashcourse.ca>
Date:   Fri May 21 05:55:32 2021 -0400

    add links to some vars in glossary

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0b61f77cb..5c15bb351 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1525,10 +1525,10 @@ system and gives an overview of their function and contents.

    :term:`DEBUG_BUILD`
       Specifies to build packages with debugging information. This
-      influences the value of the ``SELECTED_OPTIMIZATION`` variable.
+      influences the value of the :term:`SELECTED_OPTIMIZATION` variable.

    :term:`DEBUG_OPTIMIZATION`
-      The options to pass in ``TARGET_CFLAGS`` and ``CFLAGS`` when
+      The options to pass in :term:`TARGET_CFLAGS` and :term:`CFLAGS` when
       compiling a system for debugging. This variable defaults to "-O
       -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe".

@@ -1538,7 +1538,7 @@ system and gives an overview of their function and contents.
       The most common usage of this is variable is to set it to "-1" within
       a recipe for a development version of a piece of software. Using the
       variable in this way causes the stable version of the recipe to build
-      by default in the absence of ``PREFERRED_VERSION`` being used to
+      by default in the absence of :term:`PREFERRED_VERSION` being used to
       build the development version.

       .. note::
@@ -2579,7 +2579,7 @@ system and gives an overview of their function and contents.
       Set the variable to "1" to force the removal of these packages.

    :term:`FULL_OPTIMIZATION`
-      The options to pass in ``TARGET_CFLAGS`` and ``CFLAGS`` when
+      The options to pass in :term:`TARGET_CFLAGS` and :term:`CFLAGS` when
       compiling an optimized system. This variable defaults to "-O2 -pipe
       ${DEBUG_FLAGS}".

@@ -6691,8 +6691,8 @@ system and gives an overview of their function and contents.
       value of the :term:`TARGET_CFLAGS` variable.

       The ``SELECTED_OPTIMIZATION`` variable takes the value of
-      ``FULL_OPTIMIZATION`` unless ``DEBUG_BUILD`` = "1". If that is the
-      case, the value of ``DEBUG_OPTIMIZATION`` is used.
+      :term:`FULL_OPTIMIZATION` unless :term:`DEBUG_BUILD` = "1", in which
+      case the value of :term:`DEBUG_OPTIMIZATION` is used.

    :term:`SERIAL_CONSOLE`
       Defines a serial console (TTY) to enable using

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
